"       Basic settings
set nocompatible
set noswapfile
set number
set relativenumber
set hlsearch
set wildmenu
set termguicolors
set clipboard=unnamedplus

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
vmap ; :

" Turn off highlights with ESC when in normal mode
nmap <silent> <ESC> :noh <CR>

" Save the file with <Leader>+w
map <Leader>w :w <CR>

" Modify the up and down motions to also center the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"" Remap the Enter key to insert new lines
nmap <Enter> o<ESC>
nmap <S-Enter> O<ESC>j
nmap <C-Enter> o<ESC>k

"" Using Ctrl and k or j will duplicate the current line above or below
nnoremap <C-j> yyp
nnoremap <C-k> yyP

"" Using Ctrl-b to list out open buffers and ready a prompt to switch between them
nnoremap <C-b> :ls<CR>:buffer<Space>

" Toggle displaying a character with whitespace
nnoremap <silent> <Leader>l :set list!<CR>

" Adding/Removing tabs
nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

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
set signcolumn=yes

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

" Autocommand for treesitter
augroup StartTreesitter
    autocmd!
    autocmd FileType * lua pcall(vim.treesitter.start)
augroup END

" oil.nvim
lua << EOF
require("oil").setup({
    columns = {
       "icon",
       "permissions",
       "size",
       -- "mtime",
    },
})
EOF

nnoremap <silent>- :Oil<CR>
nnoremap <silent><Leader>- :Oil --float<CR>


" blink.cmp
lua << EOF
require("blink.cmp").setup({
    keymap = {preset = "default" },
    completion = {
        menu = {
            auto_show = false,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 50,
        },
        ghost_text = { enabled = false },
    },
})
EOF
