" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

" Some nice customizations
filetype plugin on
filetype indent on
filetype indent plugin on
syntax on
set number
"set laststatus=2

" Some lets
"let g:powerline_pycmd="py3"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Declare the list of plugins
Plug 'dylanaraps/wal.vim'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

" Set Vim colours to wal settings
colorscheme wal
