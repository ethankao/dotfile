if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" let Vundle manage Vundle
" required!
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'


" javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'ethankao/vim-mocha-run'
NeoBundle 'marijnh/tern_for_vim', {
      \ 'build' : {
      \     'mac' : 'npm install',
      \     'unix' : 'npm install',
      \    },
      \ }
NeoBundle 'elzr/vim-json'
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/echodoc'
"NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'sirver/ultisnips'
NeoBundle 'honza/vim-snippets'

" html / css
NeoBundle 'skammer/vim-css-color'

" scala
NeoBundle 'derekwyatt/vim-scala'

" ruby
"NeoBundle 'astashov/vim-ruby-debugger', { 'rev': 'v1.0' }

" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'

" Bundle 'tpope/vim-fugitive'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
"
call neobundle#end()

filetype plugin indent on     " required!

" preference
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set hlsearch
" no tab
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch " show matching brackets
" no wrap
set textwidth=0
set nu
" set rnu // rnu is slow

" list
set list
set listchars=trail:.,tab:>.,extends:>,precedes:<,nbsp:.

" trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Syntax
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scala_checkers = ['fsc']
let g:syntastic_always_populate_loc_list=1

" Short Cuts
" Jump Between Errors
" Replace command
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
map <F2> :NERDTreeToggle<CR>

" airline
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_solarized_bg='dark'

" tern
let g:tern_map_keys=1
set completeopt-=preview

" Auto Complete
" let g:ycm_autoclose_preview_window_after_insertion = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""
" <Return> to close popup
inoremap <expr><Return> pumvisible() ? neocomplete#close_popup() : "\<Return>"

" delimitMate
let delimitMate_expand_cr = 1
let g:vimshell_editor_command = 1
let g:echodoc_enable_at_startup = 1

" Unite
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_winheight=10
let g:unite_split_rule='belowright'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_file_mru_limit = 200

call unite#filters#matcher_default#use(['matcher_fuzzy'])

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-S --nogroup --nocolor --ignore-dir fixtures'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='-a -C4'
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

" snippet
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
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif
"
let g:cssColorVimDoNotMessMyUpdatetime = 1

au BufNewFile,BufRead *.scala   setlocal filetype=scala
autocmd BufNewFile,BufRead *.pdsc set filetype=json
autocmd BufNewFile,BufRead *.avsc set filetype=json

" ruby
"let g:ruby_debugger_progname = 'vim'
