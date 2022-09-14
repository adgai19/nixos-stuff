let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [ { 'type': 'files',     'header': ['   Files']            },  { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },  { 'type': 'sessions',  'header': ['   Sessions']       },  { 'type': 'commands',  'header': ['   Commands']       },  { 'type': 'bookmarks', 'header': ['   Bookmarks']      },  ]
let g:startify_bookmarks = [{'c':'~/.config/i3/config'},{'ts':'~/.local/bin/tmux-sessionizer'},{'i':'~/.config/nvim'},{'t':'/home/adgai/ansible-config-ubuntu/roles/tmux/files/tmux'},{"k":'~/.config/kitty/kitty.conf'},{'a':'~/.config/alacritty/alacritty.yml'},{'f':'~/.config/fish'},{'n':'~/notes'},{'s':'~/.config/starship.toml'},{'p':'~/.config/'}]
let g:startify_session_autoload = 1
