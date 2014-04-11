if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

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
"NeoBundle 'marijnh/tern_for_vim', {
      "\ 'build': {
      "\ 'build' : {
      "\     'mac' : 'npm install',
      "\     'unix' : 'npm install',
      "\    },
      "\ }
NeoBundle 'elzr/vim-json'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/echodoc'
NeoBundle 'terryma/vim-multiple-cursors'


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
  let g:unite_source_grep_default_opts='-S -C4'
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
