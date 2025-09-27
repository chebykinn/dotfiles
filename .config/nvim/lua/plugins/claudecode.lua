return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical",
      },
      git = {
        use_git_root = false,
      },
    })
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        if string.find(buf_name, "claude-") then
          vim.bo.buflisted = false
        end
      end,
    })
  end,
}
