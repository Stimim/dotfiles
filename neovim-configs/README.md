# Neovim Configuration

This repository contains my personal Neovim configuration, optimized for Lua, C/C++, Python, and general development. It uses `lazy.nvim` for plugin management and features a modern stack with Treesitter and LSP integration.

## Setup Guide

### Prerequisites
- **Neovim v0.10+** (v0.12+ recommended)
- A **Nerd Font** installed and set in your terminal (required for icons).
- Git, `curl`, and a C compiler (gcc/clang) for installing plugins and parsers.

### Installation
Run the setup script from this directory to link the configuration and install dependencies:

```bash
./setup.sh
```

This script will:
1. Link this directory to `~/.config/nvim`.
2. Install all plugins via `lazy.nvim`.
3. Install `tree-sitter-cli` via Mason (required for compiling Treesitter parsers).

When you first open Neovim after setup, it will automatically download and compile the default Treesitter parsers (Lua, Vim, C, C++, Python, Markdown, YAML).

## Keybindings

This configuration uses the following keybindings (Leader key is set to **`Space`**):

### 💡 Autocomplete (blink.cmp - Default Preset)
When the autocomplete menu is visible (Insert Mode):
*   **`<C-n>`** or **`<Down>`**: Select the next item.
*   **`<C-p>`** or **`<Up>`**: Select the previous item.
*   **`<C-y>`**: Accept/confirm the selected suggestion.
*   **`<C-e>`**: Cancel/hide the completion menu.
*   **`<C-space>`**: Trigger autocomplete manually (or toggle documentation popup).
*   **`<Tab>`** / **`<S-Tab>`**: Jump forward/backward through snippet placeholders (when in a snippet).
*   **`<C-b>`** / **`<C-f>`**: Scroll documentation window up/down.
*   **`<C-k>`**: Toggle signature help.

### 🔍 LSP / Code Navigation
Active when a language server (LSP) is attached to the buffer:
*   **`gd`**: Go to definition (`vim.lsp.buf.definition`).
*   **`gD`**: Go to declaration (`vim.lsp.buf.declaration`).
*   **`gi`**: Go to implementation (`vim.lsp.buf.implementation`).
*   **`gr`**: Show all references (in a list) (`vim.lsp.buf.references`).
*   **`K`**: Show hover documentation (`vim.lsp.buf.hover`). Press twice to jump into the popup window.
*   **`gs`**: Show signature help (`vim.lsp.buf.signature_help`).
*   **`<leader>rn`**: Rename symbol under cursor (project-wide) (`vim.lsp.buf.rename`).
*   **`<space>ca`**: Show code actions (available fixes/refactorings) (`vim.lsp.buf.code_action`).
*   **`<leader>D`**: Go to type definition (`vim.lsp.buf.type_definition`).
*   **`<leader>wa`** / **`<leader>wr`**: Add/Remove workspace folder.
*   **`<leader>wl`**: List workspace folders.

### 🔎 Fuzzy Finder (Telescope)
*   **`<leader>ff`**: Find Files (by name in project).
*   **`<leader>f/`**: Live Grep (search text in all project files).
*   **`<leader>fb`**: Find open Buffers.
*   **`<leader>fh`**: Find Help tags.
*   **`<leader>fr`**: Find Recent files.
*   **`<leader>fs`**: Find LSP document symbols (functions, variables, etc.).
*   **`<leader>fS`**: Find LSP workspace symbols.
*   **`<leader>gf`**: Find Git files (tracked files).
*   **`<leader>gc`**: Find Git Commits.

### 📌 Harpoon (Fast Navigation)
*   **`<leader>hm`**: Add current file to Harpoon list.
*   **`<C-e>`**: Toggle Harpoon quick menu (Normal mode).
*   **`<leader>hp`**: Jump to previous Harpoon file.
*   **`<leader>hn`**: Jump to next Harpoon file.

### 📁 File Management
*   **`<leader>do`**: Open **Oil** (edit filesystem like a text buffer).
*   **`<leader>dd`**: Toggle **Neo-tree** (sidebar file tree explorer).

### 🚨 Diagnostics
*   **`<leader>xx`**: Toggle **Trouble** diagnostics list.

### 🖥️ Tmux Integration (Normal Mode)
*   **`<C-h>`**: Navigate to the left split/pane.
*   **`<C-j>`**: Navigate to the bottom split/pane.
*   **`<C-k>`**: Navigate to the top split/pane.
*   **`<C-l>`**: Navigate to the right split/pane.

### ✍️ Editing Utilities
*   **Vim Sandwich (Surround)**:
    *   `sa{motion}{char}`: Add surrounding `{char}` around `{motion}` (e.g. `saw"` to surround word with `"`).
    *   `sd{char}`: Delete surrounding `{char}`.
    *   `sr{char1}{char2}`: Replace surrounding `{char1}` with `{char2}`.
    *   `s{char}` (in Visual Mode): Add surrounding `{char}` around selection.
*   **Vim Table Mode**:
    *   **`<leader>tm`**: Toggle Markdown Table Mode (automatically formats tables as you type `|`).

---

## Plugins Overview

Here is a breakdown of the plugins used in this configuration:

### ⚙️ Core & Plugin Management
*   **[lazy.nvim](https://github.com/folke/lazy.nvim)**: A modern, fast plugin manager for Neovim.

### 💻 LSP & Completion
*   **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Quickstart configurations for Neovim's built-in LSP client.
*   **[blink.cmp](https://github.com/Saghen/blink.cmp)**: An extremely fast, Rust-based completion engine.
*   **[lazydev.nvim](https://github.com/folke/lazydev.nvim)**: Configures LuaLS for Neovim API and plugin development (successor to `neodev`).
*   **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippet engine for Neovim.
*   **[vim-snippets](https://github.com/honza/vim-snippets)**: A collection of snippets for various languages.
*   **[trouble.nvim](https://github.com/folke/trouble.nvim)**: A pretty list for showing diagnostics, references, telescope results, etc.
*   **[mason.nvim](https://github.com/williamboman/mason.nvim)** & **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**: Easily install and manage LSP servers, linters, and formatters from within Neovim.

### 🌳 Treesitter (Syntax & Context)
*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides advanced syntax highlighting and code analysis.
*   **[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)**: Shows the code context (e.g., current function header) at the top of the screen as you scroll.

### 🔍 Search & Navigation
*   **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extensible fuzzy finder for files, buffers, grep, and more.
*   **[harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)**: Quickly bookmarked files for rapid switching.

### 📁 File Explorers
*   **[oil.nvim](https://github.com/stevearc/oil.nvim)**: File explorer that lets you edit the filesystem like a normal Neovim buffer.
*   **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: A modern sidebar file tree explorer.

### 🐙 Git Integration
*   **[vim-fugitive](https://github.com/tpope/vim-fugitive)**: The premier Git wrapper for Vim/Neovim.

### 🖥️ UI & Usability
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and easy-to-configure statusline.
*   **[which-key.nvim](https://github.com/folke/which-key.nvim)**: Popups up keybinding suggestions when you start typing a key combination.
*   **[noice.nvim](https://github.com/folke/noice.nvim)**: Highly experimental UI that replaces the command line, messages, and popupmenu.
*   **[nui.nvim](https://github.com/MunifTanjim/nui.nvim)**: UI component library (dependency for `noice` and `neo-tree`).
*   **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**: Dev icons for file explorers and statuslines.
*   **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**: Adds indentation guides to your code.

### 🔌 Tmux Integration
*   **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**: Seamless navigation between Tmux panes and Neovim splits.
*   **[vimux](https://github.com/preservim/vimux)**: Run command-line commands in a Tmux pane from Neovim.

### ✍️ Editing Utilities
*   **[vim-sandwich](https://github.com/machakann/vim-sandwich)**: Easily search, select, and edit surrounding characters (quotes, brackets, tags).
*   **[vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)**: An automatic table creator and formatter (useful for Markdown tables).

### 🎨 Colorscheme
*   **[catppuccin](https://github.com/catppuccin/nvim)**: A soothing, high-contrast colorscheme.

---

## Local Testing Guide

If you want to test this configuration without affecting your main `~/.config/nvim` setup, you can use the following script:

```bash
PREFIX=./neovim-testing
FAKE_CONFIG_HOME="${PREFIX}/fake-config-home"
FAKE_DATA_HOME="${PREFIX}/fake-data-home"

mkdir -p "${FAKE_CONFIG_HOME}" "${FAKE_DATA_HOME}"

# Link this config to the fake config home
ln -s $(pwd) "${FAKE_CONFIG_HOME}/nvim"

# Run Neovim with isolated paths
XDG_CONFIG_HOME="${FAKE_CONFIG_HOME}" XDG_DATA_HOME="${FAKE_DATA_HOME}" nvim
```
