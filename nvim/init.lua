local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("config.lazy")
require("config.remap")
require("scripts.floaterminal")
require 'nvim-treesitter.install'.compilers = { "gcc" }
require("luasnip.loaders.from_vscode").lazy_load()

vim.o.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.cmd [[hi @function.builtin.lua guifg=orange]]

require("catppuccin").setup({
  transparent_background = false,
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

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
  end,
})

vim.keymap.set("n", "<leader>t", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, 80)
end)

vim.keymap.set("n", "<leader>git", function()
  vim.ui.input({ prompt = "Diretório para rodar git: ", default = vim.fn.getcwd() }, function(dir)
    if dir == nil or dir == "" then
      print("Operação cancelada.")
      return
    end

    vim.cmd("vnew")
    vim.cmd("terminal")
    vim.api.nvim_win_set_width(0, 80)

    local term_chan = vim.b.terminal_job_id

    vim.fn.chansend(term_chan, "cd " .. dir .. "\r\n")

    vim.fn.chansend(term_chan, "git add .\r\ngit commit -m .\r\ngit push origin main\r\n")
  end)
end)
