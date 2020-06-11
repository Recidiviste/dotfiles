" NeoVim config
" By Anarchiste
" github.com/Recidiviste

" ===================== PLUGINS ============================ "

call plug#begin('~/.config/nvim/plugged')

Plug 'jarun/nnn.vim' "nnn file manager
Plug 'bling/vim-airline' "Vim-airline
Plug 'vim-airline/vim-airline-themes' "Themes for vim-airline
	let g:airline_theme='lucius' " Use murmur theme
Plug 'w0rp/ale' " Check syntax
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'sheerun/vim-polyglot'
"	let g:tex_fold_enabled=1
Plug 'edkolev/tmuxline.vim'
Plug 'nightsense/rusticated'
Plug 'ryanoasis/vim-devicons'
Plug 'aurieh/discord.nvim'
Plug 'evansalter/vim-checklist'

call plug#end()

" ===================== GENERAL ============================ "

set encoding=utf-8 " Use utf-8 encoding
set mouse=a " Use all mouse options
set nohlsearch " Don't hightlight all when searching
set clipboard=unnamedplus " Use system clipboard
set nocompatible " Use Vim settings instead of Vi settings
filetype plugin on " Autodetect filetype
if (has("termguicolors")) " Doesn't work for urxvt
	set termguicolors
endif
syntax enable " Enable syntax highlighting
colorscheme horizon " Use horizon colorscheme
set number "relativenumber
set splitbelow splitright
set history=10
set shada='100,f0
let mapleader = "µ" " Use a different map leader

" Airline
let g:airline_symbols = {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#symbol= '!'


" ===================== MAPPINGS =========================== "

" Spell Verification
map <leader>o :setlocal spell spelllang=fr<CR>

" NerdTree
map <C-n> :NnnPicker '%:p:h'<CR>
let g:nnn#layout = 'new' " Split

" Navigating between marks
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" FZF options
map <leader>ff :Files<Enter>
map <leader>fb :Buffers<Enter>
map <leader>fc :Colors<Enter>
map <leader>fm :Marks<Enter>
map <leader>fw :Windows<Enter>
map <leader>fc :Commands<Enter>
map <leader>fi :Filetypes<Enter>

" Moving between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-S-Up> :wincmd K<CR>
nmap <silent> <A-S-Down> :wincmd J<CR>
nmap <silent> <A-S-Left> :wincmd H<CR>
nmap <silent> <A-S-Right> :wincmd L<CR>

" Moving lines 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Tab navigation
nnoremap t<Left> :tabfirst<CR>
nnoremap t<Down> :tabnext<CR>
nnoremap t<Up> :tabprev<CR>
nnoremap t<Right> :tablast<CR>
nnoremap tn :tabnew<CR>

" Advanced Searching
nnoremap <leader>/ :BLines<CR>

" ====================== AUTOCMD ============================ "

" Spell verification on md and tex file
autocmd BufEnter *.Rmd set spell spelllang=fr
autocmd BufEnter *.tex set spell spelllang=fr
autocmd bufenter * if (("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Clear when leaving texfile
autocmd VimLeave *.tex !texclear %

" xrdb when posting changes to xressources and xdefaults files
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" ======================== FZF ============================== "

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(min([10, &lines/2]))
  let width = float2nr(min([80, &columns/2]))
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

let $FZF_DEFAULT_COMMAND =  "rg --files --hidden"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" ===================== SCHEMES =========================== "

map <leader>D :colorscheme horizon<CR>:let g:airline_theme='lucius'<CR>
map <leader>L :colorscheme rusticated<CR>:let g:airline_theme='papercolor'<CR>


" ================== USUALS FOR DOCUMENTS ================== "

" Compile
command C !compiler %

" View the result
command O !opout %

" ====================== LATEX ============================ "

" Tikz
function ReplaceCoordinates(startx, starty, endx, endy) range
	:%s/startx/\=a:startx/g
	:%s/starty/\=a:starty/g
	:%s/endx/\=a:endx/g
	:%s/endy/\=a:endy/g
endfunction
command -range -nargs=+ Coordinates call ReplaceCoordinates(<f-args>)

" Common maps
autocmd FileType tex inoremap ,lb \llbracket
autocmd Filetype tex inoremap ,rb \rrbracket
autocmd FileType tex inoremap ,al \begin{align*}<Enter><Enter>\end{align*}<Enter><Enter><++><Esc>3ki
autocmd FileType tex inoremap ,pmat \begin{pmatrix}<Enter><Enter>\end{pmatrix}<Enter><Enter><++><Esc>3ki
autocmd FileType tex inoremap ,cas \begin{cases}<Enter>\end{cases}<Enter><++><Up><Up><End><Enter>
autocmd FileType tex inoremap ,su $\left\{\begin{array}{l}<Enter><Enter><Enter>\end{array}<Enter>\right.$<Up><Up><Up>
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{figure}<Enter>\centering<Enter><Enter>\end{figure}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,img \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{}<Enter>\end{figure}<Enter><Enter>
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ce \begin{center}<Enter><Enter>\end{center}<Esc>ji
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ver \begin{verse}<Enter><Enter>\end{verse}
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,col \begin{multicols}{2}<Enter><Enter>\columnbreak<Enter><Enter>\end{multicols}
autocmd Filetype tex inoremap ,gh \left\\|\vec{}\right\\|<Esc>8hi
autocmd Filetype tex inoremap ,ov \overrightarrow{}<Esc>i
autocmd Filetype tex inoremap ,un \underline{}<Esc>i
autocmd Filetype tex inoremap ,tit \begin{center}<Enter>\Large{}<Enter>\end{center}<Enter>\vspace{3\baselineskip}<Esc>2k5l<Esc>i
autocmd Filetype tex inoremap ,nt \newpage<Enter>\begin{center}<Enter>\Large{}<Enter>\end{center}<Enter>\vspace{3\baselineskip}<Enter>\begin{linenumbers}[1]<Enter><Enter>\end{linenumbers}<Esc>5ki
autocmd FileType tex inoremap ,emp \begin{empheq}[box=\fbox]{align}<Enter><Enter>\end{empheq}
autocmd FileType tex inoremap ,sp \vspace{\baselineskip}
autocmd FileType tex inoremap ,name \AddToShipoutPictureBG*{%<Enter>\AtPageUpperLeft{%<Enter>\raisebox{-\baselineskip}{%<Enter>\makebox[0pt][l]{ Luc Saccoccio--Le Guennec}<Enter>}<Enter>\raisebox{-2\baselineskip}{%<Enter>\makebox[0pt][l]{TS5}<Enter><Enter>}}}%
autocmd FileType tex inoremap ,qu \begin{quote}<Enter>\attrib{ {\em }}<Enter>\end{quote}
autocmd Filetype tex inoremap ,func \begin{tikzpicture}<CR>\draw[thin, dashed, gray] (startx, starty) grid (endx, endy);<CR>\draw[->] (startx, 0) -- (endx, 0) node[right] {$x$};<CR>\draw[->] (0, starty) -- (0, endy) node[above] {$y$};<CR>\end{tikzpicture}<Esc>$v4<Up>0:Coordinates
autocmd FileType tex inoremap ,tikz \begin{tikzpicture}<CR><CR>\end{tikzpicture}<Up>
autocmd Filetype tex inoremap ,cal \mathcal{}<Left>
autocmd FileType tex inoremap ,V \vect{}<Left>
autocmd FileType tex inoremap ,de \begin{description}<Enter><Enter>\end{description}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,dq \begin{description}<Enter><Enter>\end{description}<Enter><Enter><++><Esc>3kA\item[$\circ$]<Space><Enter>\item[$\circ$]<Space><Enter>\item[$\circ$]<Space>

" ======================= LIST ============================= "

autocmd BufRead,BufEnter *.Rmd setlocal noautoindent | setlocal nocindent | setlocal nosmartindent | setlocal indentexpr=

autocmd BufRead,BufEnter *.Rmd inoremap ,e <details><summary>**Informations**</summary><Enter><p><Esc>8ji</p></details><Enter><Esc>
autocmd BufRead,BufEnter *.Rmd inoremap ,n <details><summary>**Informations**</summary><Enter><p><Enter>* Nom Français : <Enter>* Nom Originel : <Enter>* Réalisateur : <Enter>* Année de sortie : <Enter>* Possession : <Enter>* Chemin d'accès : <Enter>* Vu : <Enter></p></details><Enter><Esc>

nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>

" ======================= HTML ============================= "

" Basics maps
autocmd FileType html inoremap &<space> &amp;<space>
autocmd FileType html inoremap á &aacute;
autocmd FileType html inoremap é &eacute;
autocmd FileType html inoremap í &iacute;
autocmd FileType html inoremap ó &oacute;
autocmd FileType html inoremap ú &uacute;
autocmd FileType html inoremap ä &auml;
autocmd FileType html inoremap ë &euml;
autocmd FileType html inoremap ï &iuml;
autocmd FileType html inoremap ö &ouml;
autocmd FileType html inoremap ü &uuml;
autocmd FileType html inoremap ã &atilde;
autocmd FileType html inoremap ẽ &etilde;
autocmd FileType html inoremap ĩ &itilde;
autocmd FileType html inoremap õ &otilde;
autocmd FileType html inoremap ũ &utilde;
autocmd FileType html inoremap ñ &ntilde;
autocmd FileType html inoremap à &agrave;
autocmd FileType html inoremap è &egrave;
autocmd FileType html inoremap ì &igrave;
autocmd FileType html inoremap ò &ograve;
autocmd FileType html inoremap ù &ugrave;
