
"Настроим кол-во символов пробелов, которые будут заменять \t
set expandtab "включим автозамену по умолчанию 
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent "включим автоотступы для новых строк
set cin "включим отступы в стиле Си
set wrap "попросим Vim переносить длинные строки


"Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

set lz "ленивая перерисовка экрана при выполнении скриптов

" Показываем табы в начале строки точками
set listchars=tab:··
set list

" Порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

"Взаимодействие и элементы интерфейса
"Я часто выделяю мышкой содержимое экрана в Putty, но перехват мышки в Vim мне иногда мешает. Отключаем функционал вне графического режима:
"if !has('gui_running')
"set mouse=
"endif

"Избавляемся от меню и тулбара:
set guioptions-=T
set guioptions-=m

"Пытаемся занять максимально большое пространство на экране. Как водится, по-разному на разных системах:
if has('gui')
if has('win32')
au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
elseif has('gui_gtk2')
au GUIEnter * :set lines=99999 columns=99999
endif
endif

"Опять же, системы сборки для разных платформ могут быть переопределены:
if has('win32')
set makeprg=nmake
compiler msvc
else
set makeprg=make
compiler gcc
endif

colorscheme nightwish
syntax on
set number

"autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
"autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
"autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

"set softtabstop=4 " makes the spaces feel like real tabs
