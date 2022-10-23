" NVIM CONFIG FILE
"
" by tuks!

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')

Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'zacanger/angr.vim'
Plug 'xiyaowong/nvim-transparent'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jiangmiao/auto-pairs'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'vim-test/vim-test'

Plug 'mileszs/ack.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'mfussenegger/nvim-jdtls'
Plug 'lervag/vimtex'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

lua require('tuks')


filetype indent plugin on
syntax on

" variables

set encoding=UTF-8

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
"set cc=80
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

set completeopt=menu,longest
set shortmess+=c

set spelllang=en,fr,cjk

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

" for the nvim terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <F30> <C-w>bi
nnoremap <C-h>s :ToggleTermSendCurrentLine<cr>
vnoremap <C-h>v :ToggleTermSendVisualLines<cr>
vnoremap <C-h>b :ToggleTermSendVisualSelection<cr>

" fzf mapping
nnoremap <space>p :Files<cr>
nnoremap <space>b :Buffers<cr>

" fugitiv config
noremap <leader>gs :Git<cr>

" MarkDown mapping
nnoremap <leader>kk <Plug>MarkdownPreviewToggle

" helppage mapping
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" toggle relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,WinLeave   * if &nu                  | set nornu | endif
augroup END
nnoremap <silent> <space>n :set relativenumber!<cr>

" Filetype configuration
autocmd Filetype make setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
autocmd Filetype json setlocal shiftwidth=2 tabstop=2
autocmd Filetype xml setlocal shiftwidth=2 tabstop=2
autocmd Filetype tex setlocal shiftwidth=2 tabstop=2
autocmd Filetype md setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.org set filetype=org
autocmd Filetype java lua require("tuks.jdtls")

" Folding
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=syntax
"  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END

" theming congig

hi Normal guibg=NONE ctermbg=NONE

set list
set listchars=tab:>-,eol:¬,trail:\ ,nbsp:¤

set t_Co=256
set t_ut=

set fillchars=vert:│

set termguicolors
set background=dark

colorscheme angr

"lua require('tuks.theme')
lua vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#6A9955', bg = 'NONE' })
lua vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#DCDCAA', bg = 'NONE' })
lua vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#F44747', bg = 'NONE' })
lua vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = '#FFFFFF', bg = '#6A9955' })
lua vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = '#FFFFFF', bg = '#DCDCAA' })
lua vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = '#FFFFFF', bg = '#F44747' })

" git config

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

" vinegar config
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" fzf config
let g:fzf_layout = { 'down': '30%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" VimTex config
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" MarkDown preview
let g:mkdp_browser = '/usr/bin/firefox'
let g:mkdp_echo_preview_url = 1
