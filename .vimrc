"version 7.3
" ������ �⺻����

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
set autoindent          " �ڵ� �鿩����
set smartindent        " �ڵ� �鿩����
set cindent             " C��� �ڵ� �鿩����
set cb=unnamed		" ������ Ŭ������ ��� (register *)
set backup
set backupdir=~/.vim/backup  
set incsearch
set writebackup
set ruler               " Ŀ���� �׻���
set showmode
set tabstop=8
"set tabstop=4
set shiftwidth=8
set sts=8
"set expandtab           " tab�� space�� �Է�
set history=100         " ��ɾ������丮
set showcmd             " �ϼ����� ��� ǥ��
set magic               " ���� ��� ���
set nosol                 " �������� ���۽� ���� �������� �ڵ� �̵�
set mps+=<:>            " ��ȣ ¦ <> �߰�
set showmatch           " ��ȣ ��ġ ǥ��
set diffopt+=iwhite		" vimdiff ���� ����
set tabpagemax=20       " �������� �ִ밪
"set cursorline          " ������� ����
"set paste               " �ٿ��ֱ�� �ڵ��鿩���� ���� ����
set wrap                " �ڵ��ٹٲ�
set nu                  " ���ȣ

"source D:\vim\vim73\mswin.vim	"������ ����Ű�� ����
"behave mswin			"���� �ٿ��ֱ⸦ ������ ����Ű�� ����

"set graphic
"set linebreak          " Don't wrap words by default 
"set textwidth=76       " 76��° ĭ�� �Ѿ�� �ڵ� �ٹٲ�
"set nowrap               " �ڵ� �ٹٲ� ����
"set sm                 " �߰��� ��ȣ¦ �����ִ� ���
"set viminfo='20,"50    " read/write a .viminfo file, don't store more than 50 lines of registers

" �˻� ��� ����
set ignorecase          "�˻��� ��ҹ��� ��������
set scs                 "�ȶ��� ��ҹ��� ������� ���
set hlsearch	        "�˻��� �������
set nowrapscan         "�˻��� ���ϳ����� ó������ �ǵ����� ����

"Font ����
set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
"set guifont=Courier

set background=dark
"set background=light   " �������� ���
"win 100 60   		"���� ���� ũ������
"set lines=60		" line ����

" Syntax Highlighting ���
syntax on				" Switch on syntax highlighting.

" ���ڵ� ����
set fencs=ucs-bom,utf-8,cp949
"set encoding=utf-8
set fileencoding=utf-8

" ����ǥ���� 
set statusline=%<[%{&ff},%{&fenc}]%y(%{strftime(\"%Y/%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})(%n)%F%m%r\ %=\ [0x%B][%v,%l/%L][%p%%]
set laststatus=2

highlight Normal guibg=black guifg=grey80
highlight Cursor gui=NONE guifg=bg guibg=lightcyan
highlight Visual gui=NONE guifg=bg guibg=lightyellow
highlight StatusLine cterm=None ctermfg=white ctermbg=blue

" �ѱ۷� �Է� �ɶ� Ŀ�� ������ ���� 
if has('multi_byte_ime')
 hi Cursor guibg=Blue guifg=Black
 hi CursorIM guibg=white guifg=Black
endif

"============= ctags ���� ===============
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

"============= cscope ���� ===============
"cscope DB ��ġ ����, <home/code> ����, ������ ���
if has("cscope")
	set csprg=/usr/local/bin/cscope   "cscope ��ġ 
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
"nmap �߰��ϱ�
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"============ Tag List ȯ�漳�� ===============
nmap <F7> :TlistToggle<CR>
        "F7 Key = Tag List Toggling
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"        "ctags ���α׷� ��ġ
let Tlist_Inc_Winwidth = 30          "window width change on
let Tlist_Exit_OnlyWindow = 0       "tag/file ���� �Ϸ� �� taglist window close = off
let Tlist_Auto_Open = 0             "vim ���۽� window open = off
"let Tlist_Use_Right_Window = 0      "Tag List ��ġ = ������
let Tlist_Use_Left_Window = 1      "Tag List ��ġ = ����

"============ Source Explorer ȯ�漳�� ==========
nmap <F8> :SrcExplToggle<CR>   
        "F8 Key = SrcExpl Toggling
nmap <C-H> <C-W>h               
        "���� â���� �̵�
nmap <C-J> <C-W>j               
        "�ϴ�(preview)â���� �̵�
nmap <C-K> <C-W>k               
        "��� â���� �̵�
nmap <C-L> <C-W>l               
        "������ â���� �̵�

let g:SrcExpl_winHeight = 5         " SrcExpl ������ ���� ����
let g:SrcExpl_refreshTime = 300     " refrech time = 300ms
let g:SrcExpl_jumpKey = "<ENTER>"   " �ش� definition ���� jump
let g:SrcExpl_gobackKey = "<SPACE>" " back
let g:SrcExpl_isUpdateTags = 0      " tag file update = off

"============= NERD Tree ȯ�漳�� =============
"let NERDTreeWinPos = "left"     "NERD Tree ��ġ = ����
let NERDTreeWinPos = "right"     "NERD Tree ��ġ = ������
let NERDTreeWinSize = 30
nmap <F9> :NERDTreeToggle<CR>
        "F9  Key = NERD Tree Toggling

" fold���� Key mapping
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

"========= man page ���� ==============
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
"    exe "!man -S ko:2:3:4:5:6:7:8 ".sm
endfunc
nmap ,ma :call Man()<CR>

"======== CONFIG_ ���� Ȯ���ϱ� =========
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
