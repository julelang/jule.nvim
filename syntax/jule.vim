" Vim syntax file
" Language:     Jule
" Maintainer:   Adam Perkowski <adas1per@protonmail.com>
" URL: https://github.com/julelang/jule.nvim
" License: BSD 3-Clause

if exists("b:current_syntax")
  finish
endif

syntax region juleDirective start="#\p\+\>" end="$" contains=juleComment,juleLineComment

syntax keyword juleKeyword chan map error use fn pub struct byte rune enum unsafe
syntax keyword juleKeyword const let static match defer if else for in impl trait
syntax keyword juleKeyword break continue goto cpp i8 i16 i32 i64 u8 u16 u32 u64
syntax keyword juleKeyword f32 f64 str int uint type any bool ret fall unitptr co
syntax keyword juleKeyword let

syntax keyword juleStorage static const mut pub self
syntax keyword juleConstant true false nil

syntax match juleFunction "\<\k\+\ze("

syntax match juleNumber "\<\d\+\(_\?\d\+\)*\>"
syntax match juleFloat "\<\d\+\(_\?\d\+\)*\.\d\+\([eE][-+]\?\d\+\)\?"
syntax match juleBinary "\<0b[01]\+\(_\?[01]\+\)*\>"
syntax match juleOctal "\<0o[0-7]\+\(_\?[0-7]\+\)*\>"
syntax match juleHex "\<0x[0-9a-fA-F]\+\(_\?[0-9a-fA-F]\+\)*\>"

syntax region juleStringS start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=juleEscape
syntax region juleStringD start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=juleEscape
syntax region juleStringRaw start=+`+ end=+`+
syntax match juleEscape display contained "\\[abfnrtv'\"\\]"

syntax region juleLineComment start="//" end="$" contains=@Spell
syntax region juleComment start="/\*" end="\*/" contains=@Spell

syntax match juleOperator "\(+\|-\|*\|/\|%\|++\|--\|>>\|<<\)" contains=juleLineComment,juleComment
syntax match juleOperator "\(==\|!=\|>\|<\|>=\|<=\)"
syntax match juleOperator "\(=\|+=\|-=\|*=\|/=\|%=\|&=\||=\|\^=\|>>=\|<<=\)"
syntax match juleOperator "\(&\||\|\^\)"
syntax match juleOperator "\(&&\|||\|!\)"

syntax match juleDelimiter "[.,;:]"

highlight default link juleDirective PreProc
highlight default link juleKeyword Keyword
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

let b:current_syntax = "jule"

" vim: set et sw=4 sts=4 ts=8:
