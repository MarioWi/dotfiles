call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
call plug#end()

set clipboard+=unnamedplus

" no swap file
set noswapfile

"save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=1000

" set linenumber
set number

" use 4 spaces instead of tab()
" copy intend from curent line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hidden

nnoremap <space> <nop>
let mapleader = "\<space>"

let g:winresizer_start_key = "<leader>w"

noremap <leader>bn :bn<cr> ;buffer next
noremap <leader>tn gt ;new tab

nnoremap <c-w>h <c-w>s

augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufwritePre *.csv :%UnArrangeColumn
augroup END


