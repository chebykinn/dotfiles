"==============================================================================

" Variables

set nocompatible
set backspace=indent,eol,start      " backspacing over everything in insert
set backup                          " keep a backup file
set history=7000                    " keep 7000 lines of command line history
set ruler                           " show the cursor position all the time
set mouse=a
set showcmd                         " display incomplete commands
set incsearch                       " do incremental searching
set ttyfast
set number
set nocursorline

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

set showmatch               " Briefly jump to the matching bracket when typing
set matchtime=0
set tags=./tags;./TAGS;./ctags;tags;TAGS;ctags
set signcolumn=yes
set complete-=i
set guifont=Monospace:h10

" Alternatively (in your .vimrc, to completely disable the plugin):
let loaded_matchparen = 1

nohl                        " Disable highlighting last search in new files

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

set t_Co=256
set background=dark
colorscheme molokai
if &diff
    colorscheme monokai
endif

" Allow using russian keymap in command mode
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Airline settings
let g:airline_theme = 'badwolf'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
set laststatus=2
set ttimeoutlen=50          " Timeout for airline mode switching

" Directories to keep *~ and *.swp files
set backupdir=./.backup,~/root/data/tmp,/tmp
set directory=~/root/data/tmp,./.backup,/tmp

set colorcolumn=80
set splitbelow
set splitright

let g:lasttab = 1

" Show tabs indent
set listchars=tab:\ \ ,trail:\·
set list

set path+=src
set path+=src/include
set path+=include
set path+=h
set path+=/usr/include/c++/8.2.1

" Increase max number of tabs when opening with -p option
set tabpagemax=100

let g:pandoc#syntax#conceal#use = 0

let g:tex_fast = ""

let g:enable_lessmess_onsave = 0

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"==============================================================================

" Keymaps


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Toggle paste mode
set pastetoggle=<F2>
let mapleader=","

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Cancel highlighting after search
nnoremap <F3> :noh<CR>

" Trim
nnoremap <F4> :Trim<CR>

map <Leader>n :NERDTreeTabsToggle<CR>

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

nmap <Leader>tt :exe "tabn ".g:lasttab<CR>

" To create a new tab
nnoremap <C-w>t :tabnew<CR>
inoremap <C-w>t <Esc>:tabnew<CR>
" Only highlight word but don't jump to next
nnoremap * m`:keepjumps normal! *``<cr>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Workaround to prevent escape not working since i'm not using alt bindings
" anyway
inoremap <M-Up> <Esc>

" Disable man search
map K <Nop>

" Insert new line in command mode
nmap <C-o> o<Esc>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"==============================================================================

" Commands


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    " Set filetype to tpp files
    au BufRead,BufNewFile *.tpp setfiletype cpp.doxygen
    au BufRead,BufNewFile *.cpp setfiletype cpp.doxygen
    au BufRead,BufNewFile *.h setfiletype cpp.doxygen

    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END

    augroup END

    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

     au TabLeave * let g:lasttab = tabpagenr()

    "set completeopt-=preview
    "if executable('ccls')
        "au User lsp_setup call lsp#register_server({
            "\ 'name': 'ccls',
            "\ 'cmd': {server_info->['ccls']},
            "\ 'root_uri': {server_info->lsp#utils#path_to_uri(getcwd().'/build/compile_commands.json')},
            "\ 'initialization_options': { 'cacheDirectory': '.ccls-cache' },
            "\ 'whitelist': ['c', 'cpp', 'cpp.doxygen', 'objc', 'objcpp', 'cc'],
            "\ })
    "endif
    "if executable('cquery')
        "au User lsp_setup call lsp#register_server({
            "\ 'name': 'cquery',
            "\ 'cmd': {server_info->['cquery']},
            "\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
            "\ 'initialization_options': { 'cacheDirectory': '/home/ivan/.cache/cquery' },
            "\ 'whitelist': ['c', 'cpp', 'cpp.doxygen', 'objc', 'objcpp', 'cc'],
            "\ })
    "endif
    "if executable('clangd')
        "au User lsp_setup call lsp#register_server({
            "\ 'name': 'clangd',
            "\ 'cmd': {server_info->['clangd', '-compile-commands-dir='.getcwd().'/build']},
            "\ 'whitelist': ['c', 'cpp', 'cpp.doxygen', 'objc', 'objcpp'],
            "\ })
    "endif
    "if executable('rls')
        "au User lsp_setup call lsp#register_server({
                "\ 'name': 'rls',
                "\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
                "\ 'whitelist': ['rust'],
                "\ })
    "endif

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

function! AddFunctionBody() range
    " Save current pos
    let l:winview = winsaveview()
    " Do subst
    exe a:firstline.','.a:lastline.'s/;/ {}/'
    " Delete trailing line
    exe line('.').'d'
    " Clear search pattern
    let @/ = ""
    " Restore pos
    call winrestview(l:winview)
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! SetterFn(line, linenum)
    let l:pod_types = '\(bool\|u\?int\([0-9]+_t\)\?\)'
    if a:line =~ pod_types
        exe a:linenum.'s/^\(\s*\)\([^ ]\+\)\s*m_\([a-z_]*\);\?/\1void \3(\2 new_\3) { m_\3 = new_\3; }/'
    else
        exe a:linenum.'s/^\(\s*\)\([^ ]\+\)\s*m_\([a-z_]*\);\?/\1void \3(const \2 \&new_\3) { m_\3 = new_\3; }/'
    endif
endfunction


function! SetterFnRange() range
    let l:lines = getline(a:firstline, a:lastline)
    let l:cnt = a:firstline
    for line in lines
        call SetterFn(line, cnt)
        let cnt += 1
    endfor
endfunction

function! GetterFn(line, linenum)
    let l:pod_types = '\(bool\|u\?int\([0-9]+_t\)\?\)'
    if a:line =~ pod_types
        exe a:linenum.'s/^\(\s*\)\([^ ]\+\)\s*m_\([a-z_]*\);\?/\1\2 \3() const { return m_\3; }/'
    else
        exe a:linenum.'s/^\(\s*\)\([^ ]\+\)\s*m_\([a-z_]*\);\?/\1const \2 \&\3() const { return m_\3; }/'
    endif
endfunction


function! GetterFnRange() range
    let l:lines = getline(a:firstline, a:lastline)
    let l:cnt = a:firstline
    for line in lines
        call GetterFn(line, cnt)
        let cnt += 1
    endfor
endfunction

" Write as root
command! Sw w !sudo tee % >/dev/null

command! W w

" Trim trailing spaces and tabs
command! Trim %s/\(\s\|<tab>\)\+$//g|noh

command! -range Fnbody <line1>,<line2>call AddFunctionBody()
command! -range Getter <line1>,<line2>call GetterFnRange()
command! -range Setter <line1>,<line2>call SetterFnRange()

"==============================================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mboughaba/vim-lessmess'
Plug 'tpope/vim-fugitive'

call plug#end()
