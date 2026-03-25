-- set buffer-specific keybinds when in umple files
vim.keymap.set('n', '<leader>usm', [[:UmpleStateMachine]], {buffer=true})
vim.keymap.set('n', '<leader>ucd', [[:UmpleClassDiagram]], {buffer=true})
