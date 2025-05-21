require("config.lazy")


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.cmd [[hi @function.builtin.lua guifg=orange]]


require("catppuccin").setup({
  integrations = {
    ts_rainbow = true,
  },
  color_overrides = {
    mocha = {
      text = "#F4CDE9",
      subtext1 = "#DEBAD4",
      subtext0 = "#C8A6BE",
      overlay2 = "#B293A8",
      overlay1 = "#9C7F92",
      overlay0 = "#866C7D",
      surface2 = "#705867",
      surface1 = "#5A4551",
      surface0 = "#44313B",

      base = "#352939",
      mantle = "#211924",
      crust = "#1a1016",
    },
  },
})
vim.cmd.colorscheme("catppuccin") -- or "gruvbox"
