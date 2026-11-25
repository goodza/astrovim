-- Neovim 0.12's Markdown Vimscript and Lua ftplugins both undo these maps.
-- Keep the Vimscript cleanup so FileType replay doesn't try to unmap them twice.
local undo = vim.b.undo_ftplugin
if undo and undo:find('nunmap <buffer> [[|', 1, true) and undo:find('nunmap <buffer> ]]|', 1, true) then
  local duplicate = '\n sil! exe "nunmap <buffer> ]]" | sil! exe "nunmap <buffer> [["'
  local start, stop = undo:find(duplicate, 1, true)
  if start then vim.b.undo_ftplugin = undo:sub(1, start - 1) .. undo:sub(stop + 1) end
end
