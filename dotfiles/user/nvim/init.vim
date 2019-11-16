" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

let mapleader = ","

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
filetype off                  " required

let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vim
" adapted from: https://gist.github.com/yostos/312419b7829ee91610426194272c8f56
function! s:InitDein()
  let s:config_dir = $HOME . "/.config/nvim"
  let s:share_dir = $HOME . "/.local/share"
  if has("vim_starting")
    if ! isdirectory(s:share_dir)
      call system("mkdir -p " . s:share_dir)
    endif
  endif

  " Set dein paths
  let s:dein_dir = s:share_dir . "/dein"
  let s:dein_github = s:dein_dir . "/repos/github.com"
  let s:dein_repo_name = "Shougo/dein.vim"
  let s:dein_repo_dir = s:dein_github . "/" . s:dein_repo_name

  " Check if dein has been installed
  if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed, installing now"
    let s:dein_repo = "https://github.com/" . s:dein_repo_name
    let s:git_clone_cmd = "git clone " . s:dein_repo . " " . s:dein_repo_dir
    echo s:git_clone_cmd
    call system(s:git_clone_cmd)
  endif
  let &runtimepath = &runtimepath . "," . s:dein_repo_dir

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml = s:config_dir . "/dein.toml"
    " let s:lazy_toml = s:config_dir . "/dein_lazy.toml"
    call dein#load_toml(s:toml, {"lazy": 0})
    :
    call dein#end()
    call dein#save_state()
  endif

  if dein#check_install()
    call dein#install()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitDein()

set timeout
set timeoutlen=750
set ttimeoutlen=250

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
    set timeout
    set ttimeoutlen=0
endif


" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" no line wrapping
set nowrap

set grepprg=grep\ -nH\ $*

" 256 color
"set t_Co=256

" set terminal colours
let s:num = 0
for s:color in [
        \ '#6c6c6c', '#ff6666', '#66ff66', '#ffd30a',
        \ '#1e95fd', '#ff13ff', '#1bc8c8', '#c0c0c0',
        \ '#383838', '#ff4444', '#44ff44', '#ffb30a',
        \ '#6699ff', '#f820ff', '#4ae2e2', '#ffffff',
        \ ]
    let g:terminal_color_{s:num} = s:color
    let s:num += 1
endfor


" Use cursor shape feature
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Use true color feature
"let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

" Enable syntax highlighting
syntax on

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
" set confirm
" NOTE: I highly recommend against setting this.  Sure it's convenient.  It's
" also dangerous.

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" set pastetoggle=<F11>    " NO LONGER NECESSARY IN NEOVIM


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using spaces instead of tabs.
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Automatically add closing brackets/quotes in insert mode.
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>


"------------------------------------------------------------

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

au BufNewFile,BufRead Tupfile,*.tup setf tup
au BufNewFile,BufRead *.h setf c

" deoplete
let g:deoplete#enable_at_startup = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd CompleteDone * pclose!

map <C-p> :FuzzyOpen<CR>

augroup Terminal
  autocmd!
  autocmd TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

if executable('hw')
    " Use hw (highway)
    " https://github.com/tkengo/highway
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor ' .
                \ '--nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore' .
                \ ' ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt (the platinum searcher)
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack
    " http://beyondgrep.com/
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading' .
                \ ' --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " Use jvgrep
    " https://github.com/mattn/jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts =
                \ '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
elseif executable('beagrep')
    " Use beagrep
    " https://github.com/baohaojun/beagrep
    let g:unite_source_grep_command = 'beagrep'
endif

"" neomake java
"call neomake#configure#automake('nw', 750)
"let g:neomake_open_list = 2
"
""function! SetupJava()
""  " let l:path=system("echo -n \"$CLASSPATH:$(git rev-parse --show-toplevel)\"")
""  let l:path=system("echo -n \"$CLASSPATH:$(pwd)\"")
""  echom l:path
""  let g:neomake_java_javac_args = ['-cp', l:path.'/src/main/']
""endfunction
""
""au Filetype java call SetupJava()
"let g:neomake_java_enabled_makers = ['gradle']
"
"autocmd Filetype java call neomake#configure#automake('w')
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

let c_syntax_for_h = 1

au BufNewFile,BufRead SConstruct set filetype=python

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"

