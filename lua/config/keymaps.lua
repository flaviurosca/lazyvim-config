-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit modes using 'kj'
-- vim.keymap.set({ "i", "v", "c", "t", "o" }, "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({ "i", "v", "c", "t", "o" }, "kj", function()
  if vim.fn.mode() == "t" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  end
end, { noremap = true, silent = true, desc = "Exit modes with kj" })

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
