-- Main file for the addr2line_navigator plugin

local M = {}

-- Default configuration
local config = {
  addr2line_path = "addr2line", -- User can override this
  executable_path = nil,       -- If nil, plugin will try to infer it
  default_executable = "a.out", -- Fallback if executable_path is nil and cannot be inferred
  addr2line_options = "-Cspf", -- Options for addr2line
  debug = false, -- Set to true for verbose logging
}

-- Function to allow users to override default config
function M.setup_config(user_config)
  user_config = user_config or {}
  for k, v in pairs(user_config) do
    if config[k] ~= nil then
      config[k] = v
    else
      print("Warning: Unknown configuration key for addr2line_navigator: " .. k)
    end
  end

  -- Check if addr2line is executable
  if vim.fn.executable(config.addr2line_path) == 0 then
    vim.notify(string.format("addr2line utility not found or not executable at: %s", config.addr2line_path), vim.log.levels.ERROR)
    -- Optionally, could disable the plugin or parts of it here
  end
end

function M.get_executable_path(dump_file_path)
  if config.executable_path then
    return config.executable_path
  end
  if dump_file_path then
    local inferred_exe = vim.fn.fnamemodify(dump_file_path, ":r") -- remove .dump extension
    if vim.fn.filereadable(inferred_exe) == 1 and vim.fn.executable(inferred_exe) == 1 then
      if config.debug then print("Inferred executable: " .. inferred_exe) end
      return inferred_exe
    elseif vim.fn.filereadable(inferred_exe .. ".elf") == 1 and vim.fn.executable(inferred_exe .. ".elf") == 1 then -- common practice
      if config.debug then print("Inferred executable: " .. inferred_exe .. ".elf") end
      return inferred_exe .. ".elf"
    end
  end
  if config.debug then print("Using default executable: " .. config.default_executable) end
  return config.default_executable
end

function M.setup_autocommands()
  if config.debug then print("addr2line_navigator setup_autocommands called.") end
  local group = vim.api.nvim_create_augroup("Addr2lineNavigator", { clear = true })

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.dump",
    group = group,
    callback = function(autocmd_args)
      if config.debug then print("Dump file opened: " .. autocmd_args.file .. " (buf: " .. autocmd_args.buf .. ")") end
      -- Enable cursor move listener for this buffer
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = autocmd_args.buf,
        group = group,
        callback = function()
          M.handle_cursor_moved(autocmd_args.buf, autocmd_args.file)
        end,
        desc = "Call addr2line on cursor move in dump file",
      })
    end,
    desc = "Activate addr2line navigation for .dump files",
  })
end

function M.handle_cursor_moved(buffer_nr, dump_file_path)
  if vim.fn.executable(config.addr2line_path) == 0 then
    -- Already notified in setup_config, but good to prevent further action
    return
  end

  local current_line = vim.api.nvim_get_current_line()
  if current_line == nil or current_line == "" then
    return
  end

  -- 1. Parse Address
  local address = current_line:match("^([0-9a-fA-Fx]+):?")
  if not address then
    address = current_line:match("^([0-9a-fA-Fx]+)")
  end

  if not address then
    if config.debug then print("No address found on line: " .. current_line) end
    return
  end

  local executable_path = M.get_executable_path(dump_file_path)
  if vim.fn.filereadable(executable_path) == 0 then
    if config.debug then print("Executable not found or not readable: " .. executable_path) end
    -- Notify only once per executable to avoid spam
    if M.last_notified_missing_exe ~= executable_path then
        vim.notify(string.format("addr2line: Executable '%s' not found for dump '%s'.", executable_path, dump_file_path), vim.log.levels.WARN)
        M.last_notified_missing_exe = executable_path
    end
    return
  end
  M.last_notified_missing_exe = nil -- Reset if found

  -- 2. Call addr2line
  local cmd_parts = {config.addr2line_path}
  if config.addr2line_options and config.addr2line_options ~= "" then
      for opt in string.gmatch(config.addr2line_options, "%S+") do
          table.insert(cmd_parts, opt)
      end
  end
  table.insert(cmd_parts, "-e")
  table.insert(cmd_parts, executable_path)
  table.insert(cmd_parts, address)

  if config.debug then print("Running command: " .. table.concat(cmd_parts, " ")) end
  local output = vim.fn.system(cmd_parts)
  local shell_error = vim.v.shell_error

  -- Trim whitespace and newline characters from output
  output = output:gsub("^%s*(.-)%s*$", "%1")

  if shell_error ~= 0 or output == "" then
    if config.debug or (output and output:match("^addr2line:")) then -- Only print actual addr2line errors, not just "??:0"
        print(string.format("addr2line failed (code %d) for %s with %s: %s", shell_error, address, executable_path, output))
    end
    return
  end

  -- 3. Parse addr2line Output
  local file_path, line_number_str = output:match("([^:]+):(%d+)")
  if not file_path or not line_number_str then
     file_path, line_number_str = output:match("(%S+):(%d+)") -- Fallback
  end

  if not file_path or file_path == "??" or file_path == "" or file_path:match("^/") == nil then -- often ?? means not found, or relative path
    if config.debug then print("Could not parse addr2line output or invalid source: '" .. output .. "'") end
    return
  end

  local line_number = tonumber(line_number_str)
  if not line_number or line_number == 0 then
    if config.debug then print("Invalid line number from addr2line: '" .. output .. "'") end
    return
  end

  -- Prevent feedback loop
  local current_buf_name = vim.api.nvim_buf_get_name(0)
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local abs_file_path = vim.fn.fnamemodify(file_path, ":p")

  if current_buf_name == abs_file_path and current_pos[1] == line_number then
    if config.debug then print("Already at the target location: " .. abs_file_path .. ":" .. line_number) end
    return
  end

  -- 4. Open Tab
  if vim.fn.filereadable(abs_file_path) == 0 then
    if config.debug then print("Source file not found or not readable: " .. abs_file_path) end
    vim.notify(string.format("addr2line: Source file '%s' not found or not readable.", abs_file_path), vim.log.levels.WARN)
    return
  end

  if config.debug then print("Opening: " .. abs_file_path .. " at line " .. line_number) end
  vim.cmd(string.format("tabnew +%d %s", line_number, vim.fn.fnameescape(abs_file_path)))
end

-- Call setup_config first, then setup autocommands
M.setup_config() -- Load default config / check for user config if plugin structure supported it
M.setup_autocommands()

return M
