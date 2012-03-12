call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin on

" Set visual settings
set number
syntax on

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

" Search Settings
set hlsearch
set incsearch
set ignorecase 
set smartcase

" Indents
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
filetype plugin indent on

" Coding Settings
highlight MatchParen ctermbg=4

" Colors
colorscheme andrew
highlight DiffAdd term=reverse cterm=bold ctermbg=darkgreen ctermfg=black 
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black 
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

" Keyboard Shortcuts
map <F12> :!ctags -R -o .tagsdb<CR><CR>:!cscope -R -b<CR><CR>
nmap <silent> ,o :CommandT<CR>

" Python
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Plugins
" C-tags
let g:ctags_statusline=1
set tags=.tagsdb

" Taglist variables
" Display function name in status bar:
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" Pydiction
let g:pydiction_location = '~/Scripts/3rdParty/complete-dict'
