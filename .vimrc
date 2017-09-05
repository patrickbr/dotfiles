set nocompatible
filetype off

"" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

"" vundle plugins
" YouCompleteMe universal autocomplete
Plugin 'Valloric/YouCompleteMe'

" vim-go
Plugin 'fatih/vim-go'

" ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" user interface

" highlight line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" leader key
let mapleader = "\\"

" use 'jk' as <Esc>
inoremap jk <Esc>

" highlight current pos and line
set ruler

" wildmenu

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__

" ignore case when searching
set ignorecase
set smartcase

" highlight search results
set hlsearch

" show matching braces
set showmatch

" disable sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" nerd commenter
" adds whitespace between comment and line
let NERDSpaceDelims=1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDRemoveExtraSpaces = 1

"" appearance

color monokai_custom

" always highlight syntax
syntax enable

set enc=utf-8
set ffs=unix,dos,mac

set ai "auto indent
set si "smart indent
set wrap "wrap lines

" make tabs 4 chars wide
" this is the default, language un-specific setting
set tabstop=4
set softtabstop=4
set noexpandtab
set shiftwidth=4

" catch common typos
com W :w
com Wq :wq
com WQ :wq
com Q :q
com Qall :qall


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


""""""""""""""""""""""""""""
" filetype specific settings

filetype on
filetype plugin on


" if YCM is enabled, autoload configuration on start
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" =========== CSS =============
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" =========== VIM  =============
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" ========== JS ===============
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" =========== C/C++ ===========
autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=81
" YCM GoTo decl / def shortcut
autocmd FileType cpp nmap gd :YcmCompleter GoTo<CR>
" use clang-formatter for styling with google style
autocmd FileType c,cpp setlocal equalprg=clang-format\ -style=Google

" not only for C/C++, better bracket jumps
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" ========== Latex ==========
autocmd Filetype tex,latex set spelllang=en_us spell

" ========== Go =============
au BufRead,BufNewFile *.go setfiletype go

" better-whitespace does that for us
let g:go_highlight_trailing_whitespace_error = 0

" whitespace error checking causes anoying typing lag...
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_string_spellcheck = 0

" disabled because of crappy performance
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1


" ========== python =========
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" YCM GoTo decl / def shortcut
autocmd FileType python nmap gd :YcmCompleter GoTo<CR>

" ========= book ===========
au BufRead,BufNewFile *.book setfiletype manuscript

" limit to 60 chars
autocmd FileType manuscript setlocal shiftwidth=3 tabstop=3 softtabstop=3 tw=61 formatoptions=at1

autocmd FileType manuscript inoremap <ENTER> <CR>.P 
autocmd FileType manuscript inoremap \| <CR>

" better navigation
autocmd FileType python nmap gd :YcmCompleter GoTo<CR>

" line number
set nu

" set path
set path=$PWD/**

" allow hidden buffers
set hidden
