return {
  { "christoomey/vim-tmux-navigator", lazy = true, event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", lazy = false },
  {
    'numToStr/Comment.nvim',
      keys = { "gc", "gb" },
      config = function()
        require('Comment').setup()
      end
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs_staged_enable = true,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gs.next_hunk({ navigation_message = false })
            end
          end, { buffer = bufnr, desc = "Git: siguiente hunk" })
          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gs.prev_hunk({ navigation_message = false })
            end
          end, { buffer = bufnr, desc = "Git: hunk anterior" })
        end,
      })
    end,
  },
  {
    'prisma/vim-prisma',
    ft = 'prisma'
  },
}
