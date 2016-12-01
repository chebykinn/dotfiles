"==============================================================================

" Variables

set nocompatible
set backspace=indent,eol,start 		" backspacing over everything in insert
set backup							" keep a backup file
set history=7000					" keep 7000 lines of command line history
set ruler							" show the cursor position all the time
set mouse=a
set showcmd							" display incomplete commands
set incsearch						" do incremental searching
set ttyfast
set number
set cursorline

set smartindent
set autoindent
set noexpandtab
set copyindent
set preserveindent

set softtabstop=0
set shiftwidth=4
set tabstop=4

set showmatch				" Briefly jump to the matching bracket when typing
set matchtime=0
set tags=./tags,./TAGS,./ctags,tags,TAGS,ctags

" Alternatively (in your .vimrc, to completely disable the plugin):
let loaded_matchparen = 1

nohl						" Disable highlighting last search in new files

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

set t_Co=256
set background=dark
colorscheme molokai

" Allow using russian keymap in command mode
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Airline settings
let g:airline_theme = 'badwolf'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
set laststatus=2
set ttimeoutlen=50			" Timeout for airline mode switching

" Directories to keep *~ and *.swp files
set backupdir=./.backup,~/root/data/tmp,/tmp
set directory=~/root/data/tmp,./.backup,/tmp

set colorcolumn=80
set splitbelow
set splitright

let g:lasttab = 1

" IndentLine plugin settings
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '¦' " or ▸
" Show tabs indent
set listchars=tab:\ \ ,trail:\·
set list
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

map <Leader>n <plug>NERDTreeTabsToggle<CR>

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

nmap <Leader>tt :exe "tabn ".g:lasttab<CR>

" To create a new tab
nnoremap <C-w>t :tabnew<CR>
inoremap <C-w>t <Esc>:tabnew<CR>

" Tab Navigation
nnoremap H gT
nnoremap L gt

"==============================================================================

" Commands


" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin on

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
	au BufRead,BufNewFile *.tpp setfiletype cpp

	augroup END

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

" Write as root
command! Sw w !sudo tee % >/dev/null

command! W w

" Trim trailing spaces and tabs
command! Trim %s/\(\s\|<tab>\)\+$//g|noh

au TabLeave * let g:lasttab = tabpagenr()

"==============================================================================

execute pathogen#infect()
