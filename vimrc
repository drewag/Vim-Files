call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" ---------------------------- Global Variables --------------------------
if has('win32') || has ('win64')
    let g:vim_home = $VIM."/vimfiles"
else
    let g:vim_home = $HOME."/.vim"
endif

" ---------------------------- Keyboard Shortcuts --------------------------
let mapleader = ","

" Toggle menu in gvim
nnoremap <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" Building and testing
" map <F7> :make %<<CR>
map <F7> !sys_mak.pl<<CR>
map <F5> :!./run<CR>

" Unindent while in insert mode
imap <S-Tab> <C-D>  " Unindent

" Navigate Tags
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

" Replace a local variable name
nnoremap gr gd[{V%:s/<C-R>///g<left><left>

" Replace a global variable name
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Toggle between header and implimenation
nmap <C-RIGHT> :A<CR>
nmap <C-LEFT> :A<CR>

" Toggle list of tags
map <F3> :TlistToggle<CR>

" Generate ctags and cscope files
"map <F12> :!ctags -R -h ".h.hpp" -o .tagsdb --c++-kinds=+p --fields=+aiS --extra=+q<CR><CR>:!cscope -R -b<CR><CR>

" Open file under cursor in vertical split
map <F8> :vertical wincmd f<CR>

" Open file using net commands
map <F2> :call NetCommandOpenFile()<CR><CR>

" Search for selected text forwards
vnoremap <silent> * :<C-U>
   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
   \gvy/<C-R><C-R>=substitute(
   \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
   \gV:call setreg('"', old_reg, old_regtype)<CR>

" Search for selected text backwards
vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

" --------------------------- Auto Commands ---------------------------------

augroup vimrcgroup
    " Prompt user about deleting end of line whitespace errors
    autocmd BufWritePre * if !(&readonly) && &modifiable | :%s/ \+$//egc | endif

    " Code Folding Start Open
    autocmd BufRead * normal zR

    " Spelling
    autocmd BufRead,BufNewFile *.* set spell

    " Python
    autocmd BufNewFile,BufRead,FileReadPost *.py exec 'source ' . g:vim_home . '/python.vim'
augroup END

" --------------------------- Custom Filetypes ------------------------------

" Map extentions to existing syntax files
au BufNewFile,BufRead *.str set filetype=xml
au BufNewFile,BufRead *.h set filetype=cpp
au BufNewFile,BufRead *.hpp set filetype=cpp
au BufNewFile,BufRead *.ps1 set filetype=ps1
au BufNewFile,BufRead *Test.cpp runtime! syntax/googletest.vim

" Custom syntax files
au BufNewFile,BufRead *.bnf set filetype=nuance-grammar
au BufNewFile,BufRead *.glx set filetype=glx

" Custom Encodings
au BufNewFile *.utr set fileencoding=utf-16le

" ------------------------------- Settings ----------------------------------

" GUI Settings
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar

" Appearence
syntax on
colorscheme andrew
set number " Enable Line Numbers
set nowrap " Don't wrap lines

" Set status line
set laststatus=2
set statusline=%{fugitive#statusline()}
set statusline+=%t   "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Behavior
set backspace=start,eol,indent

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indents
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent

" Code Sense
highlight MatchParen ctermbg=4
set foldmethod=syntax

" Autocomplete
set completeopt=menu,menuone,longest " Complete options (disable preview scratch window)

" Other Options
set switchbuf=useopen
set wildignore+=*.pyc,*.bin,*.zip,*.exe,*.swp,*.so,*.7z

" -------------------------------- Plugins ----------------------------------
" Alternate
let g:alternateNoDefaultAlternate = 1
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
let g:alternateSearchPath = g:alternateSearchPath . ',reg:#Include#Code#,reg:#Code#Include#,reg:#Base#Code#,reg:#Code#Base#'

" Ctrl-P
let g:ctrlp_map = ',o'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\out$',
    \ 'file': '',
    \ 'link': '',
    \ }

" Ctags (Intellisense)
set tags+=./.tagsdb
set tags+=~/.tags/std3.3.tags
set tag+=~/eng/libs/nuance/tagsdb

" Pydiction
let g:pydiction_location=g:vim_home . "/bundle/pydiction/complete-dict"

" Taglist
let generate_tags=1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_File_Fold_Auto_Close = 1
