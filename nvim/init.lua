pcall(require,"impatient")

-- Turn off builtin plugins I do not use.
require "config.disable_builtins"

if require "config.install_packer"() then
  return
end

local utils = require "config.utils"
local opt = utils.opt
local cmd = vim.cmd
local g = vim.g

-- Load debug tools
--require "config.debug_tools"

-- Leader key -> ","
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
g.mapleader = ","

pcall(require,"packer_compiled")

-- Colorscheme
opt('termguicolors', true)
opt("background", 
  string.match(vim.api.nvim_eval([[system("defaults read -g AppleInterfaceStyle")]]), "^Dark") 
  and "dark" 
  or "light")
cmd [[colorscheme PaperColor]]

-- Commands
-- You can install all packages from CLI with:
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]

-- Settings
local buffer = { o, bo }
local window = { o, wo }
-- Tame tab settings; thanks https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
opt("tabstop", 4, buffer)
opt("shiftwidth", 4, buffer)
opt("softtabstop", 4, buffer)
opt("expandtab", true, buffer)
opt("smartindent", true, buffer)
-- These two options, when set together, will make /-style searches
-- case-sensitive only if there is a capital letter in the search expression.
-- *-style searches continue to be consistently case-sensitive.
opt("ignorecase", true)
opt("smartcase", true)

