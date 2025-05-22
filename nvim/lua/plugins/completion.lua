return {
  {
    'hrsh7th/nvim-cmp', -- ✅ Install nvim-cmp explicitly
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip', -- optional, for snippets
    }
  },

  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'hrsh7th/nvim-cmp', -- ✅ declare nvim-cmp as a dependency
    },
    version = '1.*',

    opts = {
      keymap = {
        preset = 'default',
        ["<S-Tab>"] = { 'select_prev', 'fallback_to_mappings' },
        ["<Tab>"] = { 'select_next', 'fallback_to_mappings' },
        ['<CR>'] = { 'accept' },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },

    opts_extend = { "sources.default" },

    config = function(_, opts)
      require('blink.cmp').setup(opts)

      -- ✅ Custom completion toggle
      local cmp = require('cmp')
      vim.keymap.set('i', '<C-1>', function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end, { noremap = true, silent = true })
    end
  }
}
