" vim-bepo - Plugin vim pour disposition de clavier bépo
" Maintainer:   Micha Moskovic

if exists('g:loaded_bepo') || &compatible
  finish
else
  let g:loaded_bepo = 1
endif

"s:tomap is for text-objects
function! s:tomap(key, target) abort
  if maparg(a:key, 'o') ==# ''
    execute "onoremap" a:key a:target
  endif
  if maparg(a:key, 'x') ==# ''
    execute "xnoremap" a:key a:target
  endif
endfunction

"s:amap is for the rest
function! s:amap(key, target) abort
  if maparg(a:key, 'n') ==# ''
    execute "nnoremap" a:key a:target
  endif
  call s:tomap(a:key, a:target)
endfunction

call s:amap(   'c',  'h'     )    "on préserve {hjkl} pour les directions
call s:amap(   't',  'j'     )    "on préserve {hjkl} pour les directions
call s:amap(   's',  'k'     )    "on préserve {hjkl} pour les directions
call s:amap(   'r',  'l'     )    "on préserve {hjkl} pour les directions
call s:amap(   'C',  'H'     )    "{HJKL} devient [CTSR]
call s:amap(   'T',  'J'     )    "{HJKL} devient [CTSR]
call s:amap(   'S',  'K'     )    "{HJKL} devient [CTSR]
call s:amap(   'R',  'L'     )    "{HJKL} devient [CTSR]
