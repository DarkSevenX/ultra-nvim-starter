--[[
  Banner de la pantalla de inicio (Snacks dashboard):
  - "neovim" → ASCII NEOVIM por defecto de snacks.nvim (original)
  - "hydra"  → hydra art for nvim
  - "shaded" → arte con ░ (Ultra Nvim)
  - "blocks" → bloques █ (ULTRA NVIM)
  - "figlet" → ASCII estilo figlet Standard
]]
local dashboard_banner_style = "hydra"

local dashboard_banners = {
  -- Igual que el preset por defecto de folke/snacks.nvim (dashboard).
  neovim = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

]],

  hydra = [[

	
	
	   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆
	    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
	          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄
	           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
	          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
	   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄
	  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
	 ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
	 ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄
     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆
      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃
	
  ]],

  shaded = [[

░██     ░██ ░██    ░██                           ░███    ░██            ░██
░██     ░██ ░██    ░██                           ░████   ░██
░██     ░██ ░██ ░████████ ░██░████  ░██████      ░██░██  ░██ ░██    ░██ ░██░█████████████
░██     ░██ ░██    ░██    ░███           ░██     ░██ ░██ ░██ ░██    ░██ ░██░██   ░██   ░██
░██     ░██ ░██    ░██    ░██       ░███████     ░██  ░██░██  ░██  ░██  ░██░██   ░██   ░██
 ░██   ░██  ░██    ░██    ░██      ░██   ░██     ░██   ░████   ░██░██   ░██░██   ░██   ░██
  ░██████   ░██     ░████ ░██       ░█████░██    ░██    ░███    ░███    ░██░██   ░██   ░██

]],

  blocks = [[

██╗   ██╗██╗  ████████╗██████╗  █████╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██║   ██║██║  ╚══██╔══╝██╔══██╗██╔══██╗    ████╗  ██║██║   ██║██║████╗ ████║
██║   ██║██║     ██║   ██████╔╝███████║    ██╔██╗ ██║██║   ██║██║██╔████╔██║
██║   ██║██║     ██║   ██╔══██╗██╔══██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
╚██████╔╝███████╗██║   ██║  ██║██║  ██║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

]],

  figlet = [[

 _   _ _ _       _    __
| | | | | |     | |  / _|
| | | | | |_   _| |_| |_ ___
| |_| | | | | | | | __|  _/
 \___/|_|_| |_| |_|\__|_|

 _ __  _   _ _ __ ___
| '_ \| | | | '_ ` _ \
| | | | |_| | | | | | |
|_| |_|\__,_|_| |_| |_|

]],
}

local function dashboard_header()
  return dashboard_banners[dashboard_banner_style] or dashboard_banners.neovim
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      --- Acciones con Telescope (picker de Snacks desactivado abajo).
      preset = {
        header = dashboard_header(),
        keys = {
          -- Usar funciones para Telescope/LSP: vim.cmd(":Telescope …") puede partir el comando (E492).
          {
            icon = " ",
            key = "f",
            desc = "Buscar archivo",
            action = function()
              require("telescope.builtin").find_files()
            end,
          },
          {
            icon = " ",
            key = "n",
            desc = "Archivo nuevo",
            action = function()
              vim.cmd("enew")
              vim.cmd("startinsert")
            end,
          },
          {
            icon = " ",
            key = "g",
            desc = "Archivos Git",
            action = function()
              require("config.git").telescope_git_files_or_find_files()
            end,
          },
          {
            icon = "󰒓 ",
            key = "c",
            desc = "Editar init.lua",
            action = function()
              vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
            end,
          },
          { icon = "󰒓 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = "󰏓 ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = "󰊄 ", key = "q", desc = "Salir", action = ":qa" },
        },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
