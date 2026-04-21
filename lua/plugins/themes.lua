-- plugins/themes.lua

-- 🖌️ Selecciona el nombre del tema aquí:
local active_theme = 'catppuccin'

-- Todos con lazy = false: con defaults.lazy = true en lazy.lua, si no el plugin no
-- carga y el config (colorscheme) nunca corre al cambiar active_theme.
-- 🧠 Devuelve la configuración de todos los temas, pero solo aplica el seleccionado
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      if active_theme ~= "catppuccin" then return end
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      if active_theme ~= "tokyonight" then return end
      require("tokyonight").setup({
        style = "storm", -- day, night, storm
        transparent = false,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        if active_theme ~= "tokyodark" then return end
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd.colorscheme("tokyodark")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      if active_theme ~= "nightfox" then return end
      require("nightfox").setup({})
      vim.cmd.colorscheme("nightfox")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      if active_theme ~= "kanagawa" then return end
      require("kanagawa").setup({
        theme = "wave", -- wave, dragon, lotus
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    name = 'onedarkpro',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      if active_theme ~= "onedarkpro" then return end
      require("onedarkpro").setup({
        theme = "onedark_dark", -- wave, dragon, lotus
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
