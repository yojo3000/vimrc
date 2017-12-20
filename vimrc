" if Mac: check your vim support clipboard or not
" vim --version | grep clipboard
" if it shows '-clipboard' means that you can't sync the vim and OS clipboard
" just use homebrew to install vim
" brew install vim
" use this command to check which place the vim binary located
" which vim
" if it shows: /usr/local/bin/vim (not /usr/bin/vim)
" it means you are now using a new vim which support clipboard
" check by the same command: vim --version | grep clipboard
" you will see +clipboard
" and then set clipboard=unnamed

set backspace=start,eol,indent		" let backspace in mac work fine
set number							" line number
set tabstop=4						" let one tab equal to 4 space
set softtabstop=4					" let backspace delete tab
set shiftwidth=4					" let reindent be 4 space
set encoding=utf-8					" encode
set cursorline						" underline on current line
set smartindent
"set cursorcolumn
set nocompatible 	" not compatible with vi's bull shit
set hlsearch		" highlight search result
set noswapfile		" do no create swp file
set incsearch		" hightlight text at typing searching text
set shell=/bin/bash
set nowrap			" do not wrap the long string
set mouse=a			" let mouse control enable
set clipboard=unnamed " let vim clipboard and system clipboard sync (if vim compile with clipboard enable)
set whichwrap=<,>	" cursor left end to upper line right end, vise versa
syntax on			" let vim hightlight special words

let mapleader = ","

" tagbar setting
"let g:tagbar_autoclose=1	" close tagbar when select some tag in tagbar
let g:tagbar_autofocus = 0 	" when open the tagbar, the cursor will focus on tagbar or not
let g:tagbar_compact = 1	" show the help message on top of the tag bar or not
let g:tagbar_show_linenumbers = 1	" show line number on tagbar or not
let g:tagbar_width = 25		" set tagbar width

" for window setting
autocmd VimEnter * nested :call tagbar#autoopen(1)	" auto open tagbar when using vim
autocmd VimEnter * NERDTree								" auto open NerdTree when using vim
autocmd VimEnter * wincmd p							" auto focus on this window

" for vundle init setting
filetype off						" this will open after plugin setting
set rtp+=~/.vim/bundle/Vundle.vim/	" rtp = runtime path, set to vundle's directory

" plugin list between begin and end
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'		" let Vundle to manage vim plugin
" git clone https://github.com/VundleVim/Vundle.vim.git (in ~/.vim/bundle/)

Plugin 'vim-airline/vim-airline'	" good status line below
Plugin 'scrooloose/nerdtree'		" show folder tree in vim, map <Tab> to do so
Plugin 'scrooloose/nerdcommenter'
Plugin 'morhetz/gruvbox'			" color scheme of vim

Plugin 'ap/vim-css-color'			" highlight with the color of color code in css file
Plugin 'gregsexton/MatchTag'		" highlight the same pair of html tag

Plugin 'majutsushi/tagbar'			" show code function or other info on window
" for tagbar's dependency
" in Mac OS:	brew install ctag
" in Ubuntu:	sudo apt-get install exuberant-ctags

Plugin 'kien/ctrlp.vim'				" use ctrl + p to open file easier

" other three are snipmate's dependency plugin
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

" L9 is for autocomplpop's dependency
Plugin 'L9'
Plugin 'othree/vim-autocomplpop'

Plugin 'ntpeters/vim-better-whitespace'	" mark the whitespace at the end of any line
Plugin 'terryma/vim-smooth-scroll'
call vundle#end()

filetype plugin indent on
" plugin: allow vim to load  document type plugin
" indent: allow vim set different tab size or layout type for different type of document
nnoremap <F1> <nop>					" disable the help message of <F1> butotn
nnoremap <F1> :NERDTreeToggle<CR>	" set hotkey of NerdTree
nnoremap <C-n> :bnext<CR>			" switch to the next buffer
nnoremap <C-m> :bprevious<CR>		" switch to the previous buffer
nnoremap <F9> :TagbarToggle<CR>		" set hotkey of tagbar
nnoremap <Tab> <c-w>W				" use <Tab> to switch between windows
nnoremap <F2> :StripWhitespace<CR>	" use <F2> to clean the whitespace at the end of any line

let g:smooth_scroll_duration=50
nnoremap <silent> <S-Up> :call smooth_scroll#up(&scroll/4, smooth_scroll_duration, 2)<CR>
nnoremap <silent> <S-Down> :call smooth_scroll#down(&scroll/4, smooth_scroll_duration, 2)<CR>
inoremap <silent> <S-Up> <ESC>:call smooth_scroll#up(&scroll/4, smooth_scroll_duration, 2)<CR>i
inoremap <silent> <S-Down> <ESC>:call smooth_scroll#down(&scroll/4, smooth_scroll_duration, 2)<CR>i

nnoremap <C-s> :w<CR>				" Ctrl + s to save file, keep in normal mode
inoremap <C-s> <ESC>:w<CR>i
" Ctrl + s to save file nad go back to insert mode

nnoremap <C-f> /
inoremap <C-f> <ESC>/

:command WQ wq
:command Wq wq
:command W w
:command Q q

let g:gruvbox_contrast_dark="hard"
set t_Co=256
set background=dark		" set dark theme of Plugin 'morhetz/gruvbox'

let g:airline#extensions#tabline#enabled = 1	" enable the upper buffer line

" NerdTree setting
let g:NERDTreeWinSize=25	" NerdTree width

" auto quit NerdTree when no active buffer
function! NERDTreeQuit()
	redir => buffersoutput
	silent buffers
	redir END

	let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
	let windowfound = 0

	for bline in split(buffersoutput, "\n")
		let m = matchlist(bline, pattern)

		if (len(m) > 0)
			if (m[2] =~ '..a..')
				let windowfound = 1
			endif
		endif
	endfor

	if (!windowfound)
		quitall
	endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

