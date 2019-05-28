" We copy unimpaired code because the functions are local:
" This code is from Tim Pope original plugin:
let s:maps = []
function! s:map(...) abort
  call add(s:maps, copy(a:000))
endfunction

function! s:maps() abort
  for [mode, head, rhs; rest] in s:maps
    let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
    let tail = ''
    let keys = get(g:, mode.'remap', {})
    if type(keys) != type({})
      continue
    endif
    while !empty(head)
      if has_key(keys, head)
        let head = keys[head]
        if empty(head)
          let head = '<skip>'
        endif
        break
      endif
      let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
      let head = substitute(head, '<[^<>]*>$\|.$', '', '')
    endwhile
    if head !=# '<skip>' && (flags !~? '<unique>' || empty(maparg(head.tail, mode)))
      exe mode.'map' flags head.tail rhs
    endif
  endfor
endfunction

if exists("g:loaded_ale")
  call s:map('n', '[oa', ':ALEEnable<CR>', '<silent>')
  call s:map('n', ']oa', ':ALEDisable<CR>', '<silent>')
  call s:map('n', 'yoa', ':ALEToggle<CR>', '<silent>')
  call s:map('n', '[h', ':ALEPrevious<CR>', '<silent>')
  call s:map('n', ']h', ':ALENext<CR>', '<silent>')
endif

" Deoplete
if exists("g:loaded_deoplete")
  call s:map('n', '[o<tab>', ':call deoplete#enable()<CR>', '<silent>')
  call s:map('n', ']o<tab>', ':call deoplete#disable()<CR>', '<silent>')
  call s:map('n', 'yo<tab>', ':call deoplete#toggle()<CR>', '<silent>')
endif

" vim-markdown
if exists("g:mkdp_auto_start")
  call s:map('n', '[om', '<Plug>MarkdownPreview', '<silent>')
  call s:map('n', ']om', '<Plug>MarkdownPreviewStop', '<silent>')
  call s:map('n', 'yom', '<Plug>MarkdownPreviewToggle', '<silent>')
endif

" Git-gutter
if exists("g:loaded_gitgutter")
  call s:map('n', '[og', ':GitGutterLineHighlightsEnable<CR>', '<silent>')
  call s:map('n', ']og', ':GitGutterLineHighlightsDisable<CR>', '<silent>')
  call s:map('n', 'yog', ':GitGutterLineHighlightsToggle<CR>', '<silent>')
endif

" table-mode
if exists("g:loaded_table_mode")
  call s:map('n', '[ot', ':TableModeEnable<CR>', '<silent>')
  call s:map('n', ']ot', ':TableModeDisable<CR>', '<silent>')
  call s:map('n', 'yot', ':TableModeToggle<CR>', '<silent>')
endif

" Goyo
if exists("g:loaded_goyo")
  call s:map('n', 'yoy', ':Goyo<CR>', '<silent>')
endif

" Grammarous
if exists("g:loaded_grammarous")
  call s:map('n', '[g', '<Plug>(grammarous-move-to-previous-error)', '<silent>')
  call s:map('n', ']g', '<Plug>(grammarous-move-to-next-error)', '<silent>')
endif

" Toggle hidden files on/off for file/rec search with ag
if exists("g:loaded_denite")
  if ! exists('g:unimpaired_extra_denite_cmd')
    let g:unimpaired_extra_denite_cmd = "['ag', '--follow', '--nocolor', '--nogroup', '-g', '']"
  endif
  if ! exists('g:unimpaired_extra_denite_cmd_hidden')
    let g:unimpaired_extra_denite_cmd_hidden = "['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']"
  endif
  call s:map('n', '[o.', ":call denite#custom#var('file/rec', 'command', g:unimpaired_extra_denite_cmd_hidden)<CR>", '<silent>')
  call s:map('n', ']o.', ":call denite#custom#var('file/rec', 'command', g:unimpaired_extra_denite_cmd)<CR>", '<silent>')
endif

call s:maps()
