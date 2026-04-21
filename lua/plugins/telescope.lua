return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Archivos" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Texto en proyecto" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Ayuda" },
      { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Archivos recientes" },
      { "<leader>fc", function() require("telescope.builtin").grep_string() end, desc = "Buscar palabra bajo cursor" },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Símbolos (buffer)",
      },
      { "<C-p>", function() require("config.git").telescope_git_files_or_find_files() end, desc = "Archivos Git (o archivos)" },
    },
    -- cmd = 'Telescope', -- carga solo al usar :Telescope
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
          border = true,
        },
      })
    end,
  }
}

