call lib#AddPluginMapping('g', ':Goyo<cr>')


function! s:goyo_enter()
    setlocal noshowmode
    setlocal noshowcmd
    setlocal scrolloff=999
    setlocal sidescroll=0
    setlocal spell

    nnoremap <leader>q :q<cr>:q<cr>
endfunction

function! s:goyo_leave()
    setlocal showmode
    setlocal showcmd
    setlocal scrolloff=10
    setlocal nospell

    nunmap <leader>q
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
