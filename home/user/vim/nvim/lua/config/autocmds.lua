-- Add custom autocmds here.

-- Test comment for autoread behavior.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "WinEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Reload files changed outside Neovim",
  command = "checktime",
})
