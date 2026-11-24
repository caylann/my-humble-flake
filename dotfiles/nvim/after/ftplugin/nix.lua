vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = false
vim.bo.cindent = false

_G.nix_simple_indent = function()
  local lnum = vim.v.lnum
  local prev = vim.fn.prevnonblank(lnum - 1)
  if prev == 0 then
    return 0
  end

  local prev_line = vim.fn.getline(prev)
  local curr_line = vim.fn.getline(lnum)
  local indent = vim.fn.indent(prev)

  if prev_line:match("[{%[]%s*$") then
    indent = indent + 2
  end

  if curr_line:match("^%s*[}%]]") then
    indent = indent - 2
  end

  return math.max(0, indent)
end

vim.bo.indentexpr = "v:lua.nix_simple_indent()"
