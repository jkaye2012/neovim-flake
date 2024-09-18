local filetype_group = vim.api.nvim_create_augroup('filetype_group', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.opt_local.textwidth = 120
  end,
  group = filetype_group
})
