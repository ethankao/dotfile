if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Common Plugins =======================================================

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'

NeoBundle 'honza/vim-snippets'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
nnoremap <C-p> :FZF<cr>

NeoBundle 'majutsushi/tagbar'
NeoBundle 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

NeoBundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list=1

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Shougo/echodoc'
let g:echodoc_enable_at_startup = 1

NeoBundle 'Shougo/neocomplete'
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""
" <Return> to close popup
inoremap <expr><Return> pumvisible() ? neocomplete#close_popup() : "\<Return>"

NeoBundle 'Shougo/unite.vim'
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

NeoBundle 'Shougo/vimproc.vim', {
\    'build' : {
\        'mac' : 'make -f make_mac.mak',
\        'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle 'Shougo/vimshell.vim'
let g:vimshell_editor_command = 1

NeoBundle 'sirver/ultisnips'
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

NeoBundle 'vasconcelloslf/vim-interestingwords'

" javascript plugins ===================================================

NeoBundle 'elzr/vim-json', {
\    'lazy' : 1,
\    'autoload' : {
\        'filetypes' : [ 'js', 'javascript', 'json' ]
\    }
\ }

NeoBundle 'ethankao/vim-mocha-run', {
\    'lazy' : 1,
\    'autoload' : {
\        'filetypes' : [ 'js', 'javascript', 'json' ]
\    }
\ }

NeoBundle 'heavenshell/vim-jsdoc', {
\    'lazy' : 1,
\    'autoload' : {
\        'filetypes' : [ 'js', 'javascript', 'json' ]
\    }
\ }

NeoBundle 'marijnh/tern_for_vim', {
\    'lazy' : 1,
\    'autoload' : {
\        'filetypes' : [ 'js', 'javascript', 'json' ]
\    },
\    'build' : {
\        'mac' : 'npm install',
\        'unix' : 'npm install',
\    }
\ }
let g:tern_map_keys=1
set completeopt-=preview

NeoBundle 'pangloss/vim-javascript', {
\    'lazy' : 1,
\    'autoload' : {
\        'filetypes' : [ 'js', 'javascript', 'json' ]
\    }
\ }

" iOS ==================================================================
autocmd Filetype objc setlocal ts=4 sts=4 sw=4

NeoBundle 'b4winckler/vim-objc'
NeoBundle 'keith/swift.vim'
NeoBundle 'Rip-Rip/clang_complete', {
\    'build' : {
\        'mac' : 'make install',
\        'unix' : 'make install',
\    }
\ }
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

"NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'toyamarinyon/vim-swift'
"NeoBundle 'kballard/vim-swift'
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'Shougo/neosnippet'
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

"NeoBundle 'joonty/vdebug'
"NeoBundle 'astashov/vim-ruby-debugger', { 'rev': 'v1.0' }

call neobundle#end()

filetype plugin indent on     " required!
" preference
syntax enable
set background=dark
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

colorscheme solarized
let g:solarized_termcolors=256
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_solarized_bg='dark'

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
