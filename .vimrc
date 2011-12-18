let g:vimwiki_list = [{'path': '~/repos/space__/documents/wiki'}] 
let g:vimwiki_browsers=['/usr/bin/google-chrome']

set nocp

filetype plugin on
syntax on

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


set autoindent
set expandtab
filetype indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2

autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

autocmd FileType python,ruby,bash map ,c :s/^/# /<CR>
autocmd FileType python,ruby,bash map ,u :s/^# //<CR>

set nu
set ru

colorscheme desert
set bg=dark

"au BufRead,BufNewFile *.go set filetype=go
" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
" http://stackoverflow.com/questions/3458149/vim-c-auto-complete
" http://stackoverflow.com/questions/1115876/autocompletion-in-vim
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

set tags=~/.vim/stdtags,tags,.tags,../tags

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

autocmd FileType python set omnifunc=pythoncomplete#Complete

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1


au BufRead,BufNewFile *.txt set tw=80
au BufRead,BufNewFile *.txt set nonu
au BufRead,BufNewFile *.wiki set tw=80
au BufRead,BufNewFile *.wiki set nonu


