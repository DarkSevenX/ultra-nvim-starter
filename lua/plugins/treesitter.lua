-- Parsers: config Neovim, web, datos, docs, shell, SQL, contenedores, y lenguajes adicionales (C/C++, C#, Go, HCL, Java, Julia, Lua, PowerShell, QML, Ruby, Scala, Swift, Terraform, …).
-- No hay parser "jsx": .jsx / javascriptreact usan el mismo parser que "javascript".
-- .tsx / typescriptreact usan el parser "tsx".
local parsers = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "regex",
  "python",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "scss",
  "json",
  "jsonc",
  "yaml",
  "toml",
  "xml",
  "markdown",
  "markdown_inline",
  "bash",
  "dockerfile",
  "sql",
  "graphql",
  "c",
  "cpp",
  "c_sharp",
  "go",
  "rust",
  "java",
  "julia",
  "powershell",
  "ruby",
  "scala",
  -- swift: el parser oficial requiere `tree-sitter` en PATH (generación desde gramática); sin eso, :TSInstall swift falla.
  "terraform",
  "hcl",
  "qmldir",
  "qmljs",
}

local function has_c_compiler()
  for _, name in ipairs({ "cc", "gcc", "clang", "zig" }) do
    if vim.fn.executable(name) == 1 then
      return true
    end
  end
  return false
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    -- Sin build = ":TSUpdate": evita recompilar todos los parsers en cada sync de lazy (muy lento).
    config = function()
      -- Sin compilador C, instalar muchos parsers dispara el error repetido "No C compiler found!".
      -- Solución recomendada: sudo apt install build-essential
      local ensure = parsers
      -- if not has_c_compiler() then
      --   ensure = {}
      --   vim.schedule(function()
      --     vim.notify(
      --       "No hay compilador C (gcc/clang). Instala: sudo apt install build-essential. Luego reinicia Neovim o ejecuta :TSInstall con los lenguajes que uses.",
      --       vim.log.levels.WARN,
      --       { title = "nvim-treesitter" }
      --     )
      --   end)
      -- end

      require("nvim-treesitter.configs").setup({
        ensure_installed = ensure,
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>cs"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>cS"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
