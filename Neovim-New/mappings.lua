require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start/Continue Debugger" })
map("n", "<leader>dpr", function() require('dap-python').test_method() end, { desc = "Debug Python Method" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
