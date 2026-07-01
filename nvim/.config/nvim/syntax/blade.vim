if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax
syntax include @bladePhp syntax/php.vim
unlet! b:current_syntax

syntax region bladeComment matchgroup=bladeCommentDelimiter start="{{--" end="--}}" containedin=ALL keepend
syntax region bladeRawEcho matchgroup=bladeDelimiter start="{!!" end="!!}" contains=@bladePhp containedin=ALL keepend
syntax region bladeEcho matchgroup=bladeDelimiter start="{{" end="}}" contains=@bladePhp containedin=ALL keepend
syntax region bladeRawEchoInHtml matchgroup=bladeDelimiter start="{!!" end="!!}" contains=@bladePhp contained containedin=htmlString,htmlTag keepend
syntax region bladeEchoInHtml matchgroup=bladeDelimiter start="{{" end="}}" contains=@bladePhp contained containedin=htmlString,htmlTag keepend
syntax match bladeDirective "@[A-Za-z_][A-Za-z0-9_]*\>" containedin=ALLBUT,bladeComment,bladeRawEcho,bladeEcho
syntax match bladeComponent "</\?x-[A-Za-z0-9_.:-]\+" contains=bladeComponentDelimiter containedin=ALLBUT,bladeComment,bladeRawEcho,bladeEcho
syntax match bladeComponentDelimiter "</\?" contained

highlight default link bladeComment Comment
highlight default link bladeCommentDelimiter Comment
highlight default link bladeDelimiter Delimiter
highlight default link bladeRawEcho PreProc
highlight default link bladeEcho PreProc
highlight default link bladeRawEchoInHtml bladeRawEcho
highlight default link bladeEchoInHtml bladeEcho
highlight default link bladeDirective Statement
highlight default link bladeComponent Function
highlight default link bladeComponentDelimiter Delimiter

let b:current_syntax = "blade"
