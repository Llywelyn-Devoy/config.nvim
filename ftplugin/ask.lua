function string:split(delimiter)
  local result = {}
  local from = 1
  local delim_from, delim_to = string.find(self, delimiter, from)
  while delim_from do
    table.insert(result, string.sub(self, from, delim_from - 1))
    from = delim_to + 1
    delim_from, delim_to = string.find(self, delimiter, from)
  end
  table.insert(result, string.sub(self, from))
  return result
end

vim.api.nvim_create_user_command('RunAsk', function()
  local filepath = vim.fn.expand '%:p'
  local ask_cmd = string.format('ask "%s"', filepath)
  local ask_output = vim.fn.system(ask_cmd)

  local buf = vim.api.nvim_get_current_buf()
  local buf_len = vim.api.nvim_buf_line_count(buf)
  local lines = ask_output:split '\n'
  -- for some reason a new line is added so remove
  -- the last line
  table.remove(lines, #lines)

  vim.api.nvim_buf_set_lines(buf, 0, buf_len, true, lines)
end, {})

vim.keymap.set('n', '<tab>', ':RunAsk<CR>', { noremap = true, silent = true })
