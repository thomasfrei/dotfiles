" | | | (_)
" | | | |_ _ __ ___  _ __ ___
" | | | | | '_ ` _ \| '__/ __|
" \ \_/ / | | | | | | | | (__
"  \___/|_|_| |_| |_|_|  \___|
"
" Author: Thomas Frei
"

" General ------------------------------------------------------------------{{{

" Use vim settings/options, not vi.
set nocompatible

" Indentation.
set tabstop=4 shiftwidth=4 expandtab

" With the mapleader it is possible to do extra key compinations.
let mapleader=','
let g:mapleader=','

" }}}

" Vundle Plugins -----------------------------------------------------------{{{

" If Vundle is not installed, do it first.
if(! isdirectory(expand("$HOME/.vim/bundle/Vundle.vim")))
    call system(expand("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"))
endif

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

" Colorschemes
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'

" Core Bundles
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'

" Syntax specific
Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on
"}}}

" Plugin Configuration -----------------------------------------------------{{{

" vim-airline --------------------------------------------------------------{{{

set laststatus=2

" Dont show current mode, let airline handle it.
set noshowmode

" Theme
let g:airline_theme='wombat'

" Enable enhanced tabline
let g:airline#extensions#tabline#enabled = 1

" Activate powerline fonts for special symbols.
let g:airline_powerline_fonts = 1

" }}}

" CtrlP  -------------------------------------------------------------------{{{

" Change the position, the listing order of results, the minimum and the
" maximum heights of the match window.
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Show ditfiles and dotdirs;
let g:ctrlp_show_hidden = 1

" Exclude files and directories from the results.
set wildignore+=*/node_modules/*,*/bower_components/*,*/sass-cache/*,*/.git/*,*/vendor/*

" Mapping: Search for a tag within the current buffer.
nmap <c-r> :CtrlPBufTag<cr>

" }}}

" }}} End Plugin Configuration

" Visuals ------------------------------------------------------------------{{{

" Use 256 colors
set t_Co=256

" Set the colorscheme.
colorscheme gruvbox

" Gruvbox contrast
let g:gruvbox_contrast_dark='medium'

" Some themes support dark or light backgrounds
set background=dark

" Show line length limit.
set colorcolumn=80

" Hightlight active line
set nocursorline

" Highlight search matches
set hlsearch

" Search as characters are entered
set incsearch

" Show line numbers.
set relativenumber number

" Enable syntax highlighting.
syntax enable

" If line numbers are displayed, give them the same background color.
hi LineNr guibg=bg ctermbg=bg

" Hightlight active line number
hi CtrlPMatch ctermfg=227

" Give the foldcolumn the same background color.
hi foldcolumn guibg=bg ctermbg=bg

" Give the vertical split divider the same background color.
hi VertSplit guibg=bg guifg=bg ctermbg=bg ctermfg=bg
" }}}

" Key Mappings -------------------------------------------------------------{{{

" Make it easy to edit the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Close all folds, except the one currently under the cursor.
nmap <Leader>za zMzv

" Deactivate search highlights
nmap <Leader><Space> :nohlsearch<cr>

" }}}

" Auto Commands ------------------------------------------------------------{{{

" Automatically source the vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Remove trailing whitespaces on every save.
augroup whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Set the fold method to marker.
augroup vimrc
    autocmd BufReadPre * setlocal foldmethod=marker
augroup END

" Open help files in a vertical split to the left.
augroup helpfiles
    autocmd!
    autocmd BufRead,BufEnter */doc/* wincmd H
augroup END
" }}}
