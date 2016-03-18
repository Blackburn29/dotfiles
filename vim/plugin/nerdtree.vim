let g:NERDTreeShowHidden = 1

function s:NERDTreeConfig()
    NERDTree
    if EEBufferCount() !=# 0
        wincmd p
    endif
    nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
endfunction

augroup dotfiles_plugin_nerdtree
    autocmd!
    "Close Vim if NERDTree is the only window remaining.
    autocmd BufEnter * if (winnr("$") ==# 1 && exists("b:NERDTreeType") && b:NERDTreeType ==? "primary") | q | endif
augroup END
