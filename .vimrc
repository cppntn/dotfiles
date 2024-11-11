" Plugin section - THIS MUST BE AT THE VERY TOP of .vimrc
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Add these for Python support
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'github/copilot.vim'
call plug#end()

" Basic Settings
set nocompatible
syntax enable
filetype plugin indent on

" Leader key
let mapleader = " "

" Create undo directory if it doesn't exist
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

" Set undo directory
set undodir=~/.vim/undo

" Disable netrw completely
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" NERDTree settings
let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI=1  " Hide help text
let g:NERDTreeDirArrowExpandable='>'
let g:NERDTreeDirArrowCollapsible='v'
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^\.DS_Store$', '\.git$']

" Auto close NERDTree if it's the last window
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" IndentLine configuration
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 2
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3b3b3b'
let g:indentLine_enabled = 1

set updatetime=250
set conceallevel=0

" Enable git signs
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
let g:gitgutter_max_signs = -1 

" Auto-refresh gitgutter when focusing Vim or entering a buffer
augroup GitGutterRefreshOnFocus
    autocmd!
    autocmd FocusGained,BufEnter * let g:gitgutter_async=1 | GitGutter
augroup END

" Force sign column to be visible
set signcolumn=yes

" Make colors very visible
highlight GitGutterAdd    guifg=#00ff00 ctermfg=46
highlight GitGutterChange guifg=#ffff00 ctermfg=226
highlight GitGutterDelete guifg=#ff0000 ctermfg=196

" Map space+ph to preview hunk
nnoremap <leader>ph :GitGutterPreviewHunk<CR>

" General Settings
set encoding=utf-8
set number                      " Show line numbers
set norelativenumber             " Show relative line numbers
set cursorline                " Highlight current line
set showmode                  " Show current mode
set showcmd                   " Show command in bottom bar
set expandtab                 " Use spaces instead of tabs
set tabstop=2                 " Visual spaces per tab
set softtabstop=2            " Spaces in tab when editing
set shiftwidth=2             " Auto indent spaces
set smartindent              " Smart indenting
set linebreak                " Break lines at word boundary
set scrolloff=8              " Keep 8 lines above/below cursor
set sidescrolloff=8          " Keep 8 characters left/right of cursor
set nowrap                   " Don't wrap lines
set ignorecase              " Case insensitive search
set smartcase               " Case sensitive if contains uppercase
set incsearch               " Search as characters are entered
set hlsearch                " Highlight search matches
set hidden                  " Allow switching buffers without saving
set mouse=a                 " Enable mouse support
set clipboard=unnamed,unnamedplus  " Use system clipboard
set noswapfile             " Disable swap file
set nobackup               " Disable backup file
set undofile               " Enable persistent undo
set updatetime=250         " Faster completion
set timeoutlen=400         " Faster key sequence completion
set splitright             " Split windows right
set splitbelow             " Split windows below

" Cursor settings
let &t_SI = "\e[5 q"    " Insert mode - slim vertical cursor
let &t_EI = "\e[2 q"    " Normal mode - block cursor
let &t_SR = "\e[3 q"    " Replace mode - underline cursor

" Status Line Configuration
set laststatus=2
set statusline=                " Reset status line
set statusline+=%F            " Full path to file
set statusline+=%m            " Modified flag
set statusline+=%r            " Readonly flag
set statusline+=%h            " Help file flag
set statusline+=%w            " Preview window flag
set statusline+=/%Y)          " File type [PYTHON][RUBY]
set statusline+=\ (line\      " Literal 'line'
set statusline+=%l           " Current line number
set statusline+=\/%L,        " Total lines
set statusline+=\ col\       " Literal 'col'
set statusline+=%c)          " Column number

" Disable line numbers in terminal
augroup TerminalStuff
  autocmd!
  autocmd TerminalOpen * setlocal nonumber norelativenumber
augroup END

" Key Mappings - Insert Mode
inoremap <C-a> <ESC>^i
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D
inoremap <C-s> <Esc>:w<CR>

" Key Mappings - Normal Mode
nnoremap d "_d
nnoremap D "_D
nnoremap dd "_dd
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
nnoremap ; :
nnoremap <Esc> :noh<CR>
" Window navigation mappings
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <C-s> :w<CR>
nnoremap <C-c> :%y+<CR>
nnoremap <leader>n :set nu!<CR>
nnoremap <leader>rn :set rnu!<CR>
nnoremap <leader>b :enew<CR>
" Terminal splits
nnoremap <leader>h :terminal<CR>
nnoremap <leader>v :vertical terminal<CR>

" Key Mappings - Visual Mode
vnoremap d "_d
vnoremap D "_D
vnoremap < <gv
vnoremap > >gv

" Terminal Mode Mappings
tnoremap <C-x> <C-\><C-n>

" FZF mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
" Custom Rg command to include hidden files
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <leader>fw :Rg<CR>

" Function to close buffer while maintaining window layout
function! CloseBuffer()
    " Check if current buffer is terminal
    if &buftype ==# 'terminal'
        " Do nothing for terminal buffers
        return
    endif

    " Save the current window number
    let l:current_win = winnr()
    let l:current_buf = bufnr('%')

    " Switch to next buffer in this window
    if &filetype != 'nerdtree'
        bnext
        if bufnr('%') == l:current_buf
            bprevious
        endif
        " Now delete the original buffer
        execute 'bdelete ' . l:current_buf
    endif
endfunction

" Function to switch to next non-terminal buffer
function! NextBuffer()
    " Check if current buffer is terminal
    if &buftype ==# 'terminal'
        " Do nothing for terminal buffers
        return
    endif

    " Get list of all buffers
    let l:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:current = bufnr('%')
    let l:next = l:current

    " Find next non-terminal buffer
    for l:buf in l:buffers
        if getbufvar(l:buf, '&buftype') !=# 'terminal' && l:buf > l:current
            let l:next = l:buf
            break
        endif
    endfor

    " If no next buffer found, wrap around to first non-terminal buffer
    if l:next == l:current
        for l:buf in l:buffers
            if getbufvar(l:buf, '&buftype') !=# 'terminal'
                let l:next = l:buf
                break
            endif
        endfor
    endif

    " Switch to the buffer
    if l:next != l:current
        execute 'buffer ' . l:next
    endif
endfunction

" Function to switch to previous non-terminal buffer
function! PreviousBuffer()
    " Check if current buffer is terminal
    if &buftype ==# 'terminal'
        " Do nothing for terminal buffers
        return
    endif

    " Get list of all buffers
    let l:buffers = reverse(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:current = bufnr('%')
    let l:prev = l:current

    " Find previous non-terminal buffer
    for l:buf in l:buffers
        if getbufvar(l:buf, '&buftype') !=# 'terminal' && l:buf < l:current
            let l:prev = l:buf
            break
        endif
    endfor

    " If no previous buffer found, wrap around to last non-terminal buffer
    if l:prev == l:current
        for l:buf in reverse(l:buffers)
            if getbufvar(l:buf, '&buftype') !=# 'terminal'
                let l:prev = l:buf
                break
            endif
        endfor
    endif

    " Switch to the buffer
    if l:prev != l:current
        execute 'buffer ' . l:prev
    endif
endfunction

" Buffers functions
nnoremap <leader>x :call CloseBuffer()<CR>
nnoremap <Tab> :call NextBuffer()<CR>
nnoremap <S-Tab> :call PreviousBuffer()<CR>

" NERDTree mappings
autocmd FileType nerdtree nnoremap <buffer> <Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <S-Tab> <nop

" File Explorer mapping
nnoremap <C-n> :NERDTreeToggle<CR>

" Colors and Theme
set termguicolors
colorscheme catppuccin_mocha     " Default colorscheme, you can change this

""""""""""""""""""""""" Python specific settings""""""""""""
let g:python_highlight_all = 1
set tags=tags

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" Python specific indentation
autocmd FileType python setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=88
    \ expandtab
    \ autoindent
    \ fileformat=unix
    \ encoding=utf-8

" Python specific keymaps
autocmd FileType python nnoremap <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType python nnoremap <buffer> K :ALEHover<CR>
"autocmd FileType python nnoremap <buffer> <leader>ca :ALECodeAction<CR>

" Configure path for better file finding
set path+=**
set wildmenu
set wildignore+=*/__pycache__/*,*.pyc


""""""""""""""""""""""" Terraform specific settings""""""""""""""""""""
" Basic terraform settings
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1
" Syntax highlighting
autocmd BufNewFile,BufRead *.tf,*.tfvars set filetype=terraform
autocmd BufNewFile,BufRead *.hcl set filetype=hcl

" Format on save using terraform fmt
autocmd BufWritePre *.tf silent! !terraform fmt %

" Terraform specific keymaps (similar to what we have for Python)
autocmd FileType terraform nnoremap <buffer> gd :ALEGoToDefinition<CR>
autocmd FileType terraform nnoremap <buffer> K :ALEHover<CR>
"autocmd FileType terraform nnoremap <buffer> <leader>ca :ALECodeAction<CR>

""

" ALE Configuration for Python, Terraform, et al.
let g:ale_linters = {
\   'python': ['pyright'],
\   'terraform': ['terraformls']
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'terraform': ['terraform']
\}

""""""""""""""""""""" JSON
let g:vim_json_conceal=0
" Debug function to see what jq is doing
function! FormatJSON()
    let l:save = winsaveview()
    if &filetype == 'json'
        " Print the command that's about to be run
        echo "Running jq..."
        silent %!jq --monochrome-output '.'
        if v:shell_error != 0
            undo
            echohl ErrorMsg
            echo "jq error: " . v:shell_error
            echohl None
        endif
    endif
    call winrestview(l:save)
endfunction

" Auto-format JSON files on save
augroup JsonFormatting
    autocmd!
    " Set filetype to json for .json files
    autocmd BufNewFile,BufRead *.json set filetype=json
    " Format JSON files before writing
    autocmd BufWritePre *.json call FormatJSON()
augroup END


""""""""""""""""""""" to-do comments"""""""""""""""""""""""""

" Define todo keywords and their colors
augroup TodoHighlights
    autocmd!
    autocmd Syntax * syntax match myTodo /\v\@?(TODO|FIXME|XXX|HACK):/hs=s+1 containedin=.*Comment
    autocmd Syntax * syntax match myInfo /\v\@?(INFO|NOTE):/hs=s+1 containedin=.*Comment
    autocmd Syntax * syntax match myWarn /\v\@?(WARN|WARNING|PERF):/hs=s+1 containedin=.*Comment
    autocmd Syntax * syntax match myTest /\v\@?(TEST|TESTING):/hs=s+1 containedin=.*Comment
    autocmd Syntax * highlight myTodo guifg=#FF8C00 ctermfg=208 gui=bold
    autocmd Syntax * highlight myInfo guifg=#98C379 ctermfg=114 gui=bold
    autocmd Syntax * highlight myWarn guifg=#E5C07B ctermfg=180 gui=bold
    autocmd Syntax * highlight myTest guifg=#61AFEF ctermfg=75 gui=bold
augroup END

" Function to search for to-do comments using fzf
function! SearchTodos()
    " Use an array of patterns we want to match
    let patterns = [
        \ 'TODO:',
        \ 'FIXME:',
        \ 'XXX:',
        \ 'HACK:',
        \ 'INFO:',
        \ 'NOTE:',
        \ 'WARN:',
        \ 'WARNING:',
        \ 'PERF:',
        \ 'TEST:',
        \ 'TESTING:'
    \ ]
    
    " Join patterns with OR operator
    let search_pattern = join(patterns, '|')
    
    " Execute the Rg command with proper escaping
    execute 'Rg "' . search_pattern . '"'
endfunction

" Map leader ft to search TODOs
nnoremap <leader>ft :call SearchTodos()<CR>

" Use ripgrep for faster searching if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ --smart-case
    set grepformat=%f:%l:%c:%m
endif

" Comment/uncomment lines
function! ToggleComment()
    if has_key(b:, 'comment_text')
        let comment_text = b:comment_text
    else
        if &commentstring =~ '%s$'
            let comment_text = substitute(&commentstring, '%s$', '', '')
        else
            let comment_text = substitute(&commentstring, '%s', '', '')
        endif
    endif
    
    let line_text = getline('.')
    
    if line_text =~ '^' . escape(comment_text, '/*') . '\s'
        " Remove comment and following space from the beginning of the line
        execute 's/^' . escape(comment_text, '/*') . '\s//'
    else
        " Add comment at the beginning of the line with a space
        execute 's/^/' . escape(comment_text, '/*') . ' /'
    endif
endfunction

" Map leader / to toggle comments for visual and normal mode
vnoremap <leader>/ :call ToggleComment()<CR>
nnoremap <leader>/ :call ToggleComment()<CR>
