" Remember: YCM is a plugin with a compiled component.
" If you update YCM using Vundle and the ycm_core
" library APIs have changed (happens rarely),
" YCM will notify you to recompile it.
" You should then rerun the install process.

""" personal note; <leader> is ","


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

""" Pimp My Vim and Tmux:
""   https://github.com/colbycheeze/dotfiles/blob/master/vimrc.bundles

let g:ycm_confirm_extra_conf = 0

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"[1] File Browsing
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'kien/ctrlp.vim' " Super Search

Plugin 'tmhedberg/SimpylFold' " Code Folding

" Syntax Checking / Highlightning
Plugin 'scrooloose/syntastic' " Run linters and display errors etc
Plugin 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plugin 'nvie/vim-flake8' " PEP 8 - Python Syntax Checker
" Plugin 'vim-scripts/indentpython.vim' " Auto-Indentation
Plugin 'Vimjas/vim-python-pep8-indent' " Auto-Indentation

" ******************************************************
" Remember: YCM is a plugin with a compiled component.
" If you update YCM using Vundle and the ycm_core
" library APIs have changed (happens rarely),
" YCM will notify you to recompile it.
" You should then rerun the install process.
" ******************************************************
Plugin 'Valloric/YouCompleteMe' " [11] YCM - Auto Complete

Plugin 'sophacles/vim-processing' " use processing with vim
Plugin 'duff/vim-scratch' "Open a throwaway scratch buffer
Plugin 'vim-scripts/javacomplete'

" [6] Adds a ; at the end of a line by pressing <leader> ;
Plugin 'lfilho/cosco.vim'

Plugin 'Yggdroot/indentLine' " display indentation
let g:indentLine_char = '.'
"let g:indentLine_char = '┆'
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
let g:indentLine_color_term = 0

" GIT-Support
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

" System Clipboad
set clipboard=unnamed

Plugin 'fatih/vim-go'
" Plugin 'scrooloose/nerdcommenter' " NERC COMMENTER

""" Utilities / Extras / Etc
"""
" [8] Diary, notes, whatever. It's amazing
Plugin 'vimwiki/vimwiki'

" [9]
Plugin 'SirVer/ultisnips'
Plugin 'justinj/vim-react-snippets'
Plugin 'colbycheeze/vim-snippets'

" [10]
" supertab makes tab work with autocomplete and ultisnips
Plugin 'ervandew/supertab'

" [12] - virtualenvironment support for vim
Plugin 'jmcantrell/vim-virtualenv'

" [13] simple template machine: Type :Stencil <tab> in vim-console
Plugin 'mrtazz/vim-stencil'

" [14] solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""" ----------------- SETTINGS -------------------"
""" PLUGIN RELATED TWEAKS
""
" [1] NERDTree
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" [4] - search
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_working_path_mode = 'r'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
    let g:ctrlp_extensions = ['line']
endif

" [6] Key mapping for Cosco.vim - space + ; to add semicolon or comma in
" Javascript or CSS
autocmd FileType java nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType java inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
"autocmd FileType cpp nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
"autocmd FileType cpp inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
autocmd FileType cpp nnoremap <silent> <Leader>. :call cosco#commaOrSemiColon()<CR>
autocmd FileType cpp inoremap <silent> <Leader>. <c-o>:call cosco#commaOrSemiColon()<CR>

" [9]
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" [9] - YCM & DJANGO [UtilSnips]
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" [10] make YCM compatible with UltiSnips (using supertab)
"let g:SuperTabDefaultCompletionType = '<C-s>'

" [11] YCM & DJANGO [UtilSnips]
" https://code.djangoproject.com/wiki/UsingVimWithDjango
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" [11] YCM
" log-files and debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion=1

"map <C-]> :YcmCompleter GoToImprecise<CR>
map <C-a> :YcmCompleter GoToImprecise<CR>

"" SET YCM AUTOCOMPETETION FOR ECLIM
" After installing Eclim remember to create a new Eclipse project within your
" application by typing :ProjectCreate <path-to-your-project> -n ruby (or -n
" java) inside vim and don't forget to have let g:EclimCompletionMethod =
" 'omnifunc' in your vimrc. This will make YCM and Eclim play nice; YCM will
" use Eclim's omnifuncs as the data source for semantic completions and
" provide the auto-triggering and subsequence-based matching (and other YCM
" features) on top of it
let g:EclimCompletionMethod = 'omnifunc'

"[12] vim-virtualenv configuration
let g:virtualenv_directory = '/home/alkk/tutorials'

" [13] templates load
let g:StencilTemplatepath = "~/.vim/templates/"

" [14] solarized colorscheme
"syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
"g:solarized_termcolors= 16 | 256
"g:solarized_termtrans = 0 " | 1
"g:solarized_degrade = 0 " | 1
"g:solarized_bold = 1 " | 0
"g:solarized_underline = 1 " | 0
"g:solarized_italic = 1 " | 0
"g:solarized_contrast = “normal”
"g:solarized_visibility= “normal”

" colorscheme
colorscheme delek_mine

" Enable folding
set foldmethod=indent
set foldlevel=99

" set relative number on InsertMode
" and absolute numbers in nOrmalMode
" set number
autocmd InsertLeave * : set norelativenumber
autocmd InsertEnter * : set relativenumber

"autocmd InsertLeave * : set relativenumber
"autocmd InsertEnter * : set norelativenumber

"set relativenumber " set relative numbers
"au FocusLost * :set number
"au FocusGained * :set relativenumber
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" Enable folding with the spacebar
nnoremap <space> za

"let g:SimpylFold_docstring_preview=1
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=139
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au BufRead,BufNewFile *.c,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h match BadWhitespace /\s\+$/
au         BufNewFile *.c,*.h set fileformat=unix
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '

" CPP
au BufRead,BufNewFile *.cpp,*.h set expandtab
au BufRead,BufNewFile *.cpp,*.h set tabstop=4
au BufRead,BufNewFile *.cpp,*.h set shiftwidth=4
au BufRead,BufNewFile *.cpp,*.h set autoindent
au BufRead,BufNewFile *.cpp,*.h match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.cpp,*.h match BadWhitespace /\s\+$/
au         BufNewFile *.cpp,*.h set fileformat=unix
au BufRead,BufNewFile *.cpp,*.h let b:comment_leader = '/* '

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=2
au BufRead,BufNewFile *.html set softtabstop=2
au BufRead,BufNewFile *.html set shiftwidth=2
au BufRead,BufNewFile *.html set autoindent
au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!'

" Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.java match BadWhitespace /\s\+$/

" UTF-8 Support
set encoding=utf-8

let python_highlight_all=1
syntax on

set nu
highlight BadWhitespace ctermbg=red guibg=red

" no temp or backup files
set noswapfile
set nobackup
set nowritebackup

" compile shortcuts
" https://stackoverflow.com/questions/18296192/vim-compile-and-run-shortcut
autocmd filetype python nnoremap <F8> :w <bar> exec '!python3.5 '.shellescape('%')<CR>
autocmd filetype c nnoremap <F8> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && echo Compilation complete && ./'.shellescape('%:r')<CR>
" standard compile
"autocmd filetype cpp nnoremap <F8> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && echo Compilation complete && ./'.shellescape('%:r')<CR>

" compile for the book: Bjarne Stroustrup - Programming Principles and
" Practice Using C++.pdf
" C++11
autocmd filetype cpp nnoremap <F8> :w <bar> exec '!clear;g++ -std=c++11 -o '.shellescape('%:r').' '.shellescape('%').' && echo Compilation complete && ./'.shellescape('%:r')<CR>

" compilte for debugging and run
" compilre and run ddd
autocmd filetype cpp nnoremap <F10> :w <bar> exec '!clear;g++ -std=c++11 -g -o '.shellescape('%:r').' '.shellescape('%').' && echo Compilation complete && ddd '.shellescape('%:r')<CR>
" compile and run gdb
autocmd filetype cpp nnoremap <F10> :w <bar> exec '!clear;g++ -std=c++11 -g -o '.shellescape('%:r').' '.shellescape('%').' && echo Compilation complete && gdb '.shellescape('%:r')<CR>

" Python Edit
"nnoremap <silent> <F8> :w\|!clear;python3.5 %<
nnoremap <silent> <F7> :w\|!clear;python3.5 -i %<CR>
nnoremap <silent> <F6> :w\|!ipython3 -i  %<CR>
" nnoremap <silent> <F6> :w\|!ipdb3 %<CR>
nnoremap <silent> <F5> :w\|!pudb3 %<CR>


" Java Edit
"autocmd Filetype java set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map <F10> :Java<Return>
"map <F12> :Java %<Return>

" remaping ESC-Keys
imap jj <Esc>
cmap ff <Esc>
nnoremap q }

" del empty space at the end of line
map <F9> :%s/\s\+$//<Return>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set pastetoglle to avoid problems
" if passing text from another applications/clipboard
set pastetoggle=<F4>

" Insert newline without entering insert mode with Enter
nnoremap <CR> o<Esc>

" Insert newline above curren line with Backspace
nnoremap <BS> O<Esc>

" remember position when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" jump back/forward - shortcuts:
" ctrl + o
" ctrl + i

" Configuring the cursor
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif
