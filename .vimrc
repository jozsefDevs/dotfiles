" -------------
" PATHOGEN - PLUGIN INSTALL
" -------------

execute pathogen#infect()
syntax on
filetype plugin indent on

" -------------
" DMENU
" -------------

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("find . -not -path './build/*' | dmenu -i -l 40 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>
nnoremap vt :call DmenuOpen("vsplit")<cr>

" -------------
" TAB HANDLING
" -------------

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" -------------
" NO. LINES
" -------------
set number

" -------------
" CLOJURE THINGS
" -------------
" plugin installation: https://github.com/tpope/vim-pathogen
" https://github.com/guns/vim-clojure-static
" blog: how do i develop clojure with vim: http://writequit.org/blog/?p=386
" blog: Like slim, for Vim: http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
" vim-slime plugin: https://github.com/jpalardy/vim-slime
" vim-clojure: https://github.com/vim-scripts/VimClojure
" blog: writing clojure with vim in 2013:
" http://mybuddymichael.com/writings/writing-clojure-with-vim-in-2013.html
" vim fireplace plugin: https://github.com/tpope/vim-fireplace

"let g:clojure_maxlines = 100 "!!!!!!!
"let g:clojure_fuzzy_indent = 1
"let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
"let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
"let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'
"let g:clojure_align_multiline_strings = 0
"
" let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
" let g:clj_paren_rainbow=1           " Rainbow parentheses'!

let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

" ---------------------------------------------------------------------------
"  Automagic Clojure folding on defn's and defmacro's
"
function GetClojureFold()
      if getline(v:lnum) =~ '^\s*(defn.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*$'
            let my_cljnum = v:lnum
            let my_cljmax = line("$")
 
            while (1)
                  let my_cljnum = my_cljnum + 1
                  if my_cljnum > my_cljmax
                        return "<1"
                  endif
 
                  let my_cljdata = getline(my_cljnum)
 
                  " If we match an empty line, stop folding
                  if my_cljdata =~ '^$'
                        return "<1"
                  else
                        return "="
                  endif
            endwhile
      else
            return "="
      endif
endfunction
 
function TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction
 
autocmd FileType clojure call TurnOnClojureFolding()
