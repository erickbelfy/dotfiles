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
execute pathogen#helptags()


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

""Colorscheme
colorscheme neodark
let g:neodark#use_256color = 1 " default: 0

"" Poweline configs
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

"" Additional configuration for powerline
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

""indent guides
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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint', 'flow', 'standard']

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
"
" Flow.vim {{{
augroup flow_config
  autocmd!
  let g:flow#enable = 0
  let g:flow#autoclose = 1
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
