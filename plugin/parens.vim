let matches = [['(', ')'], ['[', ']'], ['{', '}'], ['"', '"'], ['''', '''']]

function s:get_next()
  return getline('.')[col('.') - 1]
endfunction

function s:next_is_whitespace()
  let next = s:get_next()
  if next == ''
    return 1
  elseif next == ' '
    return 1
  else
    return 0
  endif
endfunction

function! Parens_close_map(close)
  echom s:get_next()
  if s:get_next() == a:close
    return 'a'
  else
    return a:close
  endif
endfunction

function! Parens_open_map(open, close)
  if a:open == a:close && s:get_next() == a:close
    return 'a'
  elseif s:next_is_whitespace()
    echom a:open .. a:close .. 'i'
    return a:open .. a:close .. 'i'
  else
    return a:open
  endif
endfunction

for match in matches
  let open = match[0]
  let close = match[1]
  let esc_open = substitute(open, "'", "''", "")
  let esc_close = substitute(close, "'", "''", "")
  execute 'inoremap <expr> ' .. close .. ' Parens_close_map(''' .. esc_close .. ''')'
  execute 'inoremap <expr> ' .. open .. ' Parens_open_map(''' .. esc_open .. ''', ''' .. esc_close .. ''')'
endfor
