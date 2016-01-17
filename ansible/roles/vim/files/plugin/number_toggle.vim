function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
    set number
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>
