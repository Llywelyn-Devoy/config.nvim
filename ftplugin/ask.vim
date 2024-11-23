" ftplugin/ask.vim
"
"setlocal commentstring=//\ %s
setlocal comments=s1fl:{-,mb:\ \ ,ex:-},:--
setlocal iskeyword+='

" @-@ adds the literal @ to iskeyword for @IBAction and similar
"setlocal iskeyword+=?,!,@-@,#
"setlocal iskeyword+=

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal completefunc=syntaxcomplete#Complete
