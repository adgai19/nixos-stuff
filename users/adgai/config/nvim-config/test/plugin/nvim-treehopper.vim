omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>

lua require("tsht").config.hint_keys = {'t','n','h','e','s','o','c','k',}
