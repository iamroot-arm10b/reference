"version 7.3
" 에디터 기본설정

"colorscheme blue
"colorscheme darkblue
"colorscheme default
"colorscheme delek
"colorscheme desert
"colorscheme elflord
"colorscheme evening
"colorscheme murphy
"colorscheme pablo
"colorscheme shine
"colorscheme peachpuff
"colorscheme ron
"colorscheme zellner

"colorscheme morning
"colorscheme elflord
"colorscheme desert
"colorscheme peachpuff
"colorscheme torte
"colorscheme slate
colorscheme koehler

filetype on

set backspace=start,indent
"set backspace=start,indent,eol
set autoindent          " 자동 들여쓰기
set smartindent        " 자동 들여쓰기
set cindent             " C언어 자동 들여쓰기
set cb=unnamed		" 윈도우 클립보드 사용 (register *)
set backup
set backupdir=~/.vim/backup  
set incsearch
set writebackup
set ruler               " 커서가 항상보임
set showmode
set tabstop=8
"set tabstop=4
set shiftwidth=8
set sts=8
"set expandtab           " tab을 space로 입력
set history=100         " 명령어히스토리
set showcmd             " 완성중인 명령 표시
set magic               " 매직 기능 사용
set nosol                 " 여러가지 동작시 줄의 시작으로 자동 이동
set mps+=<:>            " 괄호 짝 <> 추가
set showmatch           " 괄호 위치 표시
set diffopt+=iwhite		" vimdiff 공백 무시
set tabpagemax=20       " 탭페이지 최대값
"set cursorline          " 현재라인 강조
"set paste               " 붙여넣기시 자동들여쓰기 하지 않음
set wrap                " 자동줄바꿈
set nu                  " 행번호

"source D:\vim\vim73\mswin.vim	"윈도우 단축키로 동작
"behave mswin			"복사 붙여넣기를 윈도우 단축키로 동작

"set graphic
"set linebreak          " Don't wrap words by default 
"set textwidth=76       " 76번째 칸을 넘어가면 자동 줄바꿈
"set nowrap               " 자동 줄바꿈 안함
"set sm                 " 추가된 괄호짝 보여주는 기능
"set viminfo='20,"50    " read/write a .viminfo file, don't store more than 50 lines of registers

" 검색 기능 설정
set ignorecase          "검색시 대소문자 구별안함
set scs                 "똑똑한 대소문자 구별기능 사용
set hlsearch	        "검색어 강조기능
set nowrapscan         "검색시 파일끝에서 처음으로 되돌리기 안함

"Font 설정
set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
"set guifont=Courier

set background=dark
"set background=light   " 구문강조 기능
"win 100 60   		"가로 세로 크기조정
"set lines=60		" line 조정

" Syntax Highlighting 기능
syntax on				" Switch on syntax highlighting.

" 인코딩 관련
set fencs=ucs-bom,utf-8,cp949
"set encoding=utf-8
set fileencoding=utf-8

" 상태표시줄 
set statusline=%<[%{&ff},%{&fenc}]%y(%{strftime(\"%Y/%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})(%n)%F%m%r\ %=\ [0x%B][%v,%l/%L][%p%%]
set laststatus=2

highlight Normal guibg=black guifg=grey80
highlight Cursor gui=NONE guifg=bg guibg=lightcyan
highlight Visual gui=NONE guifg=bg guibg=lightyellow
highlight StatusLine cterm=None ctermfg=white ctermbg=blue

" 한글로 입력 될때 커서 색깔의 변경 
if has('multi_byte_ime')
 hi Cursor guibg=Blue guifg=Black
 hi CursorIM guibg=white guifg=Black
endif

"============= ctags 설정 ===============
set tags=/usr/src/linux/tags

if version >= 500
func! Sts( )
    let st = expand("<cword>")
    exe "sts ".st
endfunc
nmap ,st :call Sts( )<CR>
    
func! Tj( )
    let st = expand("<cword>")
    exe "tj ".st
endfunc
nmap ,tj :call Tj( )<CR>
endif

"============= cscope 설정 ===============
"cscope DB 위치 설정, <home/code> 변경, 절대경로 사용
if has("cscope")
	set csprg=/usr/local/bin/cscope   "cscope 위치 
	set csto=0                  "cscope DB search first
	set cst                     "cscope DB tag DB search
	set nocsverb                "verbose off
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out /usr/src/linux
	" else add database pointed to by environment
	else
		cs add /usr/src/linux/cscope.out /usr/src/linux
	endif
	set csverb                "verbose on
endif
"nmap 추가하기
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"============ Tag List 환경설정 ===============
nmap <F7> :TlistToggle<CR>
        "F7 Key = Tag List Toggling
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"        "ctags 프로그램 위치
let Tlist_Inc_Winwidth = 30          "window width change on
let Tlist_Exit_OnlyWindow = 0       "tag/file 선택 완료 시 taglist window close = off
let Tlist_Auto_Open = 0             "vim 시작시 window open = off
"let Tlist_Use_Right_Window = 0      "Tag List 위치 = 오른쪽
let Tlist_Use_Left_Window = 1      "Tag List 위치 = 왼쪽

"============ Source Explorer 환경설정 ==========
nmap <F8> :SrcExplToggle<CR>   
        "F8 Key = SrcExpl Toggling
nmap <C-H> <C-W>h               
        "왼쪽 창으로 이동
nmap <C-J> <C-W>j               
        "하단(preview)창으로 이동
nmap <C-K> <C-W>k               
        "상단 창으로 이동
nmap <C-L> <C-W>l               
        "오른쪽 창으로 이동

let g:SrcExpl_winHeight = 5         " SrcExpl 윈도우 높이 지정
let g:SrcExpl_refreshTime = 300     " refrech time = 300ms
let g:SrcExpl_jumpKey = "<ENTER>"   " 해당 definition 으로 jump
let g:SrcExpl_gobackKey = "<SPACE>" " back
let g:SrcExpl_isUpdateTags = 0      " tag file update = off

"============= NERD Tree 환경설정 =============
"let NERDTreeWinPos = "left"     "NERD Tree 위치 = 왼쪽
let NERDTreeWinPos = "right"     "NERD Tree 위치 = 오른쪽
let NERDTreeWinSize = 30
nmap <F9> :NERDTreeToggle<CR>
        "F9  Key = NERD Tree Toggling

" fold관련 Key mapping
"set foldmethod=marker
"set foldmarker={{{,}}}
map <F3> :nohlsearch<CR>
	"reset nohlsearch
map <F4> ]]v]}zf
	"{...} folding

map <F5> zM
	"close all folds
map <F6> zR
	"open all folds
"map <F7> :mkview<CR>
	"save the folds
"map <F8> :loadview<CR>		
	"load from saving folding file

map <F10> <c-w>_
	"Set current window height to highest possible
map <F11> ,tj
	"new open of ctag list
map <F12> ,st
	"split open of ctag list

map <F1> <ESC>o/*! <C-R>=strftime("%Y%m%d")<CR><CR><BS> */<ESC>O<BS> * 
	"comment script
map <F2> <ESC>o/*!<CR><BS> */<ESC>O<BS> * 
	"Edit the file whose name is under or after the cursor.

" I like highlighting strings inside C comments
"  let c_comment_strings=1

"========= man page 설정 ==============
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
"    exe "!man -S ko:2:3:4:5:6:7:8 ".sm
endfunc
nmap ,ma :call Man()<CR>

"======== CONFIG_ 설정 확인하기 =========
fu! Num2Bin(var)
        let nibble = ["0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"]
        let num=printf("%x", a:var)
        let bin=""
        let pos=0
        while num[-1:] != ""
                if pos != 0 | let bin = "," . bin | endif
                let bin = nibble[str2nr(num[-1:],16)] . bin
                let num = num[0:-2]
                let pos += 4
        endw
        return bin . " (" . pos . ")"
endfu
 
fu! CheckSymbol(var1)
        let sym = a:var1
        if sym =~# '^CONFIG_'
                let config = findfile(".config", ".;")
                if config != ""
                        let hit = 0
                        for line in readfile(config, '')
                                if line =~# sym . '\(=\| is\)'
                                        echo line
                                        let hit += 1
                                        break
                                endif
                        endfo
                        if hit == 0 | echo "# " . sym . " not found" | endif
                else
                        echo "config file not found"
                endif
        else
                if sym =~? '^\(#\|=\)\?\([0-9]\+\|0x[0-9a-f]\+\)$'
                        if sym =~ '^\(=\|#\)' | let sym = sym[1:] | endif
                        let s = sym
                        let unit = ['B', 'K', 'M', 'G', 'T', 'P', 'E', 'Z']
                        let cnt = 0
                        while s >= 1024 && (s % 1024) == 0
                                let s = s / 1024
                                let cnt += 1
                        endw
                        if s == sym
                                echo printf("D:%u H:0x%x B:%s", sym, sym, Num2Bin(sym))
                        else
                                echo printf("D:%u (%u%s) H:0x%x B:%s", sym, s, unit[cnt], sym, Num2Bin(sym))
                        endif
                endif
        endif
endfu
 
nmap <silent> <C-c> :call CheckSymbol(expand("<cword>"))<CR>

"set nohlsearch	" Switch on search pattern highlighting.

"au BufNewFile,BufReadPost *.cpp,*.cc,*.hpp source $VIM/vim73/syntax/cpp.vim
"au BufNewFile,BufReadPost *.cpp,*.cc,*.hpp set cindent
"au BufNewFile,BufReadPost *.c,*.h source $VIM/vim73/syntax/c.vim
"au BufNewFile,BufReadPost *.c,*.h set cindent
"au BufNewFile,BufReadPost *.S,*.s source $VIM/vim73/syntax/asm.vim
"au BufNewFile,BufReadPost *.S,*.s set cindent
"au BufNewFile,BufReadPost *.html,*.htm source $VIM/vim73/syntax/html.vim
"au BufNewFile,BufReadPost *.html,*.htm set smartindent
"au BufNewFile,BufReadPost *.pc,*.cp,*.auto source $VIM/vim73/syntax/esqlc.vim
"au BufNewFile,BufReadPost *.pc,*.cp,*.auto set cindent
"au BufNewFile,BufReadPost *.git/COMMIT_EDITMSG set fileencoding=UTF-8

au VimLeave * set laststatus=0

au BufNewFile,BufReadPost *.txt source $VIM/vim73/syntax/natural.vim
au BufNewFile,BufReadPost *.txt set nocindent
