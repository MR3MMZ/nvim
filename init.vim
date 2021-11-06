call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'codota/tabnine-vim'
call plug#end()

syntax on
colorscheme onedark

set background=dark
set hidden
set number
set relativenumber
set inccommand=split
set tabstop=2
set shiftwidth=2
set guicursor+=n:hor20-Cursor/lCursor
set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12
set encoding=utf-8

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
let g:UltiSnipsEditSplit = 'vertical' 
let g:indentLine_enabled = 1
let mapleader="\<space>"
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
let s:comment_map = { 
    \   "go": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "ruby": '#',
    \   "sh": '#',
    \   "bash": '#',
    \   "zsh": '#',
    \   "conf": '#',
    \   "config": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "zshrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "yml": '#',
    \   "yaml": '#',
    \ }

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <c-s> :w<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-d> :t.<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <M-l> :bn<cr>
nnoremap <M-h> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>
nnoremap <C-b> :NERDTreeToggle<cr>
nnoremap <F4> :q<CR>
nnoremap <F4> <Esc:q<CR>
nnoremap <leader><Space> :call ToggleComment()<cr>


function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

hi Normal          ctermfg=252 ctermbg=none
