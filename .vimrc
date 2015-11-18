call plug#begin('~/.vim/plugged')

" Common Plugins =======================================================

Plug 'altercation/vim-colors-solarized'
"Plug 'freeo/vim-kalisi'

Plug 'bling/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
nnoremap <C-p> :FZF<cr>

Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

Plug 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list=1

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/echodoc'
let g:echodoc_enable_at_startup = 1

Plug 'Shougo/neocomplete'
Plug 'Shougo/deoplete.nvim'
if has("nvim")
  let g:deoplete#enable_at_startup = 1
else
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""
" <Return> to close popup
inoremap <expr><Return> pumvisible() ? neocomplete#close_popup() : "\<Return>"

Plug 'Shougo/unite.vim'
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_winheight=10
let g:unite_split_rule='belowright'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_file_mru_limit = 200


if executable('ag')
" unite
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-S --nogroup --nocolor --ignore-dir fixtures'
  let g:unite_source_grep_recursive_opt=''
endif

function! s:unite_settings()
  " Overwrite settings.
  nnoremap <silent><buffer><expr> v unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

autocmd FileType unite call s:unite_settings()

" nnoremap <C-p> :Unite -toggle file_rec file_mru buffer<cr>
nnoremap <space>/ :Unite -no-quit grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell.vim'
let g:vimshell_editor_command = 1

Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
function! UltiSnipsCallUnite()
  Unite -start-insert -winheight=10 -immediately -no-empty ultisnips
  return ''
endfunction

inoremap <silent> <F3> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F3> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

Plug 'vasconcelloslf/vim-interestingwords'

" javascript plugins ===================================================
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

Plug 'elzr/vim-json', { 'for': [ 'js', 'javascript', 'json' ] }

Plug 'ethankao/vim-mocha-run', { 'for': [ 'js', 'javascript', 'json' ] }

Plug 'heavenshell/vim-jsdoc', { 'for': [ 'js', 'javascript', 'json' ] }

Plug 'marijnh/tern_for_vim', { 'for': [ 'js', 'javascript', 'json' ], 'do': 'npm install' }

let g:tern_map_keys=1
set completeopt-=preview

Plug 'pangloss/vim-javascript', { 'for': [ 'js', 'javascript', 'json' ] }

" iOS ==================================================================
autocmd Filetype objc setlocal ts=4 sts=4 sw=4

Plug 'derekwyatt/vim-fswitch', { 'for': 'objc' }
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'Rip-Rip/clang_complete', { 'for': [ 'objc', 'swift' ], 'do': 'make install' }
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"if isdirectory(s:clang_library_path)
    "let g:clang_library_path=s:clang_library_path
"endif

"Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
"Plug 'kballard/vim-swift', { 'for': 'swift' }
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Shougo/neosnippet'
"let g:neosnippet#disable_runtime_snippets = {
"\   '_' : 1,
"\ }
"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ \<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ \<Plug>(neosnippet_expand_or_jump)"
"\: \<TAB>"

" For snippet_complete marker.
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif
"

"Plug 'joonty/vdebug'
"Plug 'astashov/vim-ruby-debugger', { 'rev': 'v1.0' }

call plug#end()

filetype plugin indent on     " required!
" preference
syntax enable
set hlsearch
" no tab
set shiftwidth=2
set softtabstop=2
set expandtab
set noshowmatch " show matching brackets
" no wrap
set textwidth=0
set nu
" set rnu // rnu is slow
" menu completion
set wildmode=longest,list
set wildmenu

if has("nvim")
  set clipboard=unnamedplus
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set ttimeout
  set ttimeoutlen=0
endif

set background=dark
colorscheme solarized
let g:solarized_termcolors=256
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_solarized_bg='dark'

let g:python_host_prog = '/usr/bin/python'

" list
set list
set listchars=trail:.,tab:>.,extends:>,precedes:<,nbsp:.

" trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Short Cuts
" Jump Between Errors
" Replace command
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" omni commpletion
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

au BufNewFile,BufRead *.scala setlocal filetype=scala
autocmd BufNewFile,BufRead *.pdsc set filetype=json
autocmd BufNewFile,BufRead *.avsc set filetype=json
autocmd BufNewFile,BufRead *.h setlocal filetype=objc
autocmd BufNewFile,BufRead *.m setlocal filetype=objc

" interesting worlds
let g:brightest#highlight = {"group": "BrightestUnderline"}

command! JLint %!python -m json.tool
imap jk <Esc>
