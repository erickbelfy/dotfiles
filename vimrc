"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"
"
set nocompatible ""Disable vi compatibility
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype on "Avoids bug when comiting stuff
filetype off "Force reloading of stuff after pathogen is loaded

execute pathogen#infect()

" vim-plug settings to take effects open your vim, then execute command
" :PlugInstall
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/jelera/vim-javascript-syntax
Plug 'jelera/vim-javascript-syntax'

" Shorthand notation; fetches https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Shorthand notation; fetches https://github.com/bigfish/vim-js-context-coloring
Plug 'bigfish/vim-js-context-coloring'

" Shorthand notation; fetches https://github.com/othree/yajs.vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Shorthand notation; fetches https://github.com/gavocanov/vim-js-indent
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent'

" Shorthand notation; fetches https://github.com/mxw/vim-jsx
Plug 'mxw/vim-jsx'

" Shorthand notation; fetches https://github.com/othree/jspc.vim/blob/master/autoload/jspc/javascript.vim
Plug 'othree/jspc.vim'

" Shorthand notation; fetches https://github.com/othree/es.next.syntax.vim
Plug 'othree/es.next.syntax.vim'

" Shorthand notation; fetches https://github.com/othree/javascript-libraries-syntax.vim
Plug 'othree/javascript-libraries-syntax.vim'

" Shorthand notation; fetches https://github.com/ternjs/tern_for_vim
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" Shorthand notation; fetches https://github.com/Shougo/neocomplete.vim
Plug 'Shougo/neocomplete.vim'

" Shorthand notation; fetches https://github.com/1995eaton/vim-better-javascript-completion
Plug '1995eaton/vim-better-javascript-completion'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()

""Make actionscript syntax works
syntax on
filetype plugin indent on
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.hx set filetype=haxe
au BufNewFile,BufRead *.json set filetype=json

""Visual help stuff
set nu
set ai
set lcs=tab:>-,eol:$
set list
set incsearch ""Set incremental search
set hlsearch ""Highlight search results
set ignorecase ""Ignore capital letters when searching in all lower case
set smartcase ""Search using capital letter if a capital letter was typed on search
set encoding=utf-8 nobomb "Avoids BOM and make sure to always use utf-8
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line
set hidden " When a buffer is brought to foreground, remember undo history and marks

""More custom options
set history=999
set undolevels=999
set nobackup
set nowritebackup
set noswapfile
set laststatus=2
set mouse=nicr
""No timeout between shortcut keys
set notimeout

""Formating...
set expandtab ""Insert space chars instead of tab
set autoindent smartindent ""Hope this make indenting stuff easier
set copyindent
set tabstop=4 ""Default number of spaces a tab takes
set shiftwidth=4
set softtabstop=4 ""Allow deletion of whole tabs
set backspace=indent,eol,start
set wildignore+=*.orig,*.svn,*.hg,*.git,*.pyc,*node_modules/**,*bower_components/** ""Ignore all these annoying extensions


""Activate different settings for different file types
autocmd FileType html,htmldjango,xml,ctp set noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType actionscript,haxe,php set noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

""Ignore these types of files
set wildignore+=*.o,*.obj,.git,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,*.pdf,*.mp3,*.avi,*.mp4,*.webm,*.pyc

""Colorscheme stuff
colorscheme solarized
set background=dark

"" Poweline configs
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"" Additional configuration for powerline
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

""indent guides
colorscheme solarized
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=blue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

""syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
"" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
  autocmd!
  nnoremap <leader>rp :RainbowParenthesesToggle<CR>
augroup END
" }}}

"""Uses system clipboard for yanking, only works with vim 7.3+
set clipboard+=unnamed

"" Set the leader to comma
let mapleader=","
let g:mapleader=","

"" Command-t options
let g:CommandTMaxFiles=10000
let g:CommandTMaxDepth=15

"" Set easy motion to use only one leader stroke
let g:EasyMotion_leader_key = '<Leader>'


"" I don't want any buffkill keymap
let g:BufKillCreateMappings = 0


" javascript-libraries-syntax.vim {{{
augroup javascript_libraries_config
  autocmd!
  let g:used_javascript_libs = 'underscore,backbone,angularjs,react,jasmine,flux'
augroup END
" }}}
"



" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
augroup END
" }}}
"
"
"
" completition.vim {{{
augroup completition_config
  autocmd!
"let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

let g:vimjs#smartcomplete = 1
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 1
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs
augroup END
" }}}


" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

"" Make arrow keys works for wrapped lines$
map <up> gk
map <down> gj

"" Remap tab on normal mode to switch between buffers
nnoremap <silent> <tab> <C-^>

"" Better nerdtoolbar shortcut$
nnoremap <silent> <leader><tab> :NERDTreeToggle<cr>

"" Remap command-t shortcuts
nnoremap <silent> <leader>g :CommandT<cr>
nnoremap <silent> <leader>h :CommandTBuffer<cr>
nnoremap <silent> <leader>p :YRShow<cr>

"" Gundo map
nnoremap <F5> :GundoToggle<CR>

"" Make ctrl+hjkl switch between splited screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""Close a file without closing the buffer
nnoremap <silent> <Leader>bd :Bclose<CR>

"" Configs splitjoin keys
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Moving block selection
xmap <C-k> :mo'<-- <CR> gv
xmap <C-j> :mo'>+ <CR> gv

nnoremap <C-N> :tabnew<cr>
nnoremap <C-x> :tabclose<cr>

" Make arrows switch between buffers
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
