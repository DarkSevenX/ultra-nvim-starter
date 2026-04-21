return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      {
        "<leader>rs",
        function()
          require("kulala").scratchpad()
        end,
        desc = "Kulala: scratchpad",
      },
    },
    opts = {
      global_keymaps = false,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
}
