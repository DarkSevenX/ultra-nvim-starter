-- Depuración: DAP + UI + texto virtual + Mason (instala adaptadores con :DapInstall)
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: breakpoint" },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Condición: "))
        end,
        desc = "DAP: breakpoint condicional",
      },
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP: continuar / iniciar" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP: entrar" },
      { "<leader>do", function() require("dap").step_over() end, desc = "DAP: paso" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "DAP: salir" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "DAP: terminar" },
      { "<leader>dR", function() require("dap").restart() end, desc = "DAP: reiniciar" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "DAP: última config" },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "DAP: REPL",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "DAP: panel UI",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "DAP: hover",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", circular = "" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
          },
          {
            elements = { { id = "repl", size = 1 } },
            size = 0.27,
            position = "bottom",
          },
        },
      })

      require("nvim-dap-virtual-text").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {},
      })
    end,
  },
}
