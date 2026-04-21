-- Barra superior: "tabs" = tabby + pestañas :tab | "buffers" = bufferline (buffers como pestañas)
-- Puedes fijarlo aquí o en init.lua antes de require("config.core"):  vim.g.ultra_tab_bar = "buffers"
vim.g.ultra_tab_bar = vim.g.ultra_tab_bar or "tabs"

vim.opt.title = true
vim.opt.titlestring = "Ultra Nvim — %t"

local set = vim.opt

set.wildmenu = true

set.number = true
set.relativenumber = true

set.cursorline = true
set.virtualedit = "onemore"
set.showmode = false
set.signcolumn = "yes"
set.termguicolors = true

set.tabstop = 2
set.softtabstop = 0
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.showtabline = 2

set.mouse = "a"

set.backspace = "indent,eol,start"

set.wrap = false
set.breakindent = true

set.updatetime = 250
set.timeoutlen = 400

set.undofile = true
set.swapfile = false
set.backup = false
set.writebackup = false

set.splitbelow = true
set.splitright = true

set.ignorecase = true
set.smartcase = true

set.clipboard:append("unnamedplus")

set.scrolloff = 8
set.sidescrolloff = 8
set.confirm = true

set.foldlevel = 99
