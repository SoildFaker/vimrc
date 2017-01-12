set nocompatible  "It should be first line

" General {
  set background=dark   "Assume a dark background

  syntax on           "Syntax highlighting
  set mouse=a         "Automatically enable mouse usage
  set mousehide         "Hide mouse cursor while typing
  scriptencoding utf-8
  
  set cc=80           "show a refence line
  set so=999          " let the cursor always at middle screen
  "set autochdir       "Automatically change the directory
  "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |endif
  "Always switch to the current file directory

  "set autowrite             " Automatically write a file when leaving a modified buffer
  set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore       " Allow for cursor beyond last character
  set history=1000          " Store a ton of history (default is 20)
  "set spell               " Spell checking on
  set hidden              " Allow buffer switching without saving
  set iskeyword-=.          " '.' is an end of word designator
  set iskeyword-=#          " '#' is an end of word designator
  set iskeyword-=-          " '-' is an end of word designator  set encoding=utf-8  
  set winaltkeys=no " 设置 alt 键不映射到菜单栏
" }

" Lang & Encoding {
  set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
  set encoding=utf-8
  set langmenu=zh_CN
  let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }

" Vim UI {

  set laststatus=2
  colorscheme molokai     "Load a colorscheme
  set nu            "Line numbers on
  set cursorline        "Highlight current line
  set tabpagemax=15       "Only show 15 tabs
  set showmatch         "Show matching brackets/parenthesis

" }

" Formating {
  set wrap          "wrap long lines
  set softtabstop=4       "Let backspace delete indent
  set tabstop=4         "An indentation every four columns
  set shiftwidth=4      "Use indents of 4 spaces
  set expandtab         "Tabs are spaces, not tabs  
  set autoindent        "Indent at the same level of the previous line 
  set smarttab
  set smartindent       
  set nojoinspaces      "Prevents inserting two spaces after punctuation on a join
  set splitright        " Puts new vsplit windows to the right of the current
  set splitbelow        " Puts new split windows to the bottom of the current
  "set cindent
  set foldmethod=syntax     "Automatically fold
  "Close swap files
  set nobackup
  set nowb
  set noswapfile
  set t_Co=256

  if has("gui_running")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=b
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions=ac

    set guitablabel=%M\ %t
  endif
" }

" Key Mappings & Settings{
  let mapleader=","
  "Select all
  "map <c-a> ggVG
  "nnoremap 0 g0
  "vnoremap 0 g0
  "nnoremap ^ g^
  "vnoremap ^ g^
  "nnoremap $ g$
  "vnoremap $ g$
  "nnoremap j gj
  "vnoremap j gj
  "nnoremap k gk
  "vnoremap k gk
  "Ctrl+s to save
  map <c-s> :w<CR>

  " 移动分割窗口
  nmap <C-j> <C-W>j
  nmap <C-k> <C-W>k
  nmap <C-h> <C-W>h
  nmap <C-l> <C-W>l
  
  " 正常模式下 alt+j,k,h,l 调整分割窗口大小
  nnoremap <M-j> :resize +3<cr>
  nnoremap <M-k> :resize -3<cr>
  nnoremap <M-h> :vertical resize -3<cr>
  nnoremap <M-l> :vertical resize +3<cr>
  
  nnoremap <leader>tn :tabnew<cr>
  nnoremap <leader>tc :tabclose<cr>
  nnoremap <leader>th :tabp<cr>
  nnoremap <leader>tl :tabn<cr>

  nnoremap <leader>ss :source ~/.vimrc<cr>
  " 插入模式移动光标 alt + 方向键
  inoremap <M-j> <Down>

  inoremap <M-k> <Up>
  inoremap <M-h> <left>
  inoremap <M-l> <Right>
  "nmap <leader>f= :resize -3<CR>
  "nmap <leader>f- :resize +3<CR>
  "nmap <leader>f, :vertical resize +3<CR>
  "nmap <leader>f. :vertical resize -3<CR>
  "nnoremap j jzz
  "nnoremap k kzz
  "nnoremap <leader>bg :call ToggleBG()<CR>
  nmap <leader>w :w<CR>
  
  " Auto make file head
  "nmap <leader>mk :call SetTitle()<CR>
  nnoremap <leader>mt :call s:insert()<CR> 
  " IDE like delete
  inoremap <C-BS> <Esc>bdei
  
  nnoremap vv ^vg_
  " 转换当前行为大写
  inoremap <C-u> <esc>mzgUiw`za
  " 命令模式下的行首尾
  cnoremap <C-a> <home>
  cnoremap <C-e> <end>
  nnoremap <leader>bn :bn!<CR>
  nnoremap <leader>bp :bp!<CR>
  "Open NerdTree widow
  nnoremap <leader>ff :NERDTreeToggle<CR>
  "Open tagbar window
  nnoremap <leader>ft :TagbarToggle<CR>
  nnoremap <leader>fb :tabprevious<CR> 
  nnoremap <leader>fn :tabnext<CR> 
  nnoremap <F3> :NumbersToggle<CR>
  " call shell
  "nmap <leader>fs :VimShellPop<CR>
  " Open Undo Tree
  nnoremap <c-z> :UndotreeToggle<CR>
  
  "YouCompleteMe {
    "" Enter to select
    "inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
    ""上下左右键的行为 会显示其他信息
    "inoremap <expr> <Down>   pumvisible() ? "\<C-n>" : "\<Down>"
    "inoremap <expr> <Up>     pumvisible() ? "\<C-p>" : "\<Up>"
    "inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    "inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
    "nnoremap <F8> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
    ""nnoremap <leader>lo :lopen<CR>	"open locationlist
    ""nnoremap <leader>lc :lclose<CR>	"close locationlist
    "inoremap <leader><leader> <C-x><C-o>
    "nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  "" }

  " IndentGuides {
    "this help you see indent clearly 
    nmap <silent> <Leader>ig :IndentLinesToggle<cr>
  " }

  " easymotion {
    " Search File
    nmap  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    " go next match
    nmap  n <Plug>(easymotion-next)
    " go previous match
    nmap  N <Plug>(easymotion-prev)
    " Search 2 chars
    nmap s <Plug>(easymotion-s2)
    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
  " }

  " Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  " }

  
" }

" Plugin{
  
  " VimShell {
    let g:vimshell_environment_term="zsh"
    let g:vimshell_split_command="nicely" 
  " }

  " FastFold{
    let g:tex_fold_enabled=1
    let g:vimsyn_folding='af'
    let g:xml_syntax_folding = 1
    let g:php_folding = 1
    let g:perl_fold = 1
  " }
  
  " NerdTree {
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  " }

  " easymotion {
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    " Turn on case insensitive feature
    let g:EasyMotion_smartcase = 1

  " }
  
  " Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_ignore_files=[".*\.py$",".*\.tex$",".*\.s$"]
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
  " }
  
  " Ultisnips {
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-enter>"
    let g:UltiSnipsJumpForwardTrigger="<m-n>"
    let g:UltiSnipsJumpBackwardTrigger="<m-b>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
  " }
  
  " UndoTree {
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
    if has("persistent_undo")
      set undodir='~/.undodir/'
      set undofile
    endif
  " }

  " Ctrlp {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_show_hidden=1
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
  " }

  " ariline {
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled = 1
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

  " }
  
  " indent guides {
    "let g:indent_guides_guide_size=1
  " }
  

  " indent line {
    let g:indentLine_color_term = 239
    let g:indentLine_conceallevel = 2
    let g:indentLine_enabled = 1
    let g:indentLine_char = '┊'
    let g:indentLine_color_gui = '#A4E57E'
  " }

  " Tabularize {
  " }
  
"  " YouCompleteMe {
    "" 自动补全配置
    "set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    "autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口

    ""let g:ycm_key_list_select_completion = ['<Down>']
    ""let g:ycm_key_list_previous_completion = ['<Up>']
    "let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

    "let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
    "let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
    "let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
    "let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
    ""在注释输入中也能补全
    "let g:ycm_complete_in_comments = 1
    ""在字符串输入中也能补全
    "let g:ycm_complete_in_strings = 1
    ""注释和字符串中的文字也会被收入补全
    "let g:ycm_collect_identifiers_from_comments_and_strings = 0


   ""}

   " numbers {
    let g:enable_numbers = 0
   " }

   " Neocomplete{
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    
    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
    
    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    
    " Plugin key-mappings.
    inoremap <expr><C-g>   neocomplete#undo_completion()
    inoremap <expr><C-l>   neocomplete#complete_common_string()
    
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1
    
    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
    
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    
    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    
    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
   " }

  " vim-latex{
    set grepprg=grep\ -nH\ $*
    let g:tex_flavor='xelatex'
    set iskeyword+=:
    "autocmd BufEnter*.tex
    "set sw=0
  
  " }
  
  " Vundle {
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    "Plugin 'vim-scripts/header.vim'
    "Plugin 'Valloric/YouCompleteMe'
    "Plugin 'bling/vim-airline'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'myusuf3/numbers.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'godlygeek/tabular'
    Plugin 'SirVer/ultisnips'
    Plugin 'mbbill/undotree'
    Plugin 'honza/vim-snippets'
    "Plugin 'kristijanhusak/vim-multiple-cursors'
    Plugin 'vim-latex/vim-latex'
    Plugin 'tpope/vim-surround'
    "Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'Yggdroot/indentLine'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/syntastic'
    Plugin 'Konfekt/FastFold'
    "Plugin 'vim-scripts/Vim-R-plugin'
    Plugin 'davidhalter/jedi-vim'
    "Plugin 'Shougo/vimshell.vim'
    Plugin 'Shougo/neocomplete.vim'
    "Plugin 'Shougo/vimproc'
    "Plugin 'altercation/vim-colors-solarized'
    Plugin 'jiangmiao/auto-pairs'

    call vundle#end()
    filetype plugin indent on
  "}
" }

" Command {
  let g:input_toggle=1

  " Switch IME mode to ENGLISH
  function! Fcitx2en()
    let s:input_status=system("fcitx-remote")
    if s:input_status==2
    let g:input_toggle=1
    let l:a=system("fcitx-remote -c")
    endif
  endfunction

  " Switch IME mode to CHINESE
  function! Fcitx2zh()
    let s:input_status=system("fcitx-remote")
    if s:input_status!=2&&g:input_toggle==1
    let l:a=system("fcitx-remote -o")
    let g:input_toggle=0
    endif
  endfunction

  set timeoutlen=1500
  autocmd InsertLeave * call Fcitx2en()

  " Allow to trigger background
  "function! ToggleBG()
  "  let s:tbg = &background
    "" Inversion
    "if s:tbg == "dark"
      "set background=light
    "else
      "set background=dark
    "endif
  "endfunction
" }
" Code Assist {
  "auto insert fileheader when codefile was created.
  "autocmd BufNewFile *.cpp,*.[ch],*.sh,*rb,*.py exec ":call SetTitle()" 
" }

