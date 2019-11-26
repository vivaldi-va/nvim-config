" File ~/.vimrc

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'triglav/vim-visual-increment'
"Plug 'vivaldi-va/tabline.vim'
Plug 'mtth/scratch.vim'
Plug 'christoomey/vim-tmux-navigator'

" In-file searching ala 'ack'
Plug 'gabesoft/vim-ags'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Syntax highlighting
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'pangloss/vim-javascript'
Plug 'Chiel92/vim-autoformat'
Plug 'mutewinter/nginx.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/groovy.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'amadeus/vim-mjml'
Plug 'leafgarland/typescript-vim'
Plug 'aklt/plantuml-syntax'


" Code folding for Python
Plug 'tmhedberg/SimpylFold'

" Javascript stuff
Plug 'heavenshell/vim-jsdoc'

" Ctags tagbar
Plug 'majutsushi/tagbar'

" Allow better soft-wrapping of text in prose-based
" formats e.g. markdown.
Plug 'reedes/vim-pencil'

" The all-important colorscheme
Plug 'altercation/vim-colors-solarized'
Plug '29decibel/codeschool-vim-theme'
Plug 'morhetz/gruvbox'

call plug#end()

" Colorscheme
let  g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" highlight current window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" All key mappings
""""""""""""""""""

" Hail to the <leader>
let mapleader = ","

" Ignore case in search
set ignorecase
set hlsearch

" don't need swp files
set nobackup
set noswapfile

" Only hide buffers when changing between them;
" this way we can keep their undo histories.
set hidden

" since I constantly write accidentally mess these up when going fast
command! WQ wq
command! Wq wq
command! W w
command! Q q

" w!! to write with sudo even if not opened with sudo
cmap w!! w !sudo tee >/dev/null %
"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" Bind to clear search
nmap <leader>/ :nohlsearch<CR>


" NERDTree toggle
noremap <leader>t :NERDTreeTabsToggle<CR>

" Run manual syntastic check
noremap <F8> :TagbarToggle<CR>

" Toggle highlight on ,/
nnoremap <leader>/ :set hlsearch!<CR>

" Map main trigger for fuzzy file finder
noremap <C-p> :FZF<CR>

" Tagbar/ctags
nmap <F2> :TagbarToggle<CR>

" General code style settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Python bins
"""""""""""""""""""
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Python specific configs
"""""""""""""""""""""""""

" We like spaces; avoid tabs
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4

" Remind ourselves to keep Python code to < 80 cols
autocmd FileType python setlocal colorcolumn=80
" Omnifunc for python
autocmd FileType python set omnifunc=pythoncomplete#Complete

" JavaScript specific configs
"""""""""""""""""""""""""""""

autocmd FileType javascript setlocal shiftwidth=2 expandtab tabstop=2 softtabstop=2
autocmd FileType javascript setlocal colorcolumn=99

" JSDoc config
let g:jsdoc_enable_es6=1
" let g:javascript_plugin_jsdoc=1

" JSON
let g:vim_json_syntax_conceal = 0


" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
let NERDTreeIgnore = ['\.pyc$', '\.egg$', '\.o$', '\~$', '__pycache__$', '\.egg-info$']
let NERDTreeShowHidden=1

function! Nerd()
  if argc() == 0 && !exists("s:std_in")
    NERDTree
    NERDTreeTabsOpen
  endif
endfunction

autocmd VimEnter * call Nerd()

" Syntax checker options
let g:flake8_ignore="E128,E501"

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_jump = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_disabled_filetypes=['html', 'jinja']
let g:syntastic_python_flake8_args='--ignore=E501,E128'
let g:syntastic_scss_checkers = ['scss_lint']

let g:jsx_ext_required = 0

" Load checkers which have configuration present
function! JavascriptCheckers()
  let checkers = []
  if filereadable(getcwd() . '/.jscsrc')
    call add(checkers, 'jscs')
  endif

  if filereadable(getcwd() . '/.jshintrc')
    call add(checkers, 'jshint')
  endif

  " look for the closest eslintrc file up the tree
  if findfile('.eslintrc', '.;') != ''
    call add(checkers, 'eslint')
  endif

  if findfile('.eslintrc.js', '.;') != ''
    call add(checkers, 'eslint')
  endif

  " Use the locally installed eslint if it exists
  if findfile(getcwd() . '/node_modules/.bin/eslint') != ''
    let b:syntastic_javascript_eslint_exec = getcwd() . '/node_modules/.bin/eslint'
  endif

  return checkers
endfunction

if findfile(getcwd() . '/node_modules/.bin/eslint') != ''
  let b:syntastic_javascript_eslint_exec = getcwd() . '/node_modules/.bin/eslint'
endif

" let g:syntastic_javascript_checkers=['jscs', 'eslint', 'jshint']
let g:syntastic_javascript_checkers=[]
autocmd FileType javascript let b:syntastic_checkers = JavascriptCheckers()

hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi SpellBad ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Folded term=bold ctermfg=85 ctermbg=234 gui=bold guifg=#9cffd3 guibg=#202020

" Map main trigger for fuzzy file finder
let g:fzf_height = '30%'

" I CAN HAZ NORMAL REGEXES?
nnoremap / /\v
vnoremap / /\v

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

" Automatically populate the g:airline_symbols dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'default'

" Line numbers
set number

filetype plugin indent on


" Where swap and backup files go
set backupdir=~/.config/vim/backup_files//
set directory=~/.config/vim/swap_files//
set undodir=~/.config/vim/undo_files//

" Vim-Golang plugin configs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Code folding for pythonm
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Automatically strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Open ags results in new tab with ot
autocmd FileType agsv nnoremap <buffer> ot
  \ :exec 'tab split ' . ags#filePath(line('.'))<CR>

" clipboard
" Linux requires 'apt-get install xclip'
set clipboard+=unnamedplus

" Configure vim-pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,txt
                            \   call pencil#init({ 'wrap': 'soft' })
                            \ | setl spell spl=en_us fdl=4 noru nonu nornu
                            \ | setl fdo+=search
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                            \   call pencil#init({'wrap': 'soft', 'textwidth': 72})
                            \ | setl spell spl=en_us et sw=2 ts=2 noai
  autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60})
                            \ | setl spell spl=en_us et sw=2 ts=2 noai nonu nornu
  autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'})
                            \ | setl spell spl=en_us et sw=2 ts=2
augroup END

let g:airline_section_x = '%{PencilMode()}'

" Editorconfig exceptions
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" configuring colours
"

" Prose mode
let g:prose_mode = 0

function! ProseMode()
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  if !g:prose_mode
    let g:prose_mode = 1
    if exists('g:NERDTree') && g:NERDTree.IsOpen()
      NERDTreeTabsClose
    endif
    Goyo
    SoftPencil

  else
    let g:prose_mode = 0
    Goyo!
    NERDTree
    NERDTreeTabsOpen
  endif
endfunction

let g:limelight_conceal_ctermfg = 250
let g:limelight_conceal_guifg = '#d5c4a1'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  let g:loaded_airline = 0
  set eventignore=FocusGained
  Limelight
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  let g:loaded_airline = 1
  set eventignore=
  Limelight!
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

command! ProseMode call ProseMode()
nmap <leader>p :ProseMode<CR>

nmap <leader>s :Scratch<CR>

