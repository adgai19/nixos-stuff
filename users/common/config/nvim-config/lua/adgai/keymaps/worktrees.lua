local nnoremap = require("adgai.keymaps.helpers").nnoremap
nnoremap("<leader>gb", require("telescope").extensions.git_worktree.git_worktrees)
nnoremap("<leader>gj", require("telescope").extensions.git_worktree.create_git_worktree)
