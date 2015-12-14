" setting system font

set guifont=Inconsolata-dz\ for\ Powerline:h14

" -------------
" PATHOGEN - PLUGIN INSTALL
" -------------

execute pathogen#infect()
syntax on
filetype plugin on

" -------------
" list/listchars
" -------------

set list
set listchars=tab:›\ ,trail:·,nbsp:_

" -------------
" DMENU
" -------------

" Strip the newline from the end of a string
"function! Chomp(str)
"  return substitute(a:str, '\n$', '', '')
"endfunction
"
"" Find a file and pass it to cmd
"function! DmenuOpen(cmd)
"  let fname = Chomp(system("find . -not -path './build/*' | dmenu -i -l 40 -p " . a:cmd))
"  if empty(fname)
"    return
"  endif
"  execute a:cmd . " " . fname
"endfunction
"
"map <c-t> :call DmenuOpen("tabe")<cr>
"map <c-f> :call DmenuOpen("e")<cr>
"nnoremap vt :call DmenuOpen("vsplit")<cr>

" -------------
" TAB HANDLING
" -------------

" nnoremap th  :tabfirst<CR>
" nnoremap tj  :tabnext<CR>
" nnoremap tk  :tabprev<CR>
" nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
" nnoremap tn  :tabnext<Space>
" nnoremap tm  :tabm<Space>
" nnoremap td  :tabclose<CR>
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
function! GetClojureFold()
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

function! TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()

" -------------
" list/listchars
" -------------

"ctrlp ignore
set wildignore+=*/tmp/*,*/build/*,*/target/*,*/bin/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_lazy_update = 1
let g:ctrlp_max_files = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
nmap lw :CtrlP<CR><C-\>w

" -------------
" autoindent
" -------------
set ai
set hlsearch

" -------------
" https://github.com/pangloss/vim-javascript
" -------------
set foldmethod=syntax
set nofoldenable

let javascript_enable_domhtmlcss=1
let b:javascript_fold=1

" -------------
" show airline even with 1 file
" -------------
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled=1
let g:syntastic_css_csslint_args = '--ignore=box-sizing,adjoining-classes'
let g:syntastic_javascript_checkers = ["eslint"]

" -------------
" signify
" -------------
let g:signify_vcs_list = [ 'svn', 'git', 'hg' ]


" ----------------------------------
" drag visuals plugin
" can drag visual blocks with arrows
" ----------------------------------
"vmap  <expr>  <LEFT>   DVB_Drag('left')
"vmap  <expr>  <RIGHT>  DVB_Drag('right')
"vmap  <expr>  <DOWN>   DVB_Drag('down')
"vmap  <expr>  <UP>     DVB_Drag('up')
"vmap  <expr>  D        DVB_Duplicate()
"
"let g:DVB_TrimWS = 1

" ----------------------------------
" set leader key to comma
" ----------------------------------
let mapleader = ","

" ----------------------------------
" map Silver Searcher
" ----------------------------------
map <leader>a :!Ag<space>

" ----------------------------------
" search for word under cursor with Silver Searcher
" ----------------------------------
map <leader>A :!Ag "<C-r>=expand('<cword>')<CR>"

" ----------------------------------
	" using buffers instead of tabs
" ----------------------------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" My preference with using buffers. See `:h hidden` for more details
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap tk :bnext<CR>

" Move to the previous buffer
nmap tj :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap tq :bp <BAR> bd #<CR>

" ----------------------------------
" using buffers instead of tabs
" ----------------------------------
nnoremap <F6> :GundoToggle<CR>

" ----------------------------------
" startify
" ----------------------------------
let g:startify_custom_header =
\ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
