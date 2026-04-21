-- Ultra Nvim: pila LSP nativa (estilo LazyVim / Mason / kickstart)
-- Sustituye CoC: Mason instala servidores, nvim-lspconfig configura, cmp completa.

-- LSP vía Mason (ensure_installed) + SourceKit (Swift) si existe en PATH + Scala (nvim-metals).
-- csharp_ls / gopls / ruby_lsp: añade con :MasonInstall cuando tengas dotnet, go y ruby+gem en PATH.

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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" },
    -- BufReadPre bloquea la lectura del buffer; BufReadPost deja abrir el archivo antes.
    event = { "BufReadPost", "BufNewFile" },
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "◍",
          package_pending = "◌",
          package_uninstalled = "○",
        },
        check_outdated_packages_on_open = false,
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = require("config.lsp_attach").on_attach

      local lspconfig = require("lspconfig")

      local function default_setup(name)
        lspconfig[name].setup({
          capabilities = caps,
          on_attach = on_attach,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "eslint",
          "pyright",
          "bashls",
          "jsonls",
          "yamlls",
          "marksman",
          "lua_ls",
          "clangd",
          "terraformls",
          "jdtls",
          "julials",
          "powershell_es",
          "qmlls",
          "rust_analyzer",
        },
        automatic_installation = false,
        handlers = {
          -- El primer handler anónimo es el predeterminado (ver mason-lspconfig).
          function(server_name)
            default_setup(server_name)
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = caps,
              on_attach = on_attach,
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  workspace = {
                    checkThirdParty = false,
                  },
                  completion = { callSnippet = "Replace" },
                  diagnostics = { disable = { "missing-fields" } },
                },
              },
            })
          end,

          ["angularls"] = function()
            lspconfig.angularls.setup({
              capabilities = caps,
              on_attach = on_attach,
            })
          end,

          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              capabilities = caps,
              on_attach = on_attach,
              settings = {
                typescript = {
                  updateImportsOnFileMove = { enabled = "always" },
                },
                javascript = {
                  suggest = { completeFunctionCalls = true },
                },
              },
            })
          end,

          ["eslint"] = function()
            lspconfig.eslint.setup({
              capabilities = caps,
              on_attach = on_attach,
              settings = { format = true },
            })
          end,

          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = caps,
              on_attach = on_attach,
              settings = {
                python = {
                  analysis = {
                    typeCheckingMode = "basic",
                  },
                },
              },
            })
          end,
        },
      })

      -- SourceKit-LSP no está en Mason; suele venir con el toolchain de Swift. Solo Swift/ObjC para no pisar clangd en C/C++.
      if vim.fn.executable("sourcekit-lsp") == 1 then
        lspconfig.sourcekit.setup({
          capabilities = caps,
          on_attach = on_attach,
          filetypes = { "swift", "objc", "objcpp" },
        })
      end
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = "InsertEnter",
    -- make + CC opcionales: jsregexp acelera snippets; sin ellos LuaSnip funciona igual.
    build = vim.fn.has("win32") == 0 and vim.fn.executable("make") == 1 and has_c_compiler() and "make install_jsregexp" or nil,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      local cfg = vim.fn.stdpath("config")
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = { cfg .. "/snippets" } })
      luasnip.config.setup({ history = true, updateevents = "TextChanged,TextChangedI" })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("nvim-autopairs").setup({
        map_cr = true,
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = { ghost_text = true },
      })

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }),
      })
    end,
  },
}
