-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = false
opt.number = true
opt.conceallevel = 0
opt.concealcursor = ""

vim.lsp.inlay_hint.enable(false)

vim.g.root_spec = { "cwd" }
