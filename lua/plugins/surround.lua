-- Cambiar / borrar / añadir alrededores (paréntesis, comillas, tags…)
return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
