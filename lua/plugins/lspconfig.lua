return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {},
        tailwindcss = {},
        emmet_ls = {
          filetypes = { "html", "css" },
        },
      },
    },
  },
}
