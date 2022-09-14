nnoremap <leader>rt <Esc><Cmd>lua require('plugins').refactors()<CR>
nnoremap <leader>re <Esc><Cmd>lua <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]
nnoremap <leader>rf <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>

vnoremap <leader>rt <Esc><Cmd>lua require('plugins').refactors()<CR>
vnoremap <leader>re <Esc><Cmd>lua <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]

vnoremap <leader>rf <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>
vnoremap <leader>rn <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>
