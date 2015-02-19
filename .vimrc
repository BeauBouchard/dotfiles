syntax enable 
filetype plugin indent on
set background=dark
colorscheme solarized
set hlsearch

set autowrite "Automatically :write before running commands

" Remap from ctrl+w+j => ctrl+j for easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vimâ€™s default:
set splitbelow
set splitright

"Backspace Behavior
set backspace=indent,eol,start
" =start Can delete back past start of edit
" =indent Can delete back past autoindenting
" =eol Can delete back to the previous line

"Disable arrow keys (learning is hard)
noremap <left> <nop>
noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>

"Tab Behavior
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
	
"Editor Style
set number
set scrolloff=5

"Status Bar
set laststatus=2
let g:airline_powerline_fonts = 1

"Nerd Tree
map <C-n> :NERDTreeToggle<CR>
