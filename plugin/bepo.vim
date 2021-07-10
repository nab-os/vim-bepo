" vim-bepo - Plugin vim pour disposition de clavier bépo
" Derived from Micha Moskovic's version
" Maintainer: Nabos

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

"s:inmap is for insert mode
function! s:inmap(key, target) abort
  if maparg(a:key, 'i') ==# ''
    execute "inoremap" a:key a:target
  endif
endfunction

"s:clmap is for command line mode
function! s:clmap(key, target) abort
  if maparg(a:key, 'c') ==# ''
    execute "cnoremap" a:key a:target
  endif
endfunction

" ====
" on preserve {hjkl} pour les directions
" {hjkl} devient {rtsc}
" {HJKL} devient {RTSC}
" on préserve les variantes avec 'z'
call s:amap(   'c',  'h'     )
call s:amap(   't',  'j'     )
call s:amap(   's',  'k'     )
call s:amap(   'r',  'l'     )

call s:amap(   'C',  'H'     )
call s:amap(   'T',  'J'     )
call s:amap(   'S',  'K'     )
call s:amap(   'R',  'L'     )

call s:amap(  'zt', 'zj'     )
call s:amap(  'zs', 'zk'     )

" ====
" {rtsc} devient {hjkl}
" {RTSC} devient {HJKL}
call s:amap(   'h',  'r'     )
call s:amap(   'j',  't'     )
call s:amap(   'k',  's'     )
call s:amap(   'l',  'c'     )

call s:amap(   'H',  'R'     )
call s:amap(   'J',  'T'     )
call s:amap(   'K',  'S'     )
call s:amap(   'L',  'C'     )

"====
" le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gb', 'gT'    )
call s:amap(   'gé', 'gt'    )

" ====
" [w] est libre pour faire <C-w>
" on map [w]+direction
call s:amap(   'w',  '<C-w>' )
call s:amap(   'w',  '<C-w>' )
call s:amap(   'W',  '<C-w><C-w>')
call s:amap(  'wc', '<C-w>h' )
call s:amap(  'wt', '<C-w>j' )
call s:amap(  'ws', '<C-w>k' )
call s:amap(  'wr', '<C-w>l' )
call s:amap(  'wC', '<C-w>H' )
call s:amap(  'wT', '<C-w>J' )
call s:amap(  'wS', '<C-w>K' )
call s:amap(  'wR', '<C-w>L' )
call s:amap(  'wh', '<C-w>s' )

" ====
" Le é de bepo est disponible pour [w]
call s:amap(  'é', 'w' )
call s:amap(  'É', 'W' )
call s:amap(  'aé', 'aw' )
call s:amap(  'aÉ', 'aW' )
call s:amap(  'ié', 'iw' )
call s:amap(  'iÉ', 'iW' )

" ====
" Le è est disponible pour les débuts de ligne
call s:amap(  'è', '^' )
call s:amap(  'È', '0' )

" ====
" saleté de guillemet-apostrophe
call s:amap(  '’', "\'" )
call s:inmap(  '’', "\'" )
call s:clmap(  '’', "\'" )
