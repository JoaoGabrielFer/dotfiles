require("config.lazy")
require 'nvim-treesitter.install'.compilers = { "gcc" }

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<leader>q", "<C-w>q")

vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])
vim.keymap.set("t", "<A-t>", [[<C-\><C-n>]])



vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

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

local job_id = 0
vim.keymap.set("n", "<leader>t", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.api.nvim_win_set_width(0, 80)

  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>git", function()
  vim.ui.input({ prompt = "Diretório para rodar git: ", default = vim.fn.getcwd() }, function(dir)
    if dir == nil or dir == "" then
      print("Operação cancelada.")
      return
    end

    -- Abre um terminal em um novo split vertical
    vim.cmd("vnew")
    vim.cmd("terminal")
    vim.api.nvim_win_set_width(0, 80)

    -- Pega o ID do terminal
    local term_chan = vim.b.terminal_job_id

    -- Muda para o diretório informado
    vim.fn.chansend(term_chan, "cd " .. dir .. "\r\n")

    -- Roda o comando git
    vim.fn.chansend(term_chan, "git add .\r\ngit commit -m .\r\ngit push origin main\r\n")
  end)
end)
