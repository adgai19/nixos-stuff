local nnoremap = require("keymaps.helpers").nnoremap
print('inside telescope keymaps')

nnoremap("<leader>ff", require("telescope.builtin").find_files)
nnoremap("<leader>fg", require("telescope.builtin").live_grep)
nnoremap("<leader>fb", require("telescope.builtin").buffers)
nnoremap("<leader>fh", require("telescope.builtin").help_tags)
nnoremap("<leader>fgi", require("telescope.builtin").git_files)
nnoremap("<leader>gb", require("telescope.builtin").git_branches)

nnoremap("<leader>fc", require("plugins.telescope").search_dotfiles)
nnoremap("<leader>fw", require("plugins.telescope").find_word)
nnoremap("<leader>fww", require("plugins.telescope").find_word_under_cursor)
nnoremap("<leader>fwb", require("telescope.builtin").current_buffer_fuzzy_find)
nnoremap("<leader>fr", require("plugins.telescope").multi_rg)
nnoremap("<leader>fa", "cmd>Telescope frecency<cr>")
nnoremap("<leader>fk", require("telescope.builtin").keymaps)
nnoremap("<leader>fn", require("telescope").extensions.notify.notify)
