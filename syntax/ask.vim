" syntax/ask.vim
" Match TODO comments

" Match language specific keywords
syn keyword askKeywords
        \ where
        \ define
        \ defined
        \ test
        \ tested
        \ by
        \ from
        \ inductively
        \ given
        \ prove
        \ proven
        \ data
        \ grammer
        \ prop
        \ Equivalence
        \ Contradiction
        \ ImpI
        \ NotI
        \ AndI
        \ OrIL
        \ OrIR
"        \ Route

" Match ask 
syn match askLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
  \ contains=
  \ askTodo,
  \ @Spell

syn region askBlockComment start="{-" end="-}"
  \ contains=
  \ askBlockComment,
  \ askTodo,
  \ @Spell

syn keyword askTodo TODO FIXME contained

syn region askParens matchgroup=askDelimiter start="(" end=")" contains=TOP,askTypeSig,@Spell
syn region askString start=+"+ skip=+\\\\\|\\"+ end=+"+
  \ contains=@Spell

" syn match askTypeSig
"   \ "^\s*\(where\s\+\|let\s\+\|default\s\+\)\?[_a-z][a-zA-Z0-9_']*#\?\(,\s*[_a-z][a-zA-Z0-9_']*#\?\)*\_s\+::\_s"
"   \ contains=
"   \ askWhere,
"   \ askLet,
"   \ askDefault,
"   \ askIdentifier,
"   \ askOperators,
"   \ askSeparator,
"   \ askParens

syn match askIdentifier "[_a-z][a-zA-Z0-9_']*" contained
syn match askType "\<[A-Z][a-zA-Z0-9_']*\>"

syn keyword askInfix infix infixl infixr


"highlight def link askKeywords Keyword
highlight def link askKeywords Keyword
highlight def link askIdentifier Indentifier
highlight def link askType Type
highlight def link askString String

syn keyword askKeywordsProven proven
highlight askBackgroundProven ctermbg=green ctermfg=black guibg=green guifg=black
" highlight askBackgroundProven ctermbg=magenta guibg=lightgreen
syntax match askPatternProven /\<proven\>/ | highlight link askPatternProven askBackgroundProven
highlight link askKeywordsProven askBackgroundProven

syn keyword askKeywordsProve prove
highlight askBackgroundProve ctermbg=red ctermfg=black guibg=red guifg=black
" highlight askBackgroundProve ctermbg=magenta guibg=red
syntax match askPatternProve /\<Prove\>/ | highlight link askPatternProve askBackgroundProve
highlight link askKeywordsProve askBackgroundProve

syn keyword askKeywordsGiven given
" highlight askBackgroundGiven ctermbg=magenta guibg=lightpink
highlight askBackgroundGiven ctermbg=magenta  ctermfg=black guibg=magenta guifg=black
syntax match askPatternGiven /\<given\>/ | highlight link askPatternGiven askBackgroundGiven
highlight link askKeywordsGiven askBackgroundGiven
