-- Scala: Metals no está en Mason; nvim-metals instala/actualiza el servidor con Coursier.
-- No incluir filetype `java` aquí para no duplicar cliente con jdtls.
return {
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "scala", "sbt" },
    opts = function()
      return require("metals").bare_config()
    end,
    config = function(_, metals_config)
      local grp = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
          metals_config.capabilities = ok and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()
          metals_config.on_attach = require("config.lsp_attach").on_attach
          require("metals").initialize_or_attach(metals_config)
        end,
        group = grp,
      })
    end,
  },
}
