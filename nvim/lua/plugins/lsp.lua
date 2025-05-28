return{
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {"vim", "require", "opts"}
              },
            },
          }
        },
        ts_ls = {},
        eslint = {},
        pyright = {},
        clangd = {},
        tailwindcss = {},
        html = {}
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
      })

      for server, config in pairs(opts.servers) do
       vim.lsp.config(server,config)
       vim.lsp.enable(server)
      end

      vim.lsp.enable("lua_ls")
    end
  },
}
