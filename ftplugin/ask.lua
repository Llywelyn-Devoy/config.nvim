local buffer_to_string = function()
  local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  return table.concat(content, '\n')
end

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

local split_into_lines = function(str)
  local lines = {}
  for line in str:gmatch '(.-)\n' do
    table.insert(lines, line)
  end
  -- Handle the last line if it doesn't end with a newline
  if str:sub(-1) == '\n' then
    table.insert(lines, '')
  end
  return lines
end

vim.api.nvim_create_user_command('RunAsk', function()
  local filepath = vim.fn.expand '%:p'
  local ask_cmd = string.format('ask "%s"', filepath)
  local ask_output = vim.fn.system(ask_cmd)

  local buf = vim.api.nvim_get_current_buf()
  local buf_len = vim.api.nvim_buf_line_count(buf)
  local lines = split_into_lines(ask_output)

  vim.api.nvim_buf_set_lines(buf, 0, buf_len, true, lines)
end, {})

vim.keymap.set('n', '<tab>', ':RunAsk<CR>', { noremap = true, silent = true })
