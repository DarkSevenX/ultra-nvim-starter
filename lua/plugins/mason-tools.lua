-- Instalación automática de CLI usados por conform.nvim (Prettier, shfmt, ruff, …)
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "shfmt",
          "ruff",
          "clang-format",
          "stylua",
          "google-java-format",
          "terraform",
          "swiftformat",
        },
        auto_update = false,
        -- true = comprueba/instala al arrancar (mensajes cada sesión). Instala con :MasonToolsInstall
        run_on_start = false,
      })
    end,
  },
}
