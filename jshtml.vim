
let s:block_tags = [
    \ "if",
    \ "foreach",
    \ "block",
    \ "section",
    \ "use",
    \ "default",
    \ "else"
    \]


augroup jshtml
    autocmd!
    autocmd FileType jshtml call s:setup_js_html()
augroup END


function! s:setup_js_html()
    call matchup#util#append_match_words('' .
        \ '<:>,' .
        \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
        \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
        \ '{% *if .*%}:{% *else *%}:{% *endif *%},' .
        \ '{% *foreach .*%}:{% *endforeach *%},' .
        \ '{% *block .*%}:{% *endblock *%},' .
        \ '{% *section .*%}:{% *endsection *%},' .
        \ '{% *use .*%}:{% *enduse *%},' .
        \ '{% *default .*%}:{% *enddefault *%}')

    setlocal indentexpr=jshtml#get_indent()
    setlocal indentkeys=o,O,<Return>,<>>,{,},!^F

    " Needed for % to work when finding start/end of a tag.
    setlocal matchpairs+=<:>
    setlocal syntax=html

    call textobj#user#plugin('jshtml', {
        \   'block': {
        \     '*sfile*': expand('<sfile>:p'),
        \     'select-a-function': 'jshtml#select_js_block_a',
        \     'select-a': 'aB',
        \     'select-i-function': 'jshtml#select_js_block_i',
        \     'select-i': 'iB',
        \   },
        \ })

endfunction


function! jshtml#select_js_block_a()
    return s:select_js_block("a")
endfunction


function! jshtml#select_js_block_i()
    return s:select_js_block("i")
endfunction


function! s:select_js_block(mode)

    let init_pos = getpos('.')

    call searchpos('{%', 'cbW', init_pos[1])

    let start_pos = getpos('.')
    let search_result = searchpos('{% end', 'cW')

    while search_result != [0, 0]

        let close_tag_pos = getpos('.')

        let tag_line = getline(close_tag_pos[1])[close_tag_pos[2] - 1:]
        let tag_parts = matchlist(tag_line, '^{% end\(.\{-}\)\s\+%}')
        if !empty(tag_parts)
            let tag_name = tag_parts[1]

            let search_result = s:search_js_tag_pair(tag_name, 'bW')

            if search_result == [0, 0]
                call setpos('.', init_pos)
                return 0
            endif

            let open_tag_pos = getpos('.')

            if open_tag_pos[1] < start_pos[1] ||
                \ (
                \    open_tag_pos[1] == start_pos[1] &&
                \    open_tag_pos[2] <= start_pos[2]
                \ )
                if a:mode == 'i'
                    call search('%}', 'eW')
                    let open_tag_pos = getpos('.')
                    let open_line_content = searchpos('\S', 'W', open_tag_pos[1])
                    call setpos('.', close_tag_pos)
                    let close_line_content = searchpos('\S', 'bW', close_tag_pos[1])
                    if close_tag_pos[1] - open_tag_pos[1] <= 1 ||
                        \ open_line_content != [0, 0] ||
                        \ close_line_content != [0, 0]
                        call setpos('.', open_tag_pos)
                        call search('.')
                        let open_tag_pos = getpos('.')
                        call setpos('.', close_tag_pos)
                        call search('.', 'b')
                        let close_tag_pos = getpos('.')
                        return ['v', open_tag_pos, close_tag_pos]
                    endif
                    return ['V', [0, open_tag_pos[1] + 1, 1, 0], [0, close_tag_pos[1] - 1, 1, 0]]
                endif
                if a:mode == 'a'
                    call setpos('.', close_tag_pos)
                    call search('%}', 'eW')
                    let close_tag_pos = getpos('.')
                    return ['v', open_tag_pos, close_tag_pos]
                endif
                return 0
            endif

            call setpos('.', close_tag_pos)

        endif

        let search_result = searchpos('{% end', 'W')

    endwhile

    call setpos('.', init_pos)
    return 0

endfunction


function! jshtml#get_indent()

    let curline = getline(v:lnum)
    let tag_parts = matchlist(curline, '^\s*{% end\(.\{-}\)\s*%}')

    if !empty(tag_parts)
        let tag_name = tag_parts[1]
        call cursor(v:lnum, 1)
        let search_result = s:search_js_tag_pair(tag_name, 'bW')
        if search_result != [0, 0]
            return indent(search_result[0])
        endif
    endif

    if v:lnum == 1
        return HtmlIndent()
    endif

    let prevlnum = prevnonblank(v:lnum - 1)
    let prevline = getline(prevlnum)
    let tag_match = matchlist(prevline, '.*{%\s*\(.\{-}\)\s.\{-}%}')
    if empty(tag_match)
        return HtmlIndent()
    endif
    let tag_name = tag_match[1]
    if index(s:block_tags, tag_name) == -1
        return HtmlIndent()
    endif
    return HtmlIndent() + &sw
endfunction


function! s:search_js_tag_pair(tag_name, flags)
    return searchpairpos(
        \ '{%\s*'.a:tag_name.'\s*.\{-}%}',
        \ '',
        \ '{%\s*end'.a:tag_name.'\s*%}',
        \ a:flags)
endfunction
