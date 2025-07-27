"       Basic settings
set nocompatible
set number
set relativenumber
set hlsearch
set wildmenu
set termguicolors

" Setting the cursor shape
" A random character map stolen from stack overflow
    " Ps = 0  -> blinking block.
    " Ps = 1  -> blinking block (default).
    " Ps = 2  -> steady block.
    " Ps = 3  -> blinking underline.
    " Ps = 4  -> steady underline.
    " Ps = 5  -> blinking bar (xterm).
    " Ps = 6  -> steady bar (xterm).

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
let &t_ER = "\e[2 q"

" This shit is needed by iTerm for some fucking reason or the cursor lags
set ttimeout
set ttimeoutlen=1
set ttyfast

"       Mappings
let mapleader = " "
" Stop the Space, Enter and Backspace keys from moving the cursor in NORMAL mode
nmap <Space> <Nop>
nmap <Enter> <Nop>
nmap <BS> <Nop>

" Map the semicolor to color to make entering command mode more comfortable
nmap ; :

" Turn off highlights with ESC when in normal mode
nmap <ESC> :noh <CR>

" Save the file with <Leader>+w
map <Leader>w :w <CR>
map <Leader>ex :Ex <CR>

" Modify the up and down motions to also center the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" <Leader>+o/O will insert and go to a line below/above the current line, without entering INSERT mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

"" Remap the Enter key to insert new lines
nmap <Enter> o<ESC>
nmap <S-Enter> O<ESC>j
nmap <C-Enter> o<ESC>k

" Toggle displaying character with whitespace
nnoremap <Leader>l :set list!<CR>

"       Code Style
syntax on
try 
    colorscheme platy-dark
catch
    colorscheme default
endtry

set nowrap
set cursorline
set colorcolumn=120

" Displaying a '·' character for spaces 
set list
set listchars=space:\\xB7

" Tabs
set expandtab
set shiftwidth=4
set tabstop=4

" TreeSitter
packadd nvim-treesitter
lua << EOF
require("nvim-treesitter").setup{
    highlight = {
        enable = true,
    },
    ensure_installed = {
        "c", "cpp", "python",
        "lua", "vim"
    },
}
EOF

lua vim.treesitter.start()
