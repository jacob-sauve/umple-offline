--[[
-- UMPLE OFFLINE
-- by Jacob Sauvé
-- v1.0
-- 2026-03-25
--]]--

-- get filename (current buffer)
local fname = vim.api.nvim_buf_get_name(0)


-- compile state machine
vim.api.nvim_create_user_command(
    "UmpleStateMachine",
    function()
    end.
    {}
)
-- compile class diagram
vim.api.nvim_create_user_command(
    "UmpleClassDiagram",
    function()
    end.
    {}
)


-- make visualisation window for compiled diagram
function visualize(diagram_fname)
        local term_buf = vim.api.nvim_create_buf(false, true)
        local enter_window = true
   
        vim.api.nvim_open_win(term_buf, enter_window, {
            relative="editor",
            row = vim.o.lines - 1,
            col = 0,
            width = vim.o.columns,
            height = math.floor((vim.o.lines -1) / 2),
            border = "rounded",
            title = "fzf"
        })
        vim.fn.jobstart("chafa " .. digram_fname, {
            term = true,
            on_exit = function()
                vim.cmd(":q"); --auto exit when process terminates
            end,
        })
        vim.cmd "startinsert"
    end,
    {}

    )

