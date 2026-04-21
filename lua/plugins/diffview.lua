-- Diff de Git en buffers (merge, historial, comparar)
return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git: Diffview (working tree)" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Git: cerrar Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: historial del archivo" },
    },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = { winbar_info = true },
        },
      })
    end,
  },
}
