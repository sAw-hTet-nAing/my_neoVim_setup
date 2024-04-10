vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt 

opt.relativenumber = true
opt.number = true

--tab & indentaition
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

--seach setting
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

--turn on termguicolors to work tokyonight scheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipBaord
opt.clipboard:append("unnamedplus" )


--split windows
opt.splitright = true
opt.splitbelow = true

