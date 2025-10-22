" Vim syntax file
" Language:     Jule
" Maintainer:   adam <me@adamperkowski.dev>
" URL: https://github.com/julelang/jule.nvim
" License: BSD 3-Clause

if exists("b:current_syntax")
  finish
endif

" directives (e.g. `#pass`)
" regex: a `#` followed by a sequence of word characters
syntax region juleDirective start="#\p\+\>" end="$" contains=juleComment,juleLineComment

" core keywords
syntax keyword juleKeyword chan error use fn struct enum unsafe let match defer if else for in impl trait break continue goto cpp type ret fall co select

" type keywords
syntax keyword juleType int uint uintptr i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 cmplx64 cmplx128 bool str any byte rune map

" storage keywords
syntax keyword juleStorage const mut self
syntax keyword juleConstant true false nil iota

" function names
" regex: a word followed by either `(` or `[`, but not including `(` or `[`
syntax match juleFunction "\<\k\+\ze("
syntax match juleFunction "\<\k\+\ze\[.*\]("

" numbers
" regex: a sequence of digits, possibly separated by `_` (e.g. `123`, `123_456`)
syntax match juleNumber "\v<\d+(_\d+)*>"
" regex: digits and optional `_`s, optional leading `.`, optional exponent with `e`/`E`/`p`/`P` and `+`/`-`
syntax match juleFloat "\v<(\d+(_\d+)*|\.\d+(_\d+)*|\d+(_\d+)*\.\d*(_\d+)*)(([eEpP][+-]?\d+(_\d+)*))?>"
" regex: a sequence of digits starting with `0b`, possibly separated by `_`
syntax match juleBinary "\v<0b[01]+(_[01]+)*>"
" regex: a sequence of digits starting with `0o`, possibly separated by `_`
syntax match juleOctal "\v<0o[0-7]+(_[0-7]+)*>"
" regex: a sequence of digits and letters `a-f` or `A-F` starting with `0x`,
" possibly separated by `_` (e.g. `0x123`, `0x123_456`)
syntax match juleHex "\v<0x[0-9a-fA-F]+(_[0-9a-fA-F]+)*>"

" strings
" regex: a sequence of characters enclosed in single quotes, possibly escaped
syntax region juleStringS start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=juleEscape
" regex: a sequence of characters enclosed in double quotes, possibly escaped
syntax region juleStringD start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=juleEscape
" regex: a sequence of characters enclosed in backticks
syntax region juleStringRaw start=+`+ end=+`+
" regex: a sequence of characters enclosed in triple double quotes
syntax match juleEscape display contained "\\[abfnrtv'\"\\]"

" comments
" regex: a sequence of characters starting with `//` and ending with a newline
syntax region juleLineComment start="//" end="$" contains=juleTodo,@Spell
" regex: a sequence of characters starting with `/*` and ending with `*/`
syntax region juleComment start="/\*" end="\*/" contains=juleTodo,@Spell

" operators
syntax match juleOperator "\(+\|-\|*\|/\|%\|++\|--\|>>\|<<\)" contains=juleLineComment,juleComment
syntax match juleOperator "\(==\|!=\|>\|<\|>=\|<=\)"
syntax match juleOperator "\(=\|+=\|-=\|*=\|/=\|%=\|&=\||=\|\^=\|>>=\|<<=\)"
syntax match juleOperator "\(&\||\|\^\)"
syntax match juleOperator "\(&&\|||\|!\)"

" delimiters
syntax match juleDelimiter "[.,;:]"

" TODO
syntax keyword juleTodo TODO FIXME XXX NOTE BUG FIX

highlight default link juleDirective PreProc
highlight default link juleKeyword Keyword
highlight default link juleType Type
highlight default link juleStorage StorageClass
highlight default link juleConstant Constant
highlight default link juleFunction Function
highlight default link juleNumber Number
highlight default link juleFloat Float
highlight default link juleBinary Number
highlight default link juleOctal Number
highlight default link juleHex Number
highlight default link juleStringS String
highlight default link juleStringD String
highlight default link juleStringRaw String
highlight default link juleEscape SpecialChar
highlight default link juleLineComment Comment
highlight default link juleComment Comment
highlight default link juleOperator Operator
highlight default link juleDelimiter Delimiter
highlight default link juleTodo Todo

let b:current_syntax = "jule"

" vim: set et sw=4 sts=4 ts=8:
