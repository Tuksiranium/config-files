"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" Add plugins here if you want to!
"call vundle#end()

if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'zacanger/angr.vim'

Plug 'vim-scripts/AutoComplPop'

Plug 'mileszs/ack.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-vinegar'

Plug 'tpope/vim-fugitive'
Plug 'vim-test/vim-test'

call plug#end()


filetype indent plugin on
syntax on

" variables
set encoding=utf-8
set fileencoding=utf-8
"set cc=80
set number
set relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set smartindent
set cindent
set textwidth=80
set backspace=eol,start,indent
set clipboard=unnamedplus
set belloff=all
set mouse=a
set scrolloff=5
set cursorline
set wildmenu
set wildmode=longest:full,list:full
set autoread
set autowrite

set ignorecase
set smartcase
set incsearch
set nohlsearch

" mapping

let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0
let g:qf_mapping_ack_style = 1

nmap ç <Plug>(qf_qf_switch)
nmap <F5> <Plug>(qf_qf_toggle)
nmap <F6> <Plug>(qf_loc_toggle)

let g:nremap = {"[q": "", "]q": "", "[l": "", "]l": ""}
nmap [q <Plug>(qf_qf_previous)
nmap ]q <Plug>(qf_qf_next)
nmap [l <Plug>(qf_loc_previous)
nmap ]l <Plug>(qf_loc_next)

noremap <leader>co :botright :copen<cr>
noremap <leader>m :silent! :make! \| :redraw!<cr>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <F7> :vs <CR>:exec("tag ".expand("<cword>"))<CR>


" Filetype configuration
autocmd Filetype make setlocal shiftwidth=8 tabstop=8
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
"autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd Filetype json setlocal shiftwidth=2 tabstop=2
autocmd Filetype xml setlocal shiftwidth=2 tabstop=2


" auto complete matching ponct.
"inoremap { {}<Esc>ha
"inoremap {<CR> {<CR>}<Esc>ko
"inoremap ( ()<Esc>ha
"inoremap (<CR> (<CR>)<Esc>ko
"inoremap () ()
"inoremap [ []<Esc>ha
"inoremap [<CR> [<CR>]<Esc>ko
"inoremap [] []
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

" theming congig

set list
set listchars=tab:>-,eol:¬,trail:\ ,nbsp:¤

set t_Co=256
set t_ut=
colorscheme angr
set background=dark

set fillchars=vert:│

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
let g:jellybeans_background_color_256='232'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline patched font
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''




" git config

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif


" autocomplete configuration

" disable autopopup autocomplete win
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" some personal config
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0


" fugitiv config
noremap <leader>gs :Git<cr>


" vinegar config
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" add THE BEauTIfUl vim debugger
if version >= 801
    packadd termdebug
endif
