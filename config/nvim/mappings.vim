let mapleader = "\<space>"
let maplocalleader = "\<space>"

"================================[ normal mode ]================================
" alias of "verticalsplit" (for consistency with tmux)
nnoremap <c-w>1 <c-w>H

" alias of "split" (for consistency with tmux)
nnoremap <c-w>2 <c-w>K

" swap */# (match _W_ord) and g*/g# (match _w_ord)
nnoremap * g*
nnoremap g* *
nnoremap # g#
nnoremap g# #

" play last macro
nnoremap Q @@

" yank to end of line (match C/D)
nnoremap Y y$

" change case of character under cursor
nnoremap ~~ ~l

" stop highlighting searched terms
nnoremap <silent> <leader><space> :nohlsearch<cr>

" edit vimrc
nnoremap <leader>vv :sp $MYVIMRC<cr>

" source vimrc
nnoremap <leader>vs :source $MYVIMRC<cr>:nohlsearch<cr>

" don't store "{"/"}" motions in jump list
nnoremap <silent> } :<c-u>execute "keepjumps normal! " . v:count1 . "}"<cr>
nnoremap <silent> { :<c-u>execute "keepjumps normal! " . v:count1 . "{"<cr>

" mark before searching
nnoremap / ms/
nnoremap ? ms?

" move to end/start of line more easily
nnoremap <space>l $
nnoremap <space>h ^

" Conditionally modify character at end of line
nnoremap <silent> <leader>, :call lib#ModifyLineEndDelimiter(',')<cr>
nnoremap <silent> <leader>; :call lib#ModifyLineEndDelimiter(';')<cr>

" search files more easily
nnoremap \ :Ag<SPACE>

" grep for current word
nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" 'do' mappings
nnoremap <leader>df :FZF<cr>
nnoremap <leader>dg :Goyo<cr>
nnoremap <leader>dw :call lib#UnstructuredText()<cr>
nnoremap <silent> <leader>du :UltiSnipsEdit<cr>
nnoremap <leader>dt :UndotreeToggle<cr>

"================================[ insert mode ]================================
" save the pinky
inoremap jk <esc>
inoremap jf <esc>
inoremap <c-c> <nop>

" forward delete (consistent with osx)
inoremap <c-d> <del>

" untab/retab (default mapping used above)
inoremap <c-l> <c-t>
inoremap <c-h> <c-d>

" close various structures automatically
" newline triggered
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap <<cr> <<cr>><esc>O
inoremap """<cr> """<cr>"""<esc>O

" semicolon triggered
inoremap (; ();<esc>hi
inoremap [; [];<esc>hi
inoremap {; {};<esc>hi

" comma triggered
inoremap (, (),<esc>hi
inoremap {, {},<esc>hi
inoremap [, [],<esc>hi
inoremap ', '',<esc>hi
inoremap ", "",<esc>hi
inoremap `, ``,<esc>hi

" tab triggered
inoremap (<tab> ()<esc>i
inoremap [<tab> []<esc>i
inoremap {<tab> {}<esc>i
inoremap <<tab> <><esc>i
inoremap '<tab> ''<esc>i
inoremap "<tab> ""<esc>i
inoremap `<tab> ``<esc>i
inoremap _<tab> __<esc>i
inoremap __<tab> ____<esc>hi
inoremap *<tab> **<esc>i
inoremap **<tab> ****<esc>hi

"================================[ visual mode ]================================
" unindent/indent
vnoremap > >gv
vnoremap < <gv

" paste without overwriting buffer
vnoremap r "_dP"

"==========================[ normal and visual modes ]==========================
" bind easy align keys
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" move vertically by visual line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" recenter the screen after jumping forward
nnoremap <c-f> <c-f>zz
vnoremap <c-f> <c-f>zz

" recenter the screen after jumping backward
nnoremap <c-b> <c-b>zz
vnoremap <c-b> <c-b>zz

" make n always go forward; recenter after jumping
nnoremap <expr> n 'Nn'[v:searchforward].'zz'
vnoremap <expr> n 'Nn'[v:searchforward].'zz'

" make N always go back; recenter after jumping
nnoremap <expr> N 'nN'[v:searchforward].'zz'
vnoremap <expr> N 'nN'[v:searchforward].'zz'

" use enter as colon for faster commands
nnoremap <cr> :
vnoremap <cr> :

" meta enter for real <cr>
nnoremap <M-cr> <cr>
vnoremap <M-cr> <cr>

"================================[ command mode ]===============================
" make start of line and end of line movements match zsh/bash
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Move by word
cnoremap <m-b> <s-left>
cnoremap <m-f> <s-right>

" make commandline history smarter (use text entered so far)
cnoremap <c-n> <down>
cnoremap <c-p> <up>
