local dap = require('dap')
local dapui = require('dapui')

local bufopts = { noremap = true }
vim.keymap.set('n', '∂', function() dap.toggle_breakpoint() end, bufopts) -- <M-d>
vim.keymap.set('n', '∑', function() dap.step_over() end, bufopts) -- <M-w>
vim.keymap.set('n', 'ß', function() dap.step_into() end, bufopts) -- <M-s>
vim.keymap.set('n', 'å', function() dap.step_out() end, bufopts) -- <M-a>

vim.api.nvim_create_user_command('DapStop', function() dap.terminate() end, {})
vim.api.nvim_create_user_command('DapUI', function() dapui.toggle() end, {})
-- vim.api.nvim_create_user_command('DapContinue', function() dap.continue() end, {})
-- vim.api.nvim_create_user_command('DapRepl', function() dap.repl.open() end, {})

-- DEBUGGERS

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/Cellar/llvm/15.0.5/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    env = function() -- Inherit environment variables
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
    end,

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

-- Nvim DAP UI
dapui.setup()
