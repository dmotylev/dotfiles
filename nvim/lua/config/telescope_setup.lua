-- Keybindings
local map = require('config.utils').map

local silent = { silent = true }

-- Navigate buffers and repos
map('n', '<leader>ff', [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>fs', [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>fg', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
map('n', '<leader>fb', [[<cmd>Telescope buffers theme=get_dropdown<cr>]], silent)
map('n', '<leader>fh', [[<cmd>Telescope help_tags theme=get_dropdown<cr>]], silent)
map('n', '<leader>fr', [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
