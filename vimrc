"==============================================================================
" Plugins
"==============================================================================
if empty('~/.vim/plugged')
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

if ! has('nvim')
	Plug 'noahfrederick/vim-neovim-defaults'
endif

"==========[ interface ]==========
Plug 'hunter-/tester.vim'
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'neomake/neomake'

"==========[ text editing ]==========
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

"==========[ tmux ]==========
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'wellle/tmux-complete.vim'

"==========[ language ]==========
Plug 'mustache/vim-mustache-handlebars', { 'for' : 'mustache' }
Plug 'vim-perl/vim-perl', { 'for' : 'perl' }
Plug 'Yggdroot/indentLine', { 'for' : 'python' }

"==========[ testing ]==========

" use for:
" - opening specific sized splits
" untested
Plug 'wellle/visual-split.vim'
" use for:
" - tabularizing
" untested
Plug 'godlygeek/tabular'
" use for:
" - idk but it's tpope right?
Plug 'tpope/vim-tbone'
"Plug 'justinmk/vim-sneak'
Plug 'mileszs/ack.vim'
" haven't really used yet
Plug 'tpope/vim-speeddating'

call plug#end()

"==============================================================================
" General
"==============================================================================

"==========[ general ]==========
let netrw_liststyle=3
let mapleader="\<space>"

try
	colorscheme tolerable
catch
endtry

hi clear SignColumn 

set dictionary="/usr/dict/words"
set foldenable
set lazyredraw

"==========[ interface ]==========
set list
set listchars=tab:\|\ 
set noerrorbells
set novisualbell
set number
set nocursorline
set nowrap
set smartindent
set showcmd
set showmatch " highlight matching braces
set timeoutlen=1000 
set ttimeoutlen=0 " no pause on esc

"==========[ files ]==========
set autowrite
set fileformats=unix,dos,mac
set noswapfile
set undodir=~/.vim/undodir
set undofile

"==========[ tabs ]==========
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"==========[ completion ]==========
set wildmode=list:longest,full
set wildignore=*DS_Store*
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set complete-=i " don't scan included files
set complete-=t " don't scan tags
if has('nvim')
	set inccommand=nosplit
endif

"==========[ searching ]==========
set ignorecase " ignore case
set smartcase " case insensitive search becomes sensitive with capitals
set infercase " allow completions to be case-smart

"==========[ scrolling ]==========
set scrolloff=10
set sidescroll=1
set sidescrolloff=5

"==========[ splits ]==========
set splitbelow
set splitright

"==========[ statusline ]==========
hi statusline guibg=DarkGrey
hi statusline ctermfg=0
hi statusline ctermbg=14
hi statuslinenc ctermfg=0
hi statuslinenc ctermbg=14
set statusline=%.100F " Full path (100 chars)
set statusline+=%= " right side
set statusline+=%c " column

"==============================================================================
" Mappings
"==============================================================================

"==========[ normal ]==========
" select what was just pasted 
nnoremap gV `[v`]

" Windows
" vertical 
nnoremap <c-w>1 <c-w>H
" horizontal
nnoremap <c-w>2 <c-w>K

" */# to not map whole word; map g*/g# to match whole word
nnoremap * g*
nnoremap g* *
nnoremap # g#
nnoremap g# #

" turn off highlighting
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Conditionally modify character at end of line
nnoremap <silent> <leader>, :call ModifyLineEndDelimiter(',')<cr>
nnoremap <silent> <leader>; :call ModifyLineEndDelimiter(';')<cr>

" remove trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>nohlsearch<cr>

" save
nnoremap <leader>w :w!<cr>

" edit and load various different files
" vimrc
nnoremap <leader>vv :sp $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>:nohl<cr>

" make n always go forward and N always go back
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" I don't use ex mode; play last macro
nnoremap Q @@

"==========[ insert ]==========
" I find <c-c> easier to type than <c-[> or <esc>
" and haven't found myself wanting to cancel during an insertion
inoremap <c-c> <esc>

" close various structures automatically
inoremap (<cr> (<cr>)<esc>O
inoremap (<tab> ()<esc>i

inoremap [<cr> [<cr>]<esc>O
inoremap [<tab> []<esc>i

inoremap {<cr> {<cr>}<esc>O
inoremap {<tab> {}<esc>i

inoremap '<tab> ''<esc>i

inoremap "<tab> ""<esc>i

"==========[ visual ]==========
" unindent/indent
vnoremap > >gv
vnoremap < <gv

" paste without overwriting buffer
vnoremap r "_dP"

"------insert mode mappings
" forward delete
inoremap <c-d> <del>

" autocompletion
inoremap <tab> <c-r>=TabOrComplete()<cr>

" Turn off <esc> as mode exit in visual mode.
vnoremap <esc> <nop>

" search by visual selection
vnoremap <silent> * :<c-u>call VisualSelection('', '')<cr>/<c-r>=@/<cr><cr>
vnoremap <silent> # :<c-u>call VisualSelection('', '')<cr>?<c-r>=@/<cr><cr>

"==========[ normal/visual ]==========

" move vertically by visual line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

nnoremap $ g$
vnoremap $ g$
nnoremap ^ g^
vnoremap ^ g^

" when jumping, recenter
nnoremap n nzz
nnoremap N Nzz

nnoremap <c-f> <c-f>zz
vnoremap <c-f> <c-f>zz

nnoremap <c-b> <c-b>zz
vnoremap <c-b> <c-b>zz

"==========[ normal/visual/insert ]==========
inoremap <up> <nop>
nnoremap <up> <nop>
vnoremap <up> <nop>

inoremap <down> <nop>
nnoremap <down> <nop>
vnoremap <down> <nop>

inoremap <left> <nop>
nnoremap <left> <nop>
vnoremap <left> <nop>

inoremap <right> <nop>
nnoremap <right> <nop>
vnoremap <right> <nop>

"==========[ command ]==========
" Bash-like hotkeys for navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Move back
cnoremap <c-b> <left>

" Move by word
cnoremap <m-b> <s-left>
cnoremap <m-f> <s-right>

" make commandline history smarter (use text entered so far)
cnoremap <c-n> <up>
cnoremap <c-p> <down>

"==============================================================================
" Abbrievations
"==============================================================================
"==========[ date/time ]==========
iabbrev _sdate <c-r>=strftime("%Y/%m/%d")<cr>
iabbrev _date <c-r>=strftime("%m/%d/%y")<cr>

"==============================================================================
" Functions
"==============================================================================

"==========[ ModifyLineEndDelimiter ]==========
" Description:
"	This function takes a delimiter character and:
"	- removes that character from the end of the line if the character at the end
"	of the line is that character
"	- removes the character at the end of the line if that character is a
"	delimiter that is not the input character and appends that character to
"	the end of the line
"	- adds that character to the end of the line if the line does not end with
"	a delimiter
"
" Delimiters:
" - ","
" - ";"
"==========================================
function! ModifyLineEndDelimiter(character)
	let line_modified = 0
	let line = getline('.')

	for character in [',', ';']
		" check if the line ends in a trailing character
		if line =~ character . '$'
			let line_modified = 1

			" delete the character that matches:

			" reverse the line so that the last instance of the character on the
			" line is the first instance
			let newline = join(reverse(split(line, '.\zs')), '')

			" delete the instance of the character
			let newline = substitute(newline, character, '', '')

			" reverse the string again
			let newline = join(reverse(split(newline, '.\zs')), '')

			" if the line ends in a trailing character and that is the
			" character we are operating on, delete it.
			if character != a:character
				let newline .= a:character
			endif

			break
		endif
	endfor

	" if the line was not modified, append the character
	if line_modified == 0
		let newline = line . a:character
	endif

	call setline('.', newline)
endfunction

function! TabOrComplete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<c-n>"
	else
		return "\<tab>"
	endif
endfunction

function! VisualSelection(direction, extra_filter) range
	let l:saved_reg=@"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	let l:command = ''
	if a:direction == 'gv'
		let l:command = "Ag \"" . l:pattern . "\" "
	elseif a:direction == 'replace'
		let l:command = "%s" . '/' . l:pattern . '/'
	endif

	exe "menu Foo.Bar :" . l:command
	emenu Foo.Bar
	unmenu Foo

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

function! StripTrailingWhitespace()
	normal mZ
	%s/\s\+$//e
	normal `Z
	normal mZ
endfunction

"==============================================================================
" Plugins and Misc
"==============================================================================

"==========[ athena ]==========
set tags=$ATHENA_HOME/tags 

"==========[ tester.vim ]==========
nnoremap <leader>t :call g:tester.OpenPairedFile()<cr>
nnoremap <leader>T :call g:tester.OpenPairedFile('vs')<cr>

"==========[ neomake ]==========
let g:neomake_javascript_jshint_maker = {
	\ 'args': ['--verbose'],
	\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
	\ }
let g:neomake_javascript_enabled_markers = ['jshint']
let g:neomake_open_list = 2

nnoremap <leader>n :Neomake<cr>

"==========[ Splitjoin ]==========
nnoremap <leader>k :SplitjoinJoin<cr>
nnoremap <leader>j :SplitjoinSplit<cr>

"==========[ testing ]==========

" quickly edit macros
nnoremap <leader>m :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

nnoremap <silent> <leader>p4a :!p4 add %:p<cr>
nnoremap <silent> <leader>p4e :!p4 edit %:p<cr>
nnoremap <silent> <leader>p4r :!p4 revert %:p<cr>

nnoremap <leader>f :FZF<cr>

let g:fzf_action = {
	\'ctrl-b': 'vsplit',
	\'ctrl-v': 'split'}

" testing with relative numbers
" relative is a boolean indicating either
" --> relativenumber (when true)
" --> norelativenumber (when false)
function! NumberToggle(relative)
	if (&number)
		if (a:relative == 1)
			set relativenumber
		else
			set norelativenumber
		endif
	endif
endfunction

" autocmd! BufEnter * :call NumberToggle(1)
" autocmd! BufLeave * :call NumberToggle(0)
" autocmd! FocusGained * :call NumberToggle(1)
" autocmd! FocusLost * :call NumberToggle(0)

" set shortmess=a
cnoreabbrev Ag Ack!
nnoremap <leader>a :Ack!<space>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" testing andrewradev's completion mappings
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>
inoremap <c-o> <c-x><c-o>
inoremap <c-u> <c-x><c-u>
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

" easier paste in insert mode (unsure how I feel about this overwriting
" backwards-completion, but maybe it's ok with the <c-k> mapping above
inoremap <c-p> <c-r>"

" move to beginning/end of line (commenting out because I should use the
" tokens that regexes use)
" nnoremap H ^
" vnoremap H ^
" nnoremap L $
" vnoremap L $

" don't store "{"/"}" motions in jump list
nnoremap <silent> } :<c-u>execute "keepjumps normal! " . v:count1 . "}"<cr>
nnoremap <silent> { :<c-u>execute "keepjumps normal! " . v:count1 . "{"<cr>
