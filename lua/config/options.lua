-- Leader key
vim.g.mapleader = " "

-- Core options
vim.opt.number = true
vim.opt.relativenumber = true  -- Optional: relative line numbers
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.clipboard = "unnamedplus"

-- Highlight current line
vim.opt.cursorline = true

-- Persistent Undo
vim.opt.undofile = true

-- Smart Searching
vim.opt.ignorecase = true      -- Ignore case when searching
vim.opt.smartcase = true       -- ...unless search contains uppercase letters
vim.opt.hlsearch = true        -- Highlight search matches
vim.opt.incsearch = true       -- Show matches dynamically while typing

-- Tab & Indentation options (from image)
vim.opt.expandtab = true       -- Convert tabs to spaces
vim.opt.shiftwidth = 4        -- Amount of spaces for auto-indentation
vim.opt.tabstop = 4           -- How many spaces a tab displays as
vim.opt.softtabstop = 4       -- How many spaces Tab key inserts
vim.opt.smarttab = true        -- Insert shiftwidth spaces at line start
vim.opt.smartindent = true     -- Auto-indent new lines based on syntax/code blocks
vim.opt.autoindent = true      -- Copy indent from previous line

vim.opt.updatetime = 100
vim.opt.showmode = false
vim.opt.mouse = "a"

vim.opt.scrolloff = 4

-- Render whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  nbsp = "␣",
}

-- Highlight text briefly after yanking
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   desc = "Highlight when yanking (copying) text",
--   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
