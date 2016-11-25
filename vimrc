" Load Pathogen and all bundles
execute pathogen#infect()
execute pathogen#helptags()

""""""""""""""""""""""""""""""
" Basic setup
""""""""""""""""""""""""""""""
filetype off
set nocompatible                " be iMproved
set modelines=0
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8
syntax on
filetype plugin indent on
filetype plugin on
set showcmd                     " display incomplete commands
set showmode                    " display the mode you're in
set showmatch                   " show matching brackets/parenthesis
set mat=5                       " duration to show matching tabs
set autoread                    " reload files automagically
set hidden                      " Handle multiple buffers better
set title                       " Set the terminal's title
set number                      " show line numbers
set ruler                       " Show cursor position
set cursorline                  " highlight line cursor is on
set autoindent smartindent      " match indentation of previous line
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
" set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set colorcolumn=80              " where the text column line is
set t_Co=256                    " Set terminal to 256 colors
set term=xterm-256color
let mapleader=","               " leader
" tell vim to allow you to copy between files, remember your cursor
" position and other little nice things like that
set viminfo='100,\"2500,:200,%,n~/.viminfo
" spell checking
set spell                       " turn on spell checking
set spelllang=en_us             " set language for spell checking
set spellfile=$HOME/.vim/spell-en.utf-8.add
autocmd ColorScheme * hi clear SpellBad
    \| hi SpellBad cterm=underline,bold,italic ctermfg=9 ctermbg=8
set complete+=kspell
" small tweaks to make more shell line
set wildmode=list:longest       " Complete files like a shell
set wildmenu                    " Enhanced command line completion
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set magic                       " magic matching
set ttyfast                     " indicate a fast terminal connection
set tf                          " improve redrawing for newer computers
set nolazyredraw                " turn off lazy redraw
set shell=/bin/zsh              " set shell
""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""
set incsearch                   " Find the next match as we type the search
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless we type a capital
set gdefault                    " Set the global flag on substitute commands by default
set matchpairs+=<:>             " Match < and > as well.
nnoremap <CR> :noh<CR><CR>
nnoremap / /\v
vnoremap / /\v
"set showmatch                   " When a bracket is inserted, briefly jump to the matching one

" hack for multiple pastes
xnoremap p pgvy

" fix for italics in vim
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

""""""""""""""""""""""""""""""
" Wrap without line breaks
""""""""""""""""""""""""""""""
set wrap
set linebreak
set nolist                      " list disables linebreaks
set textwidth=0                 " prevent vim from inserting new line breaks on new text
set wrapmargin=0                " helps with textwidth
" set formatoptions-=t " prevent vim auto formating when typing on existing lines
" set formatoptions+=1 " prevent vim auto formating most of the time but allow some long lines

" Persistanb undo
set undodir=~/.vim/undodir      " where to save undo histories
set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

""""""""""""""""""""""""""""""
" Repurpose arrow keys
""""""""""""""""""""""""""""""
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" Enable mouse for selecting/changing windows etc.
set mouse=a

" Remove Mouse Scroll Wheel Click PASTE
noremap <MiddleMouse> <LeftMouse>

""""""""""""""""""""""""""""""
" Folding Settings
""""""""""""""""""""""""""""""
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

""""""""""""""""""""""""""""""
" Whitespace settings
""""""""""""""""""""""""""""""
" show invisible characters
set list
" som alternatives: tab:▸\,eol:¬
set listchars=tab:\|\ ,trail:…
"set listchars=trail:.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" we also want to get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""
" Color Theme Settings
""""""""""""""""""""""""""""""
" Color Line numbers
highlight SignColumn ctermbg=grey ctermfg=black

" Solarized color scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

colorscheme solarized

call togglebg#map("<F6>")

" italisize comments
highlight Comment cterm=italic

""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""
" Format JSON
function! FormatJSON()
  :%!python -m json.tool
endfunction

" Function to calculate File Size
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction

" Show highlighing groups for current word
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""

" Reload .vimrc
map <leader>rv :source ~/.vim/vimrc<cr>
map <leader>ev :tabe ~/.vim/vimrc<cr>
autocmd bufwritepost vimrc source ~/.vim/vimrc

" Key map for format function
map <C-j> :call FormatJSON()<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1        " show hidden files in nerdtree

set pastetoggle=<leader>p       " set paste toogle mapping

" CtrlP Jump to definition
nnoremap <leader>. :CtrlPTag<cr>

" TagBar Toggle
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Show highlighing groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>

" fix trailing spaces
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" clear search results
nnoremap <leader><space> :noh<cr>

" select last matched item
nnoremap <leader>/ //e<Enter>v??<Enter>

" see what unsaved changes you have
nnoremap <leader>u :w !diff - %<CR>

""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""
" disable JSON concel
let g:vim_json_syntax_conceal = 0

" javascript libraries configuration for javascript syntax plugin
let g:used_javascript_libs = 'jquery,angularjs,angularui,jasmine,underscore'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1

" Custom indent-guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=236

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_jsl_conf="~/.vim/config/jsl.conf"
let g:syntastic_html_checkers=[''] "disable html checker
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enable = 1
let g:airline_detect_paste=1
set laststatus=2
" allow fancy arrow symbols for powerline patched fonts
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""
" Golang Things
""""""""""""""""""""""""""""""
" use goimports for formatting
let g:go_fmt_command = "goimports"

" syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" Tagbar config for gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
