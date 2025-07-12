return {
  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup { use_icons = true }
    end
  },
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup()
    end
  },
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup({
        pairs = {
          ['('] = { close = ')', neigh_pattern = '[^\\].' },
          ['['] = { close = ']', neigh_pattern = '[^\\].' },
          ['{'] = { close = '}', neigh_pattern = '[^\\].' },
        },
        modes = { insert = true, command = false, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { 'string' },
        skip_unbalanced = true,
        markdown = false,
      })
    end
  },  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end
  },
}
