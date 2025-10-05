return {
  {
    "RRethy/base16-nvim",
    priority = 1000, -- MUITO IMPORTANTE: Garante que o tema seja carregado primeiro
    config = function()
      -- Comando para aplicar o seu tema
      vim.cmd.colorscheme "base16-windows-95"
    end,
  },
}
