" Vim syntax file
" Language: Manuscript
" Maintainer: Patrick Brosi
" Latest Revision: 5 May 2016
"
if exists("b:current_syntax")
  finish
endif

syn match manuscriptNewPara '\.P'
syn keyword manuscriptChapter Epilog Prolog
syn match manuscriptChapter '^[0-9]*$'
syn match manuscriptChapter '^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$' " latin chapter numbers



let b:current_syntax = "manuscript"

hi def link manuscriptNewPara    ManuPara
hi def link manuscriptChapter    ManuChapter
