" Vim syntax file
" Language:     NPL
" Maintainer:   Derek Wyatt <dwyatt@auvik.com>
" Last Change:  2014 Aug 18

" Quit if syntax file is already loaded
if version < 600
  syntax clear
"elseif exists("b:current_syntax")
"  finish
endif

syn case match
syn sync minlines=50 maxlines=1000

syn keyword nplKeyword def schema key default where view assert if else for index summarize
hi link nplKeyword Keyword

syn keyword nplSpecial package import none unique every seconds deltaSum sum max day minute history
syn keyword nplSpecial on nextgroup=nplTrigger,nplTimeTrigger
hi link nplSpecial Preproc

syn match nplTrigger /\<\%(start\|update\|insert\|delete\)\>/
hi link nplTrigger Type

syn match nplTimeTrigger /\d\+\s\+\%(seconds\)/
hi link nplTimeTrigger Type

syn match nplComment "//.*$"
hi link nplComment Comment

syn match nplString /"[^"]*"/
hi link nplString String

syn match nplType /:\s*\zs\w\+/
hi link nplType Type

syn region nplTypeRegion start=/\[/ end=/\]/ contains=nplOptionalType transparent 
syn match nplOptionalType /\w\+/ contained
hi link nplOptionalType Type

syn match nplNumber /\<\d\+\>/
hi link nplNumber Number

syn match nplDeclaration /\w\+\ze\s*{\s*/
hi link nplDeclaration Special

syn match nplTypeReference /^\s*[A-Z]\w\+\s*$/
hi link nplTypeReference String

syn match nplOperator /\%(==\|!=\|>==\|<==\|==>\|==<\|&&\)/
hi link nplOperator Special

syn match nplFunctionCall /\w\+\ze()/
hi link nplFunctionCall Function

let b:current_syntax = "npl"

"EOF vim: tw=80:ft=vim:ts=2:sw=2
