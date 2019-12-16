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

call s:amap(   'l',  'c'     )    "{c} devient [l]
call s:amap(   'L',  'C'     )    "{C} devient [L]
call s:amap(   'j',  'r'     )    "{j} devient [r]
call s:amap(   'J',  'R'     )    "{J} devient [R]

call s:amap(   'k',  's'     )    "{k} devient [s]
call s:amap(   'K',  'S'     )    "{h} devient [S]
call s:amap(   'gb', 'gT'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gé', 'gt'    )    "le couple [gb]/[gé] agit sur les tabs

call s:amap(   'w',  '<C-w>' )    "[w] est libre pour faire <C-w>
call s:amap(   'W',  '<C-w><C-w>') "et [w] pour faire <C-w><C-w>
call s:amap(  'wc', '<C-w>h' )    "on map [w]+direction
call s:amap(  'wt', '<C-w>j' )    "on map [w]+direction
call s:amap(  'ws', '<C-w>k' )    "on map [w]+direction
call s:amap(  'wr', '<C-w>l' )    "on map [w]+direction
call s:amap(  'wC', '<C-w>H' )    "idem pour les majuscules
call s:amap(  'wT', '<C-w>J' )    "idem pour les majuscules
call s:amap(  'wS', '<C-w>K' )    "idem pour les majuscules
call s:amap(  'wR', '<C-w>L' )    "idem pour les majuscules
call s:amap(  'wh', '<C-w>s' )    "crée un split _h_orizontal
