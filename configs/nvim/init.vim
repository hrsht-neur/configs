 "Plugins will be downloaded under the specified directory.

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" Conqurer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" =====================================
" Initial settings
" =====================================

set number

set relativenumber

set nowrap

syntax on

set sidescroll=6


" =====================================
" key map
" Understand mapping modes:
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#answer-3776182
" http://stackoverflow.com/questions/22849386/difference-between-nnoremap-and-inoremap#answer-22849425
" =====================================

let mapleadeer=";"
