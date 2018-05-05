
 
 set nocompatible              " be iMproved, required
 filetype off                  " required
 
 " set the runtime path to include Vundle and initialize
 call plug#begin('~/.local/share/nvim/plugged')
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
 
 " let Vundle manage Vundle, required
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 "
 Plug 'tpope/vim-fugitive'
 " Git plugin not hosted on GitHub
 "Plug 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 " for HTML editing
 Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 "Plugin 'ascenator/L9', {'name': 'newL9'}
 
 Plug 'tmhedberg/SimpylFold'
 
 "For Android development
 
 Plug 'DonnieWest/VimStudio'
       
 Plug 'slashmili/alchemist.vim'
 Plug 'elixir-editors/vim-elixir'
                       
 Plug 'vim-scripts/Conque-GDB'
 Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
 Plug 'zchee/deoplete-clang'
 Plug 'Shougo/neoinclude.vim'
 Plug 'artur-shaik/vim-javacomplete2'
 Plug 'vim-latex/vim-latex'
 Plug 'xuhdev/vim-latex-live-preview'
                               
 Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 Plug 'neovim/node-host', { 'do': 'npm install' }
                                                  
 "
  function! BuildComposer(info)
   if a:info.status != 'unchanged' || a:info.force
     if has('nvim')
       !cargo build --release
     else
       !cargo build --release --no-default-features --features json-rpc
     endif
   endif
 endfunction
 Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
 Plug 'dylanaraps/wal'
 Plug 'donRaphaco/neotex', { 'for': 'tex' }
 Plug 'sbdchd/neoformat'
 Plug 'Shougo/unite.vim'
 Plug 'Shougo/vimfiler.vim'
 
 Plug 'tpope/vim-obsession'
 Plug 'vim-scripts/screen.vim'
 
 Plug 'jalvesaq/Nvim-R'
 Plug 'rakr/vim-one'
 
 Plug 'rafi/awesome-vim-colorschemes'
 
 Plug 'scrooloose/nerdtree'
 
 
 " All of your Plugins must be added before the following line
 call plug#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
 
 " All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
 " the call to :runtime you can find below.  If you wish to change any of those
 " settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
 " will be overwritten everytime an upgrade of the vim packages is performed.
 " It is recommended to make changes after sourcing debian.vim since it alters
 " the value of the 'compatible' option.
 
 " This line should not be removed as it ensures that various options are
 " properly set to work with the Vim-related packages available in Debian.
 
 " Uncomment the next line to make Vim more Vi-compatible
 " NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
 " options, so any other options should be set AFTER setting 'compatible'.
 "set compatible
 
 " Vim5 and later versions support syntax highlighting. Uncommenting the next
 " line enables syntax highlighting by default.
 syntax on
 
 "colorscheme wal
 "copy from external clipboard
 set clipboard=unnamedplus
 set nu
 set backspace=indent,eol,start
 set foldmethod=indent
 set foldlevel=99
 
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>
 
 nnoremap <space> za
 
                                  
 function! WordCount()
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
      let s:word_count = str2nr(split(v:statusmsg)[11])
      let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count 
 endfunction                    
 
 au BufNewFile,BufRead *.py
     \ set tabstop=4
     \ set softtabstop=4
     \ set shiftwidth=4
     \ set textwidth=79
     \ set expandtab
     \ set autoindent
     \ set fileformat=unix
 let g:python_host_prog = '/bin/python2'
 let g:ale_completion_enabled = 1
 let g:ale_linters_explicit = 0
 let g:ale_cache_executable_check_failures = 0
 let python_highlight_all=1
 " YouCompleteMe options
 "
 
 let g:tex_flavor='latex'
 let g:deoplete#enable_at_startup = 1
 
 let g:deoplete#omni_patterns = {}
 let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
 let g:deoplete#sources = {}
 let g:deoplete#sources._ = []
 let g:deoplete#file#enable_buffer_path = 1
 
 set grepprg=grep\ -nH\ $*
 
 let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
 let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
 let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 
 """""""""""""""""""""""""
 """"  Java Complete  """"
 """""""""""""""""""""""""
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType java let  g:deoplete#disable_auto_complete =1

 " To open R in terminal rather than RGui (only necessary on OS X)
 " let vimrplugin_applescript = 0
 " let vimrplugin_screenplugin = 0
 " For tmux support
 let g:ScreenImpl = 'Tmux'
 let vimrplugin_screenvsplit = 1 " For vertical tmux split
 let g:ScreenShellInitialFocus = 'shell' 
 " instruct to use your own .screenrc file
 let g:vimrplugin_noscreenrc = 1
 " For integration of r-plugin with screen.vim
 let g:vimrplugin_screenplugin = 1
 " Don't use conque shell if installed
 let vimrplugin_conqueplugin = 0
 " map the letter 'r' to send visually selected lines to R 
 let g:vimrplugin_map_r = 1
 " see R documentation in a Vim buffer
 let vimrplugin_vimpager = "no"
 
 let g:android_sdk_path = "/opt/android-sdk/"
 
 "set expandtab
 set shiftwidth=4
 set tabstop=8
 
 
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 map <C-n> :NERDTreeToggle<CR>
 
 
 colorscheme gotham256
  
 
 let g:alchemist_iex_term_size = 15
 
 highlight ColorColumn ctermbg=DarkBlue
 map <A-d> :set colorcolumn=81 textwidth=81
 map <A-e> :set statusline=wc:%{WordCount()} <CR>
 map <A-m> : setlocal spell! spelllang=en_us <CR>
 let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
 let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
 
                                           
 
 "will put icons in Vim's gutter on lines that have a diagnostic set.
 "Turning this off will also turn off the YcmErrorLine and YcmWarningLine
 "highlighting
 " If using a dark background within the editing area and syntax highlighting
 " turn on this option as well
 "set background=dark
 
 " Uncomment the following to have Vim jump to the last position when
 " reopening a file
 "if has("autocmd")
 "  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 "endif
 
 " Uncomment the following to have Vim load indentation rules and plugins
 " according to the detected filetype.
 "if has("autocmd")
 "  filetype plugin indent on
 "endif
 
 " The following are commented out as they cause vim to behave a lot
 " differently from regular Vi. They are highly recommended though.
 "set showcmd		" Show (partial) command in status line.
 "set showmatch		" Show matching brackets.
 "set ignorecase		" Do case insensitive matching
 "set smartcase		" Do smart case matching
 "set incsearch		" Incremental search
 "set autowrite		" Automatically save before commands like :next and :make
 "set hidden		" Hide buffers when they are abandoned
 "set mouse=a		" Enable mouse usage (all modes)
 
 " Source a global configuration file if available
 if filereadable("/etc/vim/vimrc.local")
   source /etc/vim/vimrc.local
 
 
 endif
 packloadall
 silent! helptags ALL
