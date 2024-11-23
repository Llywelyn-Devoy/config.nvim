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
highlight def link askKeywords String
highlight def link askIdentifier Indentifier
highlight def link askType Type
highlight def link askString String
