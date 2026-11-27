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

local function fix_nix_semicolons()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local stack = {}
  local in_multiline_str = false
  local count = 0

  for i, line in ipairs(lines) do
    local scan = line
    local in_str = false
    local code_chars = {}
    local idx = 1

    while idx <= #scan do
      local c = scan:sub(idx, idx)
      local two = scan:sub(idx, idx + 1)

      if not in_str and two == "''" then
        in_multiline_str = not in_multiline_str
        idx = idx + 2
      elseif not in_multiline_str and c == '"' and scan:sub(idx - 1, idx - 1) ~= "\\" then
        in_str = not in_str
        idx = idx + 1
      elseif not in_str and not in_multiline_str and c == "#" then
        break
      else
        if not in_str and not in_multiline_str then
          table.insert(code_chars, c)
        end
        idx = idx + 1
      end
    end

    local code = table.concat(code_chars)
    local should_add_semi = false

    for c in code:gmatch(".") do
      if c == "{" or c == "[" then
        table.insert(stack, c)
      elseif c == "}" or c == "]" then
        table.remove(stack)
        local parent = stack[#stack]
        if parent and parent ~= "[" then
          should_add_semi = true
        else
          should_add_semi = false
        end
      end
    end

    local trimmed_code = code:gsub("%s+$", "")
    if should_add_semi and trimmed_code:match("[}%]]$") then
      local pre, comment = line:match("^(.-)(%s*#.*)$")
      if pre then
        lines[i] = pre:gsub("%s+$", "") .. ";" .. comment
      else
        lines[i] = line:gsub("%s+$", "") .. ";"
      end
      count = count + 1
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.notify("Added " .. count .. " semicolon(s)", vim.log.levels.INFO)
end

vim.api.nvim_buf_create_user_command(0, "NixSemicolons", fix_nix_semicolons, {})
vim.keymap.set("n", "<leader>c;", fix_nix_semicolons, {
  buffer = true,
  desc = "Add missing semicolons to Nix bindings (Treesitter)",
})

vim.bo.indentexpr = "v:lua.nix_simple_indent()"
