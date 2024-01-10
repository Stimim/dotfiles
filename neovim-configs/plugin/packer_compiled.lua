-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/usr/local/google/home/stimim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/usr/local/google/home/stimim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/usr/local/google/home/stimim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/usr/local/google/home/stimim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/usr/local/google/home/stimim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  fzf = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rbind_fzf\19stimim.keymaps\frequire\0" },
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  indentLine = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\tjson\rmarkdown\31indentLine_fileTypeExclude\6g\bvim\0" },
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22stimim/statusline\frequire\0" },
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18bind_nerdtree\19stimim/keymaps\frequire\0" },
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/scrooloose/nerdtree"
  },
  ["nvim-markdown"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/nvim-markdown",
    url = "https://github.com/ixru/nvim-markdown"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vimux = {
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/benmills/vimux"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/usr/local/google/home/stimim/dotfiles/neovim-testing/fake-data-home/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indentLine
time([[Config for indentLine]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\tjson\rmarkdown\31indentLine_fileTypeExclude\6g\bvim\0", "config", "indentLine")
time([[Config for indentLine]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18bind_nerdtree\19stimim/keymaps\frequire\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rbind_fzf\19stimim.keymaps\frequire\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22stimim/statusline\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
