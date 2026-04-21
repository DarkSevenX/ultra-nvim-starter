-- Sesiones por cwd (guardar / restaurar layout y buffers)
return {
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/.config", "/tmp", "/" },
      auto_save = true,
      -- Si está en true, al arrancar se restaura la sesión y Snacks no puede mostrar el dashboard
      -- (buffers con nombre, varias ventanas o buffer no vacío). Usa <leader>sr para restaurar.
      auto_restore = false,
      bypass_save_filetypes = { "snacks_dashboard" },
      session_lens = {
        load_on_setup = true,
        picker = "telescope",
      },
    },
    config = function(_, opts)
      require("auto-session").setup(opts)
    end,
    keys = {
      { "<leader>sr", "<cmd>AutoSession restore<cr>", desc = "Sesión: restaurar (cwd)" },
      { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Sesión: guardar" },
      { "<leader>sD", "<cmd>AutoSession delete<cr>", desc = "Sesión: borrar (cwd)" },
      { "<leader>sl", "<cmd>AutoSession search<cr>", desc = "Sesión: buscar (Telescope)" },
      { "<leader>st", "<cmd>AutoSession toggle<cr>", desc = "Sesión: alternar autoguardado" },
    },
  },
}
