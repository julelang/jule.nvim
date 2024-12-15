" Vim syntax file
" Language:     Jule
" Maintainer:   Adam Perkowski <adas1per@protonmail.com>
" URL: https://github.com/adamperkowski/jule.nvim
" License: BSD 3-Clause

if exists("b:current_syntax")
  finish
endif

syntax keyword juleKeyword map error use fn pub struct byte rune enum unsafe
syntax keyword juleKeyword const let static mut self match defer if else for in
syntax keyword juleKeyword impl trait break continue goto cpp
syntax keyword juleKeyword i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 str

syntax keyword juleStorage let static const mut pub self

syntax keyword juleConstant true false nil

syntax match juleNumber "\<\d\+\(_\?\d\+\)*\>"
syntax match juleFloat "\<\d\+\(_\?\d\+\)*\.\d\+\([eE][-+]\?\d\+\)\?"
syntax match juleBinary "\<0b[01]\+\(_\?[01]\+\)*\>"
syntax match juleOctal "\<0o[0-7]\+\(_\?[0-7]\+\)*\>"
syntax match juleHex "\<0x[0-9a-fA-F]\+\(_\?[0-9a-fA-F]\+\)*\>"

syntax region juleString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=juleEscape
syntax region juleRawString start=+`+ end=+`+
syntax region juleChar start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=juleEscape
syntax match juleEscape display contained "\\[abfnrtv'\"\\]"

syntax region juleComment start="/\*" end="\*/" contains=@Spell
syntax region juleDocComment start="/\*" end="\*/" contains=@Spell
syntax match juleLineComment "//.*$" contains=@Spell

syntax match juleDirective "#\p\+\>"

syntax match juleFunction "\<\k\+\ze("

syntax match juleOperator "\(+\|-\|*\|/\|%\|++\|--\|>>\|<<\)"
syntax match juleOperator "\(==\|!=\|>\|<\|>=\|<=\)"
syntax match juleOperator "\(=\|+=\|-=\|*=\|/=\|%=\|&=\||=\|\^=\|>>=\|<<=\)"
syntax match juleOperator "\(&\||\|\^\)"
syntax match juleOperator "\(&&\|||\|!\)"

syntax match juleDelimiter "[.,;:]"

highlight default link juleKeyword Keyword
highlight default link juleStorage StorageClass
highlight default link juleConstant Constant
highlight default link juleNumber Number
highlight default link juleFloat Float
highlight default link juleBinary Number
highlight default link juleOctal Number
highlight default link juleHex Number
highlight default link juleString String
highlight default link juleRawString String
highlight default link juleChar Character
highlight default link juleEscape SpecialChar
highlight default link juleComment Comment
highlight default link juleDocComment Comment
highlight default link juleLineComment Comment
highlight default link juleDirective PreProc
highlight default link juleFunction Function
highlight default link juleOperator Operator
highlight default link juleDelimiter Delimiter

let b:current_syntax = "jule"

" vim: set et sw=4 sts=4 ts=8:
