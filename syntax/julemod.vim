" Vim syntax file
" Language:     Jule Module
" Maintainer:   adam <me@adamperkowski.dev>
" URL: https://github.com/julelang/jule.nvim
" License: BSD 3-Clause

if exists("b:current_syntax")
  finish
endif

syntax keyword julemodKeyword module

let b:current_syntax = "julemod"

highlight default link julemodKeyword Keyword

" vim: set et sw=4 sts=4 ts=8:
