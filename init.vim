" File ~/.vimrc

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
"Plug 'scrooloose/nerdcommenter'
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
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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
Plug 'amadeus/vim-mjml'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'aklt/plantuml-syntax'
Plug 'sile-typesetter/vim-sile'
Plug 'jparise/vim-graphql'
Plug 'zhaozg/vim-diagram'
Plug 'flowtype/vim-flow'
Plug 'lepture/vim-jinja'


" Code folding for Python
Plug 'tmhedberg/SimpylFold'

" Javascript stuff
Plug 'joegesualdo/jsdoc.vim'

" Ctags tagbar
Plug 'majutsushi/tagbar'

" Git
" Can't get these to work, neovim doesn't play nice with xdg-open for some
" reason
"Plug 'tyru/open-browser.vim'
"Plug 'tyru/open-browser-github.vim'
" Plug 'Almo7aya/openingh.nvim', { 'branch': 'main' }
Plug 'knsh14/vim-github-link'

" Prose mode/writing
"
" Allow better soft-wrapping of text in prose-based
" formats e.g. markdown.
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'junegunn/limelight.vim' " Highlights only active paragraph
Plug 'reedes/vim-lexical' " Better spellcheck mappings
Plug 'reedes/vim-litecorrect' " Better autocorrections
Plug 'kana/vim-textobj-user' " dependency for textobj-sentence
Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plug 'reedes/vim-wordy' " Weasel words and passive voice
Plug 'ron89/thesaurus_query.vim'

" The all-important colorscheme
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

" don't need the mode to show since it's in the status line
set noshowmode

" since I constantly accidentally mess these up when going fast
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
nmap <leader>/ :noh<CR>


" NERDTree toggle
noremap <leader>t :NERDTreeTabsToggle<CR>
noremap <leader>f :NERDTreeFind<CR>

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
let g:python3_host_prog = '/usr/bin/python3'

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
let g:javascript_plugin_jsdoc=1

nmap <leader>j :<C-u>call JSDocAdd()<CR>


" JSON
let g:vim_json_syntax_conceal = 0


" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
let NERDTreeIgnore = ['\.pyc$', '\.egg$', '\.o$', '\~$', '__pycache__$', '\.egg-info$', 'node_modules']
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

" ALE settings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'typescript': ['eslint', 'prettier'], 'typescriptreact': ['eslint', 'prettier']}
" let b:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint', 'prettier'], 'yaml': ['yamllint']}
let b:ale_linters = {'javascript': ['eslint'], 'yaml': ['yamllint']}
" keyboard commands to skip to next ALE error
" note: <C-[> is mapped as an equivalent to ESC, so
" <C-}> is used as Control-Shift-]
nmap <silent> <C-}> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

" configure filetypes, e.g. disable for specific things
" * go: ALE doesn't play well with vim-go's GoFmt and causes freezes
let g:ale_pattern_options = {
      \ '.*\.go$': {'ale_enabled': 0},
      \}

au BufReadPost *.njk set syntax=jinja

let g:jsx_ext_required = 0

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
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0

" Line numbers
set number
nnoremap <silent> <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

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

let g:netrw_browsex_viewer="xdg-open"

autocmd BufNewFile,BufRead *.mmd set filetype=sequence

" Configure vim-pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text
                            \   call pencil#init({ 'wrap': 'soft', 'textwidth':  80 })
                            \ | setl spell spl=en_gb fdl=4 noru nonu nornu
                            \ | setl fdo+=search
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT*
                            \   call pencil#init({'wrap': 'soft', 'textwidth': 72})
                            \ | setl spell spl=en_gb et sw=2 ts=2 noai
  autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60})
                            \ | setl spell spl=en_gb et sw=2 ts=2 noai nonu nornu
  autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'})
                            \ | setl spell spl=en_gb et sw=2 ts=2
augroup END

let g:airline_section_x = '%{PencilMode()}'

" Editorconfig exceptions
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_disable_rules = ['max_line_length']

nmap <leader>s :Scratch<CR>

" configuring colours
"

" writing and text file plugin config
" Commands:
"   <leader>p   - enter prose mode (clean writing mode)
"   <leader>ct  - thesaurus lookup alternatives for current word
"
"   Navigation
"   )           - move to start of next sentance
"   (           - move to start of previous sentance
"   g)          - jump to end of current sentence
"   g(          - jump to end of previous sentence
"   as          - select 'around' sentance (includes trailing ws)
"   is          - select 'inside' sentance (excludes trailing ws)
"
"   Spelling
"   z=          - open spelling suggestions
"   zG          - accept spelling for this session
"   zg          - accept spelling and add to personal dictionary
"   zW          - treat as misspelling for this session
"   zw          - treat as misspelling and add to personal dictionary


augroup writing
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType text call lexical#init()

  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType text call litecorrect#init()

  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END

" Prose mode
let g:prose_mode = 0
let g:nerd_return = 0

function! ProseMode()
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  if !g:prose_mode
    let g:prose_mode = 1
    if exists('g:NERDTree') && g:NERDTree.IsOpen()
      let g:nerd_return = 1
      NERDTreeTabsClose
    endif
    Goyo
    SoftPencil

  else
    let g:prose_mode = 0
    Goyo!
    if g:nerd_return
      NERDTree
      NERDTreeTabsOpen
      let g:nerd_return = 0
    endif
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
  GitGutterDisable
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
  GitGutterEnable
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

command! ProseMode call ProseMode()
nmap <leader>p :ProseMode<CR>

nnoremap <leader>ct :ThesaurusQueryLookupCurrentWord<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
   return g:word_count
endfunction
function UpdateWordCount()
   let lnum = 1
   let n = 0
   while lnum <= line('$')
       let n = n + len(split(getline(lnum)))
       let lnum = lnum + 1
   endwhile
   let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
   au! CursorHold,CursorHoldI * call UpdateWordCount()
  " Set statusline, shown here a piece at a time
  highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
  autocmd FileType text set statusline+=\ %{WordCount()}\ words,
augroup END

