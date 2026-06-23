vim.keymap.set("i", "jj", "<Esc>", { silent = true })

vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file path to copy", vim.log.levels.WARN)
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy absolute path" })

vim.keymap.set("n", "<leader>YP", function()
  local absolute_path = vim.fn.expand("%:p")
  if absolute_path == "" then
    vim.notify("No file path to copy", vim.log.levels.WARN)
    return
  end

  -- Normalize relative paths from the Git root so they do not depend on how the file was opened.
  local root = vim.fs.root(vim.fs.dirname(absolute_path), { ".git" }) or vim.uv.cwd()
  local path = vim.fs.relpath(root, absolute_path) or vim.fn.fnamemodify(absolute_path, ":.")
  if path == "" then
    vim.notify("No file path to copy", vim.log.levels.WARN)
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy relative path" })
