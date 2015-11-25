set nocompatible  "It should be first line

" General {
    cd ~/Documents/code/    " My workpath
    set background=dark     "Assume a dark background

    syntax on                   "Syntax highlighting
    set mouse=a                 "Automatically enable mouse usage
    set mousehide               "Hide mouse cursor while typing
    scriptencoding utf-8
    
    set cc=80                   "show a refence line
    set autochdir           "Automatically change the directory
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |endif
    "Always switch to the current file directory

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    "set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator  set encoding=utf-8  
" }

" Vim UI {

    set laststatus=2
    colorscheme molokai         "Load a colorscheme
    set nu                      "Line numbers on
    set cursorline              "Highlight current line
    set tabpagemax=15           "Only show 15 tabs
    set showmatch               "Show matching brackets/parenthesis

" }

" Formating {
    set wrap                    "wrap long lines
    set softtabstop=2           "Let backspace delete indent
    set tabstop=2               "An indentation every four columns
    set shiftwidth=2            "Use indents of 4 spaces
    set expandtab               "Tabs are spaces, not tabs  
    set autoindent              "Indent at the same level of the previous line 
    set nojoinspaces            "Prevents inserting two spaces after punctuation on a join
    set splitright              " Puts new vsplit windows to the right of the current
    set splitbelow              " Puts new split windows to the bottom of the current
    set cindent
    set foldmethod=syntax       "Automatically fold
    "Close swap files
    set nobackup
    set nowb
    set noswapfile
    set t_Co=256

    if has("gui_running")
        set guioptions-=T
        "隐藏`滚动条
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r

        set guitablabel=%M\ %t
    endif
" }

" Key Mappings {
    let mapleader=","
    "Select all
    map <c-a> ggVG
    "Switch the buffer
    nmap <c-TAB> :bn!<CR>
    nmap <s-TAB> :bp!<CR>
    "Open NerdTree window
    nmap <F2> :NERDTreeToggle<CR>
    "Open tagbar window
    nmap <F3> :TagbarToggle<CR>
    "Ctrl+s to save
    map <c-s> :w<CR>
    nmap <F6> :tabprevious<CR> 
    nmap <F7> :tabnext<CR> 
    nmap w= :resize -3<CR>
    nmap w- :resize +3<CR>
    nmap w, :vertical resize +3<CR>
    nmap w. :vertical resize -3<CR>
" }

" Command {
    let g:input_toggle=1

    function! Fcitx2en()
      let s:input_status=system("fcitx-remote")
      if s:input_status==2
        let g:input_toggle=1
        let l:a=system("fcitx-remote -c")
      endif
    endfunction

    function! Fcitx2zh()
      let s:input_status=system("fcitx-remote")
      if s:input_status!=2&&g:input_toggle==1
        let l:a=system("fcitx-remote -o")
        let g:input_toggle=0
      endif
    endfunction

    set timeoutlen=150
    autocmd InsertLeave * call Fcitx2en()
" }

" Plugin{

    " NerdTree {
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
    " }

    " easymotion {
        let g:EasyMotion_do_mapping = 0 " Disable default mappings
        nmap  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)
        nmap  n <Plug>(easymotion-next)
        nmap  N <Plug>(easymotion-prev)
        nmap s <Plug>(easymotion-s2)
        " Turn on case insensitive feature
        let g:EasyMotion_smartcase = 1

        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)

    " }
    
    " Syntastic {
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_ignore_files=[".*\.py$"]
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " }
    
    " Ultisnips {
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<F4>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-b>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"
    " }
    
    " UndoTree {
        nnoremap <c-z> :UndotreeToggle<CR>
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
        let g:indent_guides_guide_size=1
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
    
    " YouCompleteMe {
        " 自动补全配置
        set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
        "上下左右键的行为 会显示其他信息
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
        inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

        "youcompleteme  默认tab  s-tab 和自动补全冲突
        "let g:ycm_key_list_select_completion = ['<Down>']
        "let g:ycm_key_list_previous_completion = ['<Up>']
        let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

        let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
        let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
        let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
        let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
        nnoremap <F8> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
        "nnoremap <leader>lo :lopen<CR>	"open locationlist
        "nnoremap <leader>lc :lclose<CR>	"close locationlist
        inoremap <leader><leader> <C-x><C-o>
        "在注释输入中也能补全
        let g:ycm_complete_in_comments = 1
        "在字符串输入中也能补全
        let g:ycm_complete_in_strings = 1
        "注释和字符串中的文字也会被收入补全
        let g:ycm_collect_identifiers_from_comments_and_strings = 0

        nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

     "}

    " vim-latex{
        set grepprg=grep\ -nH\ $*
        let g:tex_flavor='latex'
        set iskeyword+=:
        "autocmd BufEnter*.tex
        set sw =2
    
    " }
    
    " Vundle {
        filetype off

        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        Plugin 'VundleVim/Vundle.vim'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'bling/vim-airline'
        Plugin 'kien/ctrlp.vim'
        Plugin 'majutsushi/tagbar'
        Plugin 'scrooloose/nerdtree'
        Plugin 'tomtom/tlib_vim'
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'easymotion/vim-easymotion'
        Plugin 'godlygeek/tabular'
        Plugin 'SirVer/ultisnips'
        Plugin 'mbbill/undotree'
        Plugin 'honza/vim-snippets'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'vim-latex/vim-latex'
        Plugin 'tpope/vim-surround'
        Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/syntastic'

        call vundle#end()
        filetype plugin indent on
    "}
" }
