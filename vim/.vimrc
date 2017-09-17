""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My map leader is <space>
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Allow background buffers without saving
set hidden

" Set utf8 as standard encoding
set encoding=utf8

" Set spelllang to english
set spell spelllang=en_us

" Set system clipboard
set clipboard=unnamed

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Split to right and below by default
set splitbelow
set splitright

" Text wrapping and breaking
set wrap
set showbreak=↳\ \ \
set cpo=n

" Tabs and indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
nmap <leader>/ :nohlsearch<cr> " Get rid of the annoying highlighting

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme and Styling
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set status line visible always
set laststatus=2

" Turn on the WiLd menu
set wildmode=longest:list,full
set wildmenu

" Set line relative numbers
set number
set relativenumber

" Always show current position
set ruler

" Enable highlighting of the current line
set cursorline

" Enable syntax highlighting
syntax enable

" Height of the command bar
set cmdheight=2

" Toggle keeping the cursor in the middle
set so=999
nmap <leader>m :set so=999<cr>
nmap <leader>mm :set so=0<cr>

" Wrap to next/previous line properly
set whichwrap+=<,>,h,l

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Add a bit extra margin to the left
set foldcolumn=1

" Show as much as possible of the last line
set display+=lastline

" Set proper cursor shape for each mode, probably iTerm2 only
if $TERM_PROGRAM =~ '^iTerm'
  let &t_SI = "\<esc>[5 q"
  let &t_SR = "\<esc>[5 q"
  let &t_EI = "\<esc>[2 q"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Edit my vim config file
if has('nvim')
  nmap <leader>ev :e ~/.vimrc<cr>
else
  nmap <leader>ev :e $MYVIMRC<cr>
endif

" Map j and k to manage wrapped lines and proper counting
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Set jk to be used as escape
inoremap jk <Esc>

" No shift to enter commands
nnoremap ; :

" Double tap e while in insert to go to the end of the line.
inoremap ii <Esc>$a

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q!<cr>

" For fast moving through windows
noremap <silent> <S-k> :wincmd k<CR>
noremap <silent> <S-j> :wincmd j<CR>
noremap <silent> <S-h> :wincmd h<CR>
noremap <silent> <S-l> :wincmd l<CR>

" For fast moving through buffers
nmap <S-tab> :bNext<cr>

" Tabprev/next to leaader,/."
nnoremap <leader>, :tabprev<cr>
nnoremap <leader>. :tabnext<cr>

" Insert/remove # comment(s)
map ic :s/^/#/g<CR>:let @/ = ""<CR>
map rc :s/^#//g<CR>:let @/ = ""<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically source the vim config file after editing

augroup autosourcing
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic install of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'trevordmiller/nova-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-endwise'
  Plug 'Townk/vim-autoclose'
  Plug 'neomake/neomake'
  Plug 'vim-syntastic/syntastic'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif
  " Elixir support
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  " Elm support
  Plug 'lambdatoast/elm.vim'
call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep=''
let g:airline_right_sep=''
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" nova-vim
colorscheme nova

" fzf.vim
"let g:fzf_default_command= 'rg --files --hidden --follow --hidden'
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
"let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :Rg<cr>

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

" alchemist.vim
let g:alchemist_tag_disable = 1
"autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
"autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>

" deoplete.nvim
if has('nvim')
  call deoplete#enable()
endif

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]
