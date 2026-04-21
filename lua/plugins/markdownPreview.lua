return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- yarn no suele estar instalado; npm basta para instalar dependencias del preview.
    build = "cd app && (command -v yarn >/dev/null 2>&1 && yarn install || npm install)",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
}
