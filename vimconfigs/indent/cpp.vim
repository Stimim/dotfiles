" Vim indent file
" Language: C++
" Maintainer: Stimim Chen <death1048576@gmail.com>
" Last Change: Fri 03 Jan 2014 11:33:53 AM CST
" License: MIT
" Version: 1.1.1
"
" Changes {{{
" 1.1.1 2014-01-03
"   * Clone the file from Konstantin Lepa <konstantin.lepa@gmail.com> on
"     vim-scripts
"   * setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4,j1,J1
"     which handles lambda function (for c++11) well
"   * disable did_indent checking, it seems to conflict with other plugings.
"
" 1.1.0 2011-01-17
"   Refactored source code.
"   Some fixes.
"
" 1.0.1 2010-05-20
"   Added some changes. Thanks to Eric Rannaud <eric.rannaud@gmail.com>
"
"}}}

"if exists("b:did_indent")
    "finish
"endif

"let b:did_indent = 1

function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal wrap

setlocal cindent
" this fixes c++11 lambda, but does not fix constructor with initializer:
" MyClass::MyClass()
"   : BaseClass(1) {
"   ^ this should indent 4 spaces
"   }
"   ^ this should be at head of the line
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4,j1,J0

setlocal indentexpr=GoogleCppIndent()

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"
