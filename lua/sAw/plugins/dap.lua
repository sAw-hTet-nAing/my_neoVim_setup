return {

  -- for DAP support
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()
      -- Dart / Flutter
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch dart",
          dartSdkPath = "~/flutter_versions/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
          flutterSdkPath = "~/flutter_versions/flutter/bin/flutter", -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = "~/flutter_versions/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
          flutterSdkPath = "~/flutter_versions/flutter/bin/flutter", -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
      }

      dap.adapters.dart = {
        type = "executable",
        command = "dart",
        args = { "debug_adapter" },
        console = "integratedTerminal",
      }
      dap.adapters.flutter = {
        type = "executable",
        command = "flutter",
        args = { "debug_adapter" },
        console = "integratedTerminal",
      }
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle BreakPoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart Debug" })
      vim.keymap.set("n", "<leader>ds", dap.close, { desc = "Stop Debug" })
      vim.keymap.set("n", "<leader>dtt", dap.terminate, { desc = "Terminate Debug" })
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({})
    end,
  },
  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin",
  },
}
