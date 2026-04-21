-- Formateadores externos (Prettier, shfmt, ruff_format, …) + fallback LSP
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Formatear archivo",
      },
      {
        "<C-f>",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Formatear archivo",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        shell = { "shfmt" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- C# / Go / Ruby: sin dotnet, go y gem no instalamos csharpier, gofumpt ni standardrb; el LSP lo añades después vía Mason.
        cs = { lsp_format = "first" },
        go = { lsp_format = "first" },
        java = { "google-java-format" },
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
        ruby = { lsp_format = "first" },
        terraform = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
        swift = { "swiftformat" },
        scala = { "scalafmt", lsp_format = "fallback" },
        julia = { lsp_format = "first" },
        qml = { "qmlformat", lsp_format = "fallback" },
        qmljs = { "qmlformat", lsp_format = "fallback" },
        ps1 = { lsp_format = "first" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 2500, lsp_fallback = true }
      end,
    },
  },
}
