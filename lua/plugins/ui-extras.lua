-- which-key, trouble, todo-comments, maximizer (pestañas = barra nativa de Vim, sin bufferline)
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ preset = "modern", delay = 200 })
      wk.add({
        { "<leader>c", group = "código / LSP" },
        { "<leader>d", group = "depuración (DAP)" },
        { "<leader>f", group = "buscar / archivos" },
        { "<leader>g", group = "git" },
        { "<leader>r", group = "REST / Kulala" },
        { "<leader>s", group = "sesión / AutoSession" },
        { "<leader>t", group = "pestañas / terminal" },
        { "<leader>x", group = "diagnósticos / quickfix" },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnósticos (workspace)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnósticos (buffer)" },
    },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", function() require("todo-comments").jump_next() end, desc = "Siguiente TODO" },
      { "<leader>fT", function() require("todo-comments").jump_prev() end, desc = "TODO anterior" },
    },
    opts = { signs = true },
  },

  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximizar split" },
    },
  },
}
