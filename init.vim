" File ~/.vimrc

" useful vim/neovim commands for reference
" because i'll inevitably forget them
"
" Big reference:
" https://neovim.io/doc/user/vimindex
"
" Quick reference:
" https://neovim.io/doc/user/quickref/
"
"  LSP and related
"  n K - hover symbol
"  n grt - go to type definition
"  n grt - go to implementation
"  n gra - code action
"  n C-t - jump back from open definition (tabstack)
"  n C-i - jump forward
"  n C-w d - show diagnostics
"
"  Diagnostics
"  ]d jumps to the next diagnostic in the buffer.
"  [d jumps to the previous diagnostic in the buffer.
"  ]D jumps to the last diagnostic in the buffer.
"  [D jumps to the first diagnostic in the buffer.
"  <C-w>d shows diagnostic at cursor in a floating window.

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
" nerdtree-tabs is unmaintained, my own fork includes a fix for
" closing multiple tabs without exploding
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'vivaldi-va/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vivaldi-va/vim-obsessive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'ap/vim-css-color'
Plug 'triglav/vim-visual-increment'
Plug 'mtth/scratch.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" In-file searching ala 'ack'
Plug 'tpope/vim-dispatch' | Plug 'gabesoft/vim-ags'


" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax highlighting
Plug 'saltstack/salt-vim'
"Plug 'stephpy/vim-yaml'
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
" Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'aklt/plantuml-syntax'
Plug 'sile-typesetter/vim-sile'
"Plug 'jparise/vim-graphql'
Plug 'zhaozg/vim-diagram'
Plug 'flowtype/vim-flow'
Plug 'lepture/vim-jinja'
Plug 'sheerun/vim-polyglot'

" autocomplete and assistance
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'pmizio/typescript-tools.nvim' | Plug 'nvim-lua/plenary.nvim'

" LSP & Completion
Plug 'Sebastian-Nielsen/better-type-hover', { 'do': 'npm install -g @vtsls/language-server' }
Plug 'mason-org/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'rhysd/vim-lsp-ale'


" Javascript stuff
"Plug 'joegesualdo/jsdoc.vim'
Plug 'heavenshell/vim-jsdoc', { 'do': 'make install' }

" Ctags tagbar
Plug 'majutsushi/tagbar'

" Git
" Can't get these to work, neovim doesn't play nice with xdg-open for some
" reason
"Plug 'tyru/open-browser.vim'
"Plug 'tyru/open-browser-github.vim'
" Plug 'Almo7aya/openingh.nvim', { 'branch': 'main' }
Plug 'knsh14/vim-github-link'
Plug 'linrongbin16/gitlinker.nvim'

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
Plug 'pocco81/true-zen.nvim'

" The all-important colorscheme
" unmaintained, using fork below instead (rip)
" Plug 'morhetz/gruvbox'
 Plug 'gruvbox-community/gruvbox'

" AI garbage
"Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
" Plug 'github/copilot.vim'
" Plug 'zbirenbaum/copilot.lua'
" Plug 'jonahgoldwastaken/copilot-status.nvim'

call plug#end()

" Lua plugin configs
"lua vim.lsp.config('tsserver', {
"      \ cmd = {'tsc', '--lsp', '--stdio'},
"      \ filetypes = { 'typescript', 'typescriptreact' },
"      \ root_dir = vim.fs.root(0, {'package.json', '.git'}),
"      \ on_attach = on_attach,
"      \ capabilities = capabilities,
"      \ })
      "\ cmd = {'vtsls', '--stdio'},

" lsp setup from https://dotfiles.substack.com/p/native-lsp-in-neovim-012
lua require('mason').setup()
lua require('mason-tool-installer').setup({
      \  ensure_installed = {
      \    'tsc',
      \    'gopls',
      \    'vimls',
      \    'emmet-language-server',
      \    'somesass_ls',
      \ }
      \})
lua require('mason-lspconfig').setup({ automatic_enable = false })
lua vim.lsp.config('tsc', vim.lsp.config.tsc)
lua vim.lsp.config('emmet-language-server', vim.lsp.config.emmet_language_server)
lua vim.lsp.config('vimls', vim.lsp.config.vimls)
lua vim.lsp.config('somesass_ls', vim.lsp.config.somesass_ls)

autocmd VimEnter,FileType typescript,typescriptreact lua require('better-type-hover').setup({
 \ openTypeDocKeymap = "K",
 \})
lua vim.lsp.config('gopls', vim.lsp.config.gopls)

lua vim.lsp.enable({ 'tsc', 'emmet-language-server', 'vimls', 'gopls', 'somesass_ls' })

lua local on_attach = function(client, bufnr)
      \ vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      \ vim.cmd [[set completeopt+=menuone,noselect,popup]]
      \end

command! GetCompletion lua vim.lsp.completion.get()
xnoremap <C-n> call GetCompletion<CR>
"noremap <silent> gd :GoToDefinition<CR>

let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('~/.config/nvim/vim-lsp.log')

"
" Config starts here
"

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

augroup FileMarks
  " tip: `<mark> to navigate
  autocmd!
  autocmd BufLeave *.css,*.scss             normal! mC
  autocmd BufLeave *.html                   normal! mH
  autocmd BufLeave *.js,*.ts,*.jsx,*.tsx    normal! mJ
  autocmd BufLeave *.md                     normal! mM
  autocmd BufLeave *.yml,*.yaml             normal! mY
  autocmd BufLeave *.vim                    normal! mV
  autocmd BufLeave .env*                    normal! mE
augroup END

lua vim.o.winborder = 'rounded'

" All key mappings
""""""""""""""""""

" Hail to the <leader>
let mapleader = ","

nmap <leader>s :Scratch<CR>

" Bind to clear search
"nmap <leader>/ :noh<CR>
nnoremap <CR> :noh<CR>

" JSDoc
nmap <silent> <leader>j <Plug>(jsdoc)

" NERDTree toggle
noremap <leader>t :NERDTreeTabsToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
"nmap <leader>j :<C-u>call JSDocAdd()<CR>

" Map main trigger for fuzzy file finder
noremap <C-p> :FZF<CR>
noremap <M-f> :Ag<CR>
noremap <M-m> :Marks<CR>

" Tagbar/ctags
nmap <F2> :TagbarToggle<CR>

" Cycle through line number display modes
nnoremap <silent> <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Github links
noremap <leader>g :GitLink default_branch<CR>

" Writing and prose mode
nmap <leader>p :ProseMode<CR>
nnoremap <leader>ct :ThesaurusQueryLookupCurrentWord<CR>
nnoremap <leader>w :Wordy<space>
nnoremap <F8> :NextWordy<CR>
nnoremap <leader>W :NoWordy<CR>

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

" disable folding
set nofoldenable

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

" JSON
let g:vim_json_syntax_conceal = 0


" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
let NERDTreeIgnore = ['\.pyc$', '\.egg$', '\.o$', '\~$', '__pycache__$', '\.egg-info$', 'node_modules']
let NERDTreeShowHidden=1

function! Nerd()
  NERDTree

  if argc() == 0 && !exists('s:std_in')
    NERDTreeTabsOpen
    wincmd p
    return
  endif

  " hide NERDTree if no args when entering vim
  " e.g. `vim foo.bar`
  NERDTreeTabsClose
endfunction

autocmd VimEnter * call Nerd()

" Syntax checker options
let g:flake8_ignore="E128,E501"


" ALE settings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_floating_preview = 1
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'typescript': ['eslint', 'prettier'], 'typescriptreact': ['eslint', 'prettier']}
" let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint', 'prettier'], 'yaml': ['yamllint']}
let g:ale_linters = {'javascript': ['eslint', 'tsserver'], 'yaml': ['yamllint']}
let b:ale_linters_ignore = ['tslint']
" keyboard commands to skip to next ALE error
nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

" noremap K :ALEHover<CR>
"noremap <silent> gr :ALEFindReferences<CR>
"noremap <silent> gd :ALEGoToDefinition<CR>
command! GoToDefinition lua vim.lsp.buf.definition()
command! Hover lua vim.lsp.buf.hover({ border = "single" })
" noremap <silent> K :Hover<CR>

" configure filetypes, e.g. disable for specific things
" * go: ALE doesn't play well with vim-go's GoFmt and causes freezes
let g:ale_pattern_options = {
      \ '.*\.go$': {'ale_enabled': 0},
      \}

au BufReadPost *.njk set syntax=jinja

let g:jsx_ext_required = 0

" emmet settings
let s:emmet_prefs = expand('~/.emmet_preferences.json')
if filereadable(s:emmet_prefs)
  try
    let g:user_emmet_settings = json_decode(join(readfile(s:emmet_prefs), "\n"))
  catch
    echohl WarningMsg
    echomsg 'emmet: could not parse ' . s:emmet_prefs . ' (' . v:exception . ')'
    echohl NONE
  endtry
endif


hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi SpellBad ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Folded term=bold ctermfg=85 ctermbg=234 gui=bold guifg=#9cffd3 guibg=#202020

" Code completion

" disable by default
" vim.g.copilot_filetypes = {
" 	["*"] = false,
" }
" let g:copilot_filetypes = { '*': v:false }

" explicitly request for copilot suggestions on Ctrl-Enter
"vim.keymap.set('i', '<C-CR>', '<Plug>(copilot-suggest)')
" inoremap <M-CR> <Plug>(copilot-suggest)

" fix suggestions etc. persisting after Ctrl-C
" https://github.com/orgs/community/discussions/77719#discussioncomment-8016504
inoremap <c-c> <esc>

" plugin docs and bind: https://github.com/github/copilot.vim/blob/release/doc/copilot.txt#L152

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
hi statusline cterm=NONE gui=NONE

" Line numbers
set number

filetype plugin indent on


" Where swap and backup files go
silent !mkdir -p ~/.config/nvim/.backup_files > /dev/null
silent !mkdir -p ~/.config/nvim/.swap_files > /dev/null
silent !mkdir -p ~/.config/nvim/.undo_files > /dev/null
set backupdir=~/.config/nvim/.backup_files
set directory=~/.config/nvim/.swap_files
set undodir=~/.config/nvim/.undo_files
"set backupdir=~/.config/vim/backup_files//
"set directory=~/.config/vim/swap_files//
"set undodir=~/.config/vim/undo_files//

" Vim-Golang plugin configs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Automatically strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Open ags results in new tab with ot
autocmd FileType agsv nnoremap <buffer> ot
  \ :exec 'tab split ' . ags#filePath(line('.'))<CR>

" clipboard
" Linux requires 'apt-get install xclip'
set clipboard+=unnamedplus

let g:netrw_browsex_viewer="xdg-open"

"""
" filetype definitions
"""
autocmd BufNewFile,BufRead *.mmd set filetype=sequence
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact


function! CopyRelPath()
  let l:path = '/' . expand('%')
  call setreg('+', l:path)
  echo "Copied current path: " . l:path
endfunction

command! CopyRelPath call CopyRelPath()

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

lua vim.api.nvim_create_user_command('CloseFloatingWindows', function()
\   for _, win in ipairs(vim.api.nvim_list_wins()) do
\     local config = vim.api.nvim_win_get_config(win)
\     if config.relative ~= "" then
\       vim.api.nvim_win_close(win, false)
\     end
\   end
\ end, {})

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
"
"   Grammar
"   Wordy docs: https://github.com/preservim/vim-wordy
"   ,w            - Cycle wordy
"   ,W            - End wordy
"   F8            - Next wordy dictionary
"   ]s            - Next Wordy flag
"   [s            - Prev Wordy flag


augroup writing
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType text call lexical#init()

  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType text call litecorrect#init()

  autocmd FileType markdown,mkd call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END

" Prose mode
let w:prose_mode = 0
let w:nerd_return = 0

function! ProseMode()
  setlocal spell "noci nosi noai nolist noshowmode noshowcmd
  setlocal complete+=s
  if get(w:, 'prose_mode', 0) == 0
    if exists('g:NERDTree') && g:NERDTree.IsOpen()
      let w:nerd_return = 1
      NERDTreeTabsClose
    endif
    Goyo
    SoftPencil
    let w:prose_mode = 1
  else
    let w:prose_mode = 0
    Goyo!
    setlocal nospell
    PencilOff
    if get(w:, 'nerd_return', 0) == 1
      call Nerd()
      let w:nerd_return = 0
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
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showcmd
  hi statusline cterm=NONE gui=NONE
  let g:loaded_airline = 1
  set eventignore=
  Limelight!
  GitGutterEnable
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

command! ProseMode call ProseMode()

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

let g:airline#extensions#obsession#enabled = 0
let g:obsessive#dir = '~/.nvim/session'
let g:obsessive#airline_enabled = 1
