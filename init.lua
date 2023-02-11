require "custom.options"

vim.cmd [[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
    augroup END
]]

    -- source macmap.vim
