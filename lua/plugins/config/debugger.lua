local dap = require("dap")

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local ui = require("dapui")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- keymaps
-- too much for core/keymap
--[[
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
]]
map("n", "<F5>", dap.continue, opts)
map("n", "<F10>", dap.step_over, opts)
map("n", "<F11>", dap.step_into, opts)
map("n", "<F12>", dap.step_out, opts)
map("n", "<Leader>b", dap.toggle_breakpoint, opts)
map("n", "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts)
map("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)
-- map("n", "<Leader>dr", dap.repl.open, opts)
map("n", "<Leader>dr", ui.toggle, opts)
map("n", "<Leader>dl", dap.run_last, opts)
