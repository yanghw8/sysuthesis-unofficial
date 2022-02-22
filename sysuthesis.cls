%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 sysuthesis.cls                  %%
%%                  Feb 22, 2022                   %%
%% Copyright (C) by yanghw8 <yanghewen8@gmail.com> %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\sysuthesis{sysuthesis-unoffical}
\def\version{1.0}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sysuthesis}[2022/02/23 Sun Yat-sen University Thesis Unofficial Template]

% ClassError
\RequirePackage{iftex}
\ifXeTeX\else\ClassError{The sysuhesis class requires XeTeX typesetting engine}
    {You must change your LaTeX compiler to "xelatex" instead of "lualatex", "latex" or "pdflatex"}
\fi

% this cls modified base on ctexbook documentclass
\LoadClass[UTF8,zihao=-4,twoside,linespread=1.5,a4paper]{ctexbook}

%  the required packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{subcaption}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}

% font setup
\setmainfont{Times New Roman}
\setmathrm{Times New Roman} % 数学字体设为 Times New Roman
\setCJKmathfont{Times New Roman} % 中文里面的数字字体设为 Times New Roman
\setsansfont{Helvetica}[Scale=MatchLowercase]
\setmonofont{Monaco}[Scale=MatchLowercase]

%  create some new or renew commands
\renewcommand{\title}[2]{\def\@title@zh{#1}\def\@title@en{#2}}
\renewcommand{\author}[2]{\def\@author@zh{#1}\def\@author@en{#2}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\major}[2]{\def\@major@zh{#1}\def\@major@en{#2}}
\newcommand{\supervisor}[2]{\def\@supervisor@zh{#1}\def\@supervisor@en{#2}}
\newcommand{\keywords}[2]{\def\@keywords@zh{#1}\def\@keywords@en{#2}}
\newcommand{\school}[1]{\def\@school{#1}}
\newcommand{\campus}[1]{\def\@campus{#1}}

% the paper geometry setup
\geometry{left=2.5cm,right=2.5cm,top=3.5cm,bottom=2.5cm}

 % linking style
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,  
    citecolor=black,    
    urlcolor=blue,
}
\urlstyle{rm}

% pdf documentinfo
\AtBeginDocument{
    \hypersetup{
        pdfauthor={\@author@zh},
        pdftitle={\@title@zh},
        pdfkeywords={\@keywords@zh},
        pdfcreator={LaTeX with \sysuthesis \version},
    }
}

% renew the refnames of some environment
\AtBeginDocument{
    \renewcommand{\ref}[1]{\autoref{#1}}
    \def\figureautorefname~#1\null{图~#1~\null}
    \def\tableautorefname~#1\null{表~#1~\null}
    \def\appendixautorefname~#1\null{附录~#1~\null} 
    \def\equationautorefname~#1\null{公式~(#1)~\null}
    \def\chapterautorefname~#1\null{第#1章\null}
    \def\sectionautorefname~#1\null{第#1节~\null}
    \def\AMSautorefname~#1\null{公式~(#1)~\null}
    \def\theoremautorefname~#1\null{#1~\null}
    \def\proofautorefname~#1\null{\null}
}

% titlepage setup
\renewcommand{\maketitle}{
    \begin{titlepage}
        \begin{center}
            \includegraphics{figures/sysu.pdf}\\
            \heiti{\zihao{0}研究生学位论文}\\
            \vspace*{36pt}
            \heiti{\zihao{2}\@title@zh}\\
            \vspace*{16pt}
            {\fontspec{Times New Roman}{\zihao{2}\@title@en}}\\
            \vspace*{36pt}
            \songti\bfseries\zihao{-3}
            \songti\bfseries\zihao{-3}
            \begin{tabular}{lll}
                &专业：&\@major@zh\\
                &\@degree 研究生：&\@author@zh\\
                &指导教师：&\@supervisor@zh
            \end{tabular}\\
            \vspace*{36pt}
        \end{center}
        \begin{flushleft}
            \zihao{-3}
            答辩委员会主席：\\
            答辩委员我成员：\\
        \end{flushleft}
        \begin{center}
            \vspace*{90pt}
            \zihao{-3}
            \@school\\
            \@date\hspace*{2\ccwd}\@campus
        \end{center}
        \cleardoublepage
    \end{titlepage}
}

% matter text setup
\ctexset{
    punct       = quanjiao,
    space       = auto,
    autoindent  = true,
}
% set the space between CJK text and Western text, CJK text and inline math formulas to 1.2pt
\xeCJKsetup{CJKecglue={\hskip1.2pt}}

% header and footer setup
\pagestyle{fancy}
\fancyhead[L]{\bfseries\zihao{5}中山大学研究生学位论文}
\fancyhead[R]{\bfseries\zihao{5}\@title@zh}
\fancyfoot[C]{\thepage}
\setlength{\headheight}{12.64723pt}
\addtolength{\topmargin}{-0.64723pt}

% format of footnote
\RequirePackage{pifont}
\RequirePackage[symbol*,stable]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}
\renewcommand{\footnotesize}{\zihao{5}\linespread{1.2}\selectfont}
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

% reset the cleardoublepage command
\def\cleardoublepage{\clearpage
\if@twoside
    \ifodd\c@page
    \else
        {\hbox{}\thispagestyle{empty}\newpage}
        \if@twocolumn
            \hbox{}\newpage
        \fi
    \fi
\fi}

% copyright page setup
\NewDocumentCommand{\copyrightpage}{O{}}{
    \pagestyle{empty}
    \begin{center}
        \heiti{\zihao{3}论文原创性声明}\\
    \end{center}
    \begin{flushleft}
        \songti\zihao{4}
        \hspace{2\ccwd}本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
    \end{flushleft}
    \begin{flushright}
        \songti\zihao{4}
        学位论文作者签名：\hspace{5\ccwd}

        日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日\hspace{1\ccwd}

    \end{flushright}
    \begin{center}
        \vspace*{56pt}
        \heiti{\zihao{-3}学位论文使用授权声明}\\
    \end{center}
    \begin{flushleft}
        \songti\zihao{4}
        \hspace{2\ccwd}本人完全了解中山大学有关保留、使用学位论文的规定，即：学校有权保留学位论文并向国家主管部门或其指定机构送交论文的电子版和纸质版；有权将学位论文用于非盈利目的的少量复制并允许论文进入学校图书馆、院系资料室被查阅；有权将学位论文的内容编入有关数据库进行检索；可以采用复印、缩印或其他方法保存学位论文；可以为存在馆际合作关系的兄弟高校用户提供文献传递服务和交换服务。\\
        \hspace{2\ccwd}保密论文保密期满后，适用本声明。\\
    \end{flushleft}
    \begin{flushleft}
        \songti\zihao{4}
        \hspace{2\ccwd}学位论文作者签名：\hspace{7\ccwd}  导师签名：\\
        \hspace{2\ccwd}日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日 \hspace{3\ccwd}日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日\hspace{3\ccwd}\\
    \end{flushleft}
    \cleardoublepage
    % set the page counter to 1 after copyrightpage
    \setcounter{page}{1}
    \pagenumbering{Roman}
    \pagestyle{fancy}
}

% abstract enviroment setup
\newenvironment{abszh}{
    \thispagestyle{fancy}
    \begin{center}
        \zihao{-1}\@title@zh\\
        \vspace*{36pt}
        \songti\bfseries\zihao{-3}
        \begin{tabular}{lll}
            &专业：&\@major@zh\\
            &\@degree 研究生：&\@author@zh\\
            &指导教师：&\@supervisor@zh
        \end{tabular}\\
        \vspace*{36pt}
        {\zihao{-2}{摘\hspace{\ccwd}要}}
        \vspace*{16pt}
    \end{center}
    \songti\zihao{-4}
    \par
}
{
    \begin{flushleft}
        {\zihao{-3}\heiti\bfseries{关键词: }} \songti{\zihao{-4}\@keywords@zh}
    \end{flushleft}
    \cleardoublepage
}
\newenvironment{absen}{
    \pagestyle{fancy}
    \begin{center}
        \zihao{-1}\@title@en\\
        \vspace*{36pt}
        \songti\bfseries\zihao{-3}
        \begin{tabular}{lll}
            &Major：&\@major@en\\
            &Name：&\@author@en\\
            &Supervisor：&\@supervisor@en
        \end{tabular}\\
        \vspace*{36pt}
        {\zihao{-2}{ABSTRACT}}
        \vspace*{16pt}
    \end{center}
    \songti\zihao{-4}
    \par
}
{
    \begin{flushleft}
        {\zihao{-3}\bfseries{KeyWords: }} \songti{\zihao{-4}\@keywords@en}
    \end{flushleft}
    \cleardoublepage
}

% format of the tableofcontents, listoffigures and listoftables
\RequirePackage[titles]{tocloft}
\tocloftpagestyle{fancy}
\renewcommand*{\contentsname}{目\hspace{\ccwd}录}
\renewcommand{\listfigurename}{插图索引}
\renewcommand{\listtablename}{表格索引}
\setcounter{tocdepth}{1}
\setlength{\cftbeforechapskip}{0pt}
\setlength\cftbeforefigskip{\cftbeforechapskip}
\setlength\cftbeforetabskip{\cftbeforechapskip}
\cftsetpnumwidth{1em}
\renewcommand{\cftparskip}{0pt}
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}
\renewcommand{\cftfigpresnum}{图}
\renewcommand{\cfttabpresnum}{表}
\cftsetindents{chapter}{0em}{1.5em}
\cftsetindents{section}{0em}{1.5em}
\cftsetindents{fig}{0em}{3.5em}
\cftsetindents{tab}{0em}{3.5em}
\renewcommand{\cftchapfont}{\mdseries}
\renewcommand{\cftsecfont}{\mdseries}
\renewcommand{\cftfigfont}{\mdseries}
\renewcommand{\cfttabfont}{\mdseries}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapleader}{\mdseries\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftfigleader}{\cftdotfill{\cftfigdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cfttabdotsep}}
\renewcommand{\cftchappagefont}{(\mdseries}
\renewcommand{\cftchapafterpnum}{)}
\renewcommand{\cftsecpagefont}{(\mdseries}
\renewcommand{\cftsecafterpnum}{)}
\renewcommand{\cftfigpagefont}{(\mdseries}
\renewcommand{\cftfigafterpnum}{)}
\renewcommand{\cfttabpagefont}{(\mdseries}
\renewcommand{\cfttabafterpnum}{)}


% format of the bibliography
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\newcommand{\makebib}[1]{
    \bibliographystyle{sysuthesis}
    \clearpage
    {
        \linespread{1.0}
        \zihao{5}
        \addcontentsline{toc}{chapter}{参考文献}
        \bibliography{#1}
    }
    \clearpage{\pagestyle{empty}\cleardoublepage}
}

% format of chapter, section, subsection, subsubsection, paragraph and subparagraph
\pagestyle{fancy}
\ctexset{
    chapter = {
        beforeskip  = -24pt,
        format      = \zihao{-2}\heiti\centering,
        aftername   = \quad,
        afterskip   = 30pt,
        pagestyle   = fancy
    },
    section = {
        beforeskip  = 0pt,
        indent      = 24pt,
        format      = \zihao{-3}\bfseries\songti,
        afterindent = true,
        aftername   = \quad,
        afterskip   = 2ex,
    },
    subsection = {
        beforeskip  = 0pt,
        indent      = 24pt,
        format      = \zihao{-4}\bfseries\songti,
        afterindent = true,
        aftername   = \quad,
        afterskip   = 2ex,
    },
    subsubsection = {
        beforeskip  = 0pt,
        indent      = 24pt,
        format      = \zihao{-4}\bfseries\songti,
        afterindent = true,
        aftername   = \quad,
        afterskip   = 0pt,
    },
    paragraph/afterindent    = true,
    subparagraph/afterindent = true,
}
\setcounter{secnumdepth}{2}

% format of itemize and enumerate
\RequirePackage{enumitem}
\setenumerate{fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex}
\setlist{noitemsep}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label = (\arabic*),ref = \arabic*}
\setlist[enumerate,2]{label = (\emph{\alph*}),ref = \theenumi.\alph*}
\setlist[enumerate,3]{label = \roman*),ref = \theenumii.\roman*}

% setup figure, table and equation numbering and lable format
\AtBeginDocument{
    \def\thefigure{\thechapter{$-$}\arabic{figure}}
    \def\p@subfigure{\thefigure}
    \def\thetable{\thechapter{$-$}\arabic{table}}
    \def\theequation{\thechapter{$-$}\arabic{equation}}
}

% format of theorem and proof environment
\newtheoremstyle{thmsty}
    {}
    {}
    {\songti}
    {}
    {\bfseries\songti}
    {}
    {0.5em}
    {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\theoremstyle{thmsty}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem*{remark}{注释}
\newtheorem*{solution}{解}
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}
    \mdseries \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
    {\bfseries\songti#1}\hspace\labelsep\ignorespaces
}
{   \popQED\endtrivlist\@endpefalse }


% format of codes display
\RequirePackage{listings}
\lstdefinestyle{codestyle}{
    backgroundcolor=\color{gray!20},
    commentstyle=\color{teal},
    keywordstyle=\color{blue},
    stringstyle=\color{violet},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=t,                    
    keepspaces=true,                                                    
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=codestyle}

% format of directory tree display
\RequirePackage[edges]{forest}
\forestset{
    directory/.style={
        for tree={
            edge+=thick, 
            folder, 
            font=\ttfamily\zihao{5},
            grow'=0,
            draw,
        },
    },
}
% create some new document environment
\NewDocumentEnvironment{summary}{}{\ctexset{chapter/numbering=false}\chapter{结语}}

\NewDocumentEnvironment{acknowledgements}{}{\ctexset{chapter/numbering=false}\chapter{后记}}

\endinput