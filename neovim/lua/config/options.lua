-- remove the bottom status line on VimEnter or InsertEnter events
-- (startup and when you change to insert mode)
-- it's a hinky fix using an autocmd tied to those events... all I can think to do
vim.api.nvim_create_autocmd({'VimEnter', 'InsertEnter'}, {
  callback = function()
    vim.o.laststatus = 0
  end,
})
