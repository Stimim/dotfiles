" In this file, we setup our key mappings and settings for Unite plugin

if !exists('g:loaded_unite')
  finish
endif

" enable fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" sort by rank
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#profile('files', 'filters', ['sorter_rank'])
call unite#custom#source('buffer,file,file_rec', 'sorters', 'sorter_length')

" search files
" nnoremap <leader>f :<C-u>Unite -start-insert file_rec<CR>
" search buffers
" nnoremap <leader>b :<C-u>Unite -start-insert buffer<CR>
