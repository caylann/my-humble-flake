vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c" },
  callback = function()
    vim.b.autoformat = false
  end,
})
