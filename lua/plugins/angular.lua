-- Utilidades Angular (LSP: angularls en lua/plugins/lsp.lua + Mason)
return {
  {
    "joeveiga/ng.nvim",
    ft = { "typescript", "html" },
    keys = {
      { "<leader>gt", "<cmd>NgGotoTemplate<cr>", desc = "Angular: ir a template" },
      { "<leader>gc", "<cmd>NgGotoComponent<cr>", desc = "Angular: ir a componente" },
      { "<leader>gs", "<cmd>NgGotoStyle<cr>", desc = "Angular: ir a estilos" },
    },
  },
}
