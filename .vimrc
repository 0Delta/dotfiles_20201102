set encoding=utf-8
scriptencoding utf-8
set cedit=<C-c>

" dein{{{
" dein初期設定{{{
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/plugins')
" dein.vim 本体
let s:dein_repo_dir = expand('~/.vim/dein.vim')

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
"}}}

" dein-add{{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
"  let s:go = g:rc_dir . '/go.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
"  call dein#load_toml(s:go, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif
"}}}

" dein後処理{{{
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"}}}
"}}}

" 折りたたみ機能を追加{{{
function! s:switchFoldMax() abort
  if exists('&foldnestmax')
    if &foldnestmax != 1 
      echo "Set FoldMax to 1"
      setlocal foldnestmax=1
    else
      echo "Set FoldMax to 20"
      setlocal foldnestmax=20
    endif
  endif
endfunc
nnoremap zz :<C-u>call <SID>switchFoldMax()<CR>

augroup fo
  au FileType vim setlocal foldmethod=marker
  au FileType toml setlocal foldmethod=marker
  au FileType c setlocal foldmethod=syntax
  au FileType cpp setlocal foldmethod=syntax
  au FileType python setlocal foldmethod=syntax
  au FileType go setlocal foldmethod=syntax
  au FileType go setlocal foldnestmax=1
  au FileType ruby setlocal foldmethod=syntax
  au FileType review setlocal foldmethod=expr
augroup END

"}}}

" keymap(vim){{{
" 上下移動は位置を保持するように
noremap j gj
noremap k gk

" Shift+移動キーで終端まで移動できるように
noremap <S-h>   b
noremap <S-l>   w
noremap <S-j>   }
noremap <S-k>   {

" Option+移動キーで移動できるように(不安定/Mac専用)
" noremap <D-h>   ^
" noremap <D-l>   $

" Ctrl+移動キーで移動できるように
noremap <C-h>   ^
noremap <C-l>   $
" noremap <C-j>   }
" noremap <C-k>   {

" (shift)Tab でインデント
nnoremap <Tab>  >>
nnoremap <S-Tab> <<
vnoremap <Tab>  >>
vnoremap <S-Tab> <<

" BS無効化(C-hで可能)
inoremap <BS>  <Nop>
" typo抑制
inoremap <C-k>  <Nop>
inoremap <C-l>  <Nop>

" 保存コマンド無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" jj か lll でInsertモードを解除できるように
inoremap <silent> jj <ESC>
inoremap <silent> llll <ESC>

" フォーマット + exMode無効化
nnoremap Q gq

" redoをS-uへ変更
nnoremap U <C-r>

" Sキーを無効化
nnoremap s <Nop>
nnoremap S <Nop>

" ペインの分割
nnoremap s" :<C-u>sp<CR>
nnoremap s% :<C-u>vs<CR>

" ペインの切り替えとサイズ変更
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>+
nnoremap sK <C-w>-
nnoremap sL <C-w>>
nnoremap sH <C-w><

" タブ切り替えキー変更
nnoremap Sl gT
nnoremap Sh gt

" レコーディングモードの一部無効化
nnoremap qH <Nop>
nnoremap qJ <Nop>
nnoremap qK <Nop>
nnoremap qL <Nop>
nnoremap qQ <Nop>

nnoremap qh <Nop>
nnoremap qj <Nop>
nnoremap qk <Nop>
nnoremap ql <Nop>
nnoremap qq <Nop>

" S-J(改行削除)の再配置
noremap <S-d> J

" ノーマルモードでコロンとセミコロンを同一視する
nmap ; :

" ROモード上書き防止
augroup NoWrite
  au!
    au BufWrite * if &ro | throw 'それをかきかえるだなんてとんでもない！' | endif
augroup END

" tabや改行の可視化
nnoremap m :set list!<CR>:set cursorcolumn!<CR>
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" ! でターミナルモードへ
nnoremap <silent> ! :bo terminal <CR>

"}}}

" vim-switch-setting{{{

filetype plugin indent on

" マウスの有効化
set mouse=a
set ttymouse=xterm2

" 行番号を表示
set relativenumber
set number

" ルーラーを表示
set ruler

" 入力中のコマンドをステータスに表示する
set showcmd

" 括弧入力時の対応する括弧を表示
set showmatch

" シンタックスハイライトを有効にする
syntax enable

" 検索結果文字列のハイライトを有効にする
set hlsearch

" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅(勝手に改行される)を無効にする
set textwidth=0

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" タイプライタースクロールモード
set scrolloff=9999

" カーソル行の背景色を変更
set cursorline

" タブの代わりに空白文字を挿入する
set expandtab

" タブ文字の表示幅
set tabstop=4
set shiftwidth=4

" 一部のファイルでのタブ設定上書き
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.htm setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead .vimrc setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  autocmd BufNewFile,BufRead *.re setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" skkが動作しなくなるのでペースト無効化
set nopaste

" カレントディレクトリのvimrcを読み込む
if (!exists('s:dir'))
  let s:dir = getcwd()
  let s:ans = findfile(".vimrc", fnameescape(s:dir) . ";")

  if len(s:ans) > 1
    let s:rc = fnamemodify(s:ans, ":p:h") . "/.vimrc"
    call feedkeys(":source".s:rc."\<cr>")
  endif
endif

" ハイライトを消す
noh
"}}}

" 色とステータスラインの設定 {{{
" ステータスラインを表示
set laststatus=2

" 検索結果の色を修正
" hi Search gui=bold ctermbg=lightyellow ctermfg=black " Modefi

" ステータスラインの基礎色
hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
hi StatusLineNC term=NONE cterm=NONE ctermbg=black ctermfg=gray ctermbg=white
" カーソルラインの基礎色
hi CursorLineNr gui=bold ctermbg=blue ctermfg=white
" 見にくい色を修正
" hi Search term=reverse ctermbg=11 guibg=Yellow ctermfg=black
" hi Visual gui=reverse ctermbg=7 guibg=LightGray ctermfg=black
" hi SpellBad gui=reverse ctermbg=224 gui=undercurl guisp=Red ctermfg=black
" hi DiffChange term=bold ctermbg=225 guibg=LightMagenta ctermfg=black
" hi SpellRare term=reverse ctermbg=225 gui=undercurl guisp=Magenta ctermfg=black
" hi ColorColumn term=reverse ctermbg=224 guibg=LightRed ctermfg=black

" 各項目の色
hi User1 gui=bold ctermbg=blue ctermfg=white        " Mode (後で上書きされる)
hi User2 gui=bold ctermbg=yellow ctermfg=black      " Modefi
hi User3 gui=bold ctermbg=darkred ctermfg=white     " ReadOnly
hi User4 gui=bold ctermbg=magenta ctermfg=white     " GitBranch
hi User5 gui=bold ctermbg=gray ctermfg=white        " Mode (後で上書きされる)

" Gitのブランチ取得用{{{
function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').")"
    endif
  endif
endfunction
augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
"}}}

" ステータスラインの変化用{{{
function! StatuslineModeDi()
  if win_getid()!=g:actual_curwin
    return "-DEACTIVE-"
  else
    return ""
  endif
  redraw
endfunction

function! StatuslineMode()
  let l:mode=mode()
  if win_getid()!=g:actual_curwin
    return ""
  elseif l:mode==#"n"
    hi User1 gui=bold ctermbg=blue ctermfg=white
    hi CursorLineNr gui=bold ctermbg=blue ctermfg=white
    return "[NORMAL]"
  elseif l:mode==?"v"
    hi User1 gui=bold ctermbg=green ctermfg=white
    hi CursorLineNr gui=bold ctermbg=green ctermfg=white
    return "[VISUAL]"
  elseif l:mode==#"i"
    hi User1 gui=bold ctermbg=red ctermfg=white
    hi CursorLineNr gui=bold ctermbg=red ctermfg=white
    return "[INSERT]"
  elseif l:mode==#"R"
    hi User1 gui=bold ctermbg=darkred ctermfg=black
    hi CursorLineNr gui=bold ctermbg=darkred ctermfg=black
    return "[REPLACE]"
  elseif l:mode==?"s"
    hi User1 gui=bold ctermbg=blue ctermfg=white
    hi CursorLineNr gui=bold ctermbg=blue ctermfg=white
    return "[SELECT]"
  elseif l:mode==#"t"
    hi User1 gui=bold ctermbg=lightgreen ctermfg=black
    hi CursorLineNr gui=bold ctermbg=lightgreen ctermfg=black
    return "[TERMINAL]"
  elseif l:mode==#"c"
    hi User1 gui=bold ctermbg=yellow ctermfg=black
    hi CursorLineNr gui=bold ctermbg=lightgreen ctermfg=black
    return "[COMMAND]"
  elseif l:mode==#"!"
    hi User1 gui=bold ctermbg=yellow ctermfg=black
    hi CursorLineNr gui=bold ctermbg=lightgreen ctermfg=black
    return "[SHELL]"
  endif
  redraw
endfunction
"}}}

" ステータスライン{{{
set statusline=
set statusline+=%5*\%{StatuslineModeDi()}
set statusline+=%1*\%{StatuslineMode()}
set statusline+=%0*\ %f\ 
set statusline+=%2*\%m
set statusline+=%3*\%r
set statusline+=%3*\%h
set statusline+=%0*\ 
set statusline+=%4*\%{get(b:,'gitbranch','')}
set statusline+=%0*\%=
set statusline+=%{strlen(&fenc)?&fenc:'none'}\ \|\ 
set statusline+=%l\/%L(%P)
"}}}

" 背景透過{{{
augroup TransparentBG
  autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	" autocmd Colorscheme * highlight LineNr ctermbg=none
	" autocmd Colorscheme * highlight Folded ctermbg=none
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
augroup END
"}}}

" 定期的に画面再描画{{{
  autocmd CursorHold * redraw!
"}}}
"}}}

" indent移動 {{{
function! s:same_indent(dir) abort
  let lnum = line('.')
  let width = col('.') <= 1 ? 0 : strdisplaywidth(matchstr(getline(lnum)[: col('.')-2], '^\s*'))
  while 1 <= lnum && lnum <= line('$')
    let lnum += (a:dir ==# '+' ? 1 : -1)
    let line = getline(lnum)
    if width >= strdisplaywidth(matchstr(line, '^\s*')) && line =~# '^\s*\S'
      break
    endif
  endwhile
  return abs(line('.') - lnum) . a:dir
endfunction
nnoremap <expr><silent> aj <SID>same_indent('+')
nnoremap <expr><silent> ak <SID>same_indent('-')
onoremap <expr><silent> aj <SID>same_indent('+')
onoremap <expr><silent> ak <SID>same_indent('-')
xnoremap <expr><silent> aj <SID>same_indent('+')
xnoremap <expr><silent> ak <SID>same_indent('-')
"}}}

" quickfix ウィンドウのみの場合に自動で閉じる{{{
augroup QfAutoCommands
  autocmd!
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END
"}}}

" コピー設定{{{
set clipboard=unnamedplus
if executable("win32yank.exe")
    vnoremap <silent>"*y :w !win32yank.exe -i<CR><CR>
    nnoremap <silent>"*p :r !win32yank.exe -o<CR>
    vnoremap <silent>"*p :r !win32yank.exe -o<CR>
endif
"}}}

" foldの設定を保存する {{{
" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options
"}}}

