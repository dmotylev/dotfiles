--[=[vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.cmd([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]])
]=]
