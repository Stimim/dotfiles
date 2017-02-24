" In this file, we setup our key mappings and settings for Unite plugin

if !exists('g:loaded_unite')
  finish
endif

" enable fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" search files
nnoremap <leader>f :<C-u>Unite -start-insert file_rec<CR>
" search buffers
nnoremap <leader>b :<C-u>Unite -start-insert buffer<CR>
