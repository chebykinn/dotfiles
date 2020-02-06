"==============================================================================
" Variables

let vimdir = $HOME.'/.vim'
if has("nvim")
  let vimdir = $HOME.'/.config/nvim'
endif

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
let g:airline#extensions#branch#enabled = 0
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

let &runtimepath = &runtimepath.','.vimdir.'/snippets'

" Increase max number of tabs when opening with -p option
set tabpagemax=100

let g:pandoc#syntax#conceal#use = 0

let g:tex_fast = ""

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set clipboard=unnamed,unnamedplus

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
set indentkeys-=<:>

let g:clang_format#detect_style_file = 1

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

" Cancel highlighting after search
nnoremap <F3> :noh<CR>
nnoremap <leader>nh :noh<CR>

" Trim
nnoremap <F4> :Trim<CR>
nnoremap <leader>tr :Trim<CR>

map <leader>pt :set paste!<CR>

map <Leader>n :NERDTreeTabsToggle<CR>

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
nmap <silent> <leader>[c <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

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

if has("nvim")
    " Workaround to prevent escape not working since i'm not using alt bindings
    " anyway
    inoremap <M-Up> <Esc>
endif

" Disable man search
map K <Nop>

nmap j gj
nmap k gk

" Switch to header
nmap <leader>hc :A<CR>
nmap <leader>hs :AS<CR>
nmap <leader>hv :AV<CR>
nmap <leader>ht :AT<CR>
nmap <leader>hn :AN<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap F :FZF<CR>
nmap <leader>fn :FZF<CR>
nmap <leader>fb :Buffers<CR>

if has("autocmd")
  au FileType cpp.doxygen nnoremap <buffer> <Leader>mf :<C-u>ClangFormat<CR>
  au FileType cpp.doxygen vnoremap <buffer> <Leader>mf :ClangFormat<CR>
endif


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

    " Set filetype to c++ files
    au BufRead,BufNewFile *.c,*.cc,*.cpp,*.cxx,*.h,*.hpp,*.hxx set filetype=cpp.doxygen
    au FileType gitcommit set cc=72

    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END

    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

    au TabLeave * let g:lasttab = tabpagenr()

    augroup END
endif

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Write as root
command! Sw w !sudo tee % >/dev/null

command! W w

" Trim trailing spaces and tabs
command! Trim %s/\(\s\|<tab>\)\+$//g|noh

"==============================================================================

if empty(glob(vimdir.'/autoload/plug.vim'))
  silent execute "!curl -fLo ".shellescape(vimdir.'/autoload/plug.vim')." --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(vimdir.'/bundle')

Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/close-duplicate-tabs'
Plug 'rhysd/vim-clang-format'

call plug#end()
