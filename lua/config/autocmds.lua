-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("AutoChangeDir", { clear = true }),
--   callback = function()
--     vim.cmd("lcd %:p:h")
--     local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
--     if git_root and git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
--       vim.cmd("lcd " .. vim.fn.fnameescape(git_root))
--     else
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("resize 7") -- Set the terminal window height to 7 lines
  end,
})
