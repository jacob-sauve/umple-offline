--[[
-- UMPLE OFFLINE
-- by Jacob Sauvé
-- v2.1.0
-- 2026-03-25
--]]--

-- get buffer number for command locality
_G.BUF_NUMBER = vim.api.nvim_get_current_buf()

-- compile state machine
vim.api.nvim_buf_create_user_command(
    BUF_NUMBER,
    "UmpleStateMachine",
    function()
        -- current filename
        local fname = vim.api.nvim_buf_get_name(0)
        local output_name = os.tmpname() .. '.png'
        vim.cmd("silent !umple -g GvStateDiagram " .. fname)
        -- reconstruct generated diagram name
        local diagram_fname = string.sub(fname, 0, -4) .. "gv"
        vim.cmd("silent !dot -Tpng " .. diagram_fname .. " -Gdpi=1000 -Gratio=fill -o" ..  output_name)
        visualize(output_name)
    end,
    {}
)

-- compile class diagram
vim.api.nvim_buf_create_user_command(
    BUF_NUMBER,
    "UmpleClassDiagram",
    function()
        -- current filename
        local fname = vim.api.nvim_buf_get_name(0)
        local output_name = os.tmpname() .. '.png'
        vim.cmd("silent !umple -g GvClassDiagram " .. fname)
        local diagram_fname = string.sub(fname, 0, -5) .. "cd.gv"
        vim.cmd("silent !dot -Tpng " .. diagram_fname .. " -Gratio=fill -o " ..  output_name)
        visualize(output_name)
    end,
    {}
)



-- make visualisation happen for compiled diagram
-- (helper)

function visualize(diagram_fname)
    vim.notify("Umple diagram generated. Opened in vertical split")
    -- tempfile deletion
    os.remove(string.sub(diagram_fname, 0, -5))
    -- start viewer and cleanup when it exits rather than after a delay
    vim.cmd("vsplit " .. diagram_fname)
    --del tmpfile on buffer exit automatically
    local current_buffer = vim.api.nvim_get_current_buf() -- num of current buffer (i.e. img  buffer)
    vim.api.nvim_create_autocmd("BufUnload", {
        buffer = current_buffer,
        callback = function()
            pcall(os.remove, diagram_fname)
        end,
        once = true,
    })
    -- additional safety in case never unloads buffer
    vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
            pcall(os.remove, diagram_fname)
        end,
        once = true,
    })

end


-- generate java files from .ump file

vim.api.nvim_buf_create_user_command(
	BUF_NUMBER,
	"GenerateJava",
	function()
		local fname = vim.api.nvim_buf_get_name(0)
        vim.cmd("silent !umple -g Java " .. fname)
	end,
	{}
)


-- set buffer-specific keybinds when in umple files
vim.keymap.set('n', '<leader>usm', [[:UmpleStateMachine<CR>]], {buffer=true})
vim.keymap.set('n', '<leader>ucd', [[:UmpleClassDiagram<CR>]], {buffer=true})
vim.keymap.set('n', '<leader>ugj', [[:GenerateJava<cr>]])
