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

-- Open BrowserSync menu
vim.keymap.set("n", "<leader>p", '<cmd>WhichKey "<leader>p"<CR>', { desc = "🔄 Open BrowserSync menu" })

-- Start BrowserSync and TypeScript Compiler
vim.keymap.set("n", "<leader>ps", function()
  -- Start TypeScript compiler in watch mode
  vim.system({ "tsc", "--watch" }, { detach = true })

  -- Start BrowserSync
  vim.system({ "browser-sync", "start", "--server", "--files", "*.html,*.css,*.js,*.ts" }, { detach = true })

  print("✅ TypeScript compiler and BrowserSync server started!")
end, { desc = "Start TypeScript and BrowserSync Server" })

-- Stop BrowserSync processes
vim.keymap.set("n", "<leader>pq", function()
  -- Kill all BrowserSync processes
  vim.cmd("!ps aux | grep '[b]rowser-sync' | awk '{print $2}' | xargs kill")
  print("🛑 All BrowserSync processes stopped!")
end, { desc = "Stop All BrowserSync Processes" })

vim.keymap.set("n", "K", function()
  local curr_pos = vim.api.nvim_win_get_cursor(0)
  local line = curr_pos[1] - 1
  local col = curr_pos[2]
  local diagnostics = vim.diagnostic.get(0)

  local msgs = {}
  for _, d in ipairs(diagnostics) do
    if d.lnum == line and col >= d.col and col <= d.end_col then
      table.insert(msgs, d.message)
    end
  end

  if #msgs > 0 then
    vim.lsp.util.open_floating_preview(msgs, "plaintext", {
      border = "rounded",
    })
  else
    vim.lsp.buf.hover()
  end
end, { desc = "Show diagnostics at cursor or LSP hover" })
