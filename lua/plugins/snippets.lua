return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.expand("~/.config/nvim/snippets/bootstrap.json") },
      })
    end,
  },
}
