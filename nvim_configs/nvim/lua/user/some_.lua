--  Keymap: Toggle themes
vim.keymap.set("n", "<leader>ut", function()
  local current = vim.g.colors_name
  if current == "nordic" then
    vim.cmd("colorscheme tokyonight")
  else
    vim.cmd("colorscheme nordic")
  end
  print("Switched theme to " .. vim.g.colors_name)
end, { desc = "Toggle between Nordic and TokyoNight" })

