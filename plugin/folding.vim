setlocal foldmethod=expr
setlocal foldexpr=GetRustFold(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetRustFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)

    if getline(a:lnum) =~? '^\s*///.*$'
        return this_indent
    endif

    if getline(a:lnum) =~? '^\s*//!.*$'
        return '1'
    endif

    return '0'
endfunction
