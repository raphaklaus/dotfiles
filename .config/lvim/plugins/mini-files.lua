require('mini.files').setup()

minifiles_open_buffer_path = function()
  local path = vim.bo.buftype ~= "nofile" and vim.api.nvim_buf_get_name(0) or nil
  MiniFiles.open(path)
end

vim.api.nvim_set_keymap('n', '<Space>z', ':lua minifiles_open_buffer_path()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Space>x', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true })
-- lvim.keys.normal_mode['<leader>z'] = ':lua MiniFiles.open()<CR>'
