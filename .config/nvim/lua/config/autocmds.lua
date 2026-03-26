-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Remove background/italic from keywords so they don't look highlighted
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local groups = {
      "@keyword",
      "@keyword.modifier",
      "@keyword.coroutine",
      "@keyword.return",
      "@keyword.typescript",
      "@lsp.type.keyword",
    }
    for _, g in ipairs(groups) do
      local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
      if next(hl) then
        hl.bg = nil
        hl.italic = false
        vim.api.nvim_set_hl(0, g, hl)
      end
    end
  end,
})
vim.cmd("doautocmd ColorScheme")
