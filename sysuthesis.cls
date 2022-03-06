%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 sysuthesis.cls                  %%
%%                  Mar 06, 2022                   %%
%% Copyright (C) by yanghw8 <yanghewen8@gmail.com> %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\sysuthesis{sysuthesis-unoffical}
\def\version{1.0.1}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sysuthesis}[2022/03/06 Sun Yat-sen University Thesis Unofficial Template]

% ClassError
\RequirePackage{iftex}
\ifXeTeX\else\ClassError{The sysuhesis class requires XeTeX typesetting engine}
    {You must change your LaTeX compiler to "xelatex" instead of "lualatex", "latex" or "pdflatex"}
\fi

% this cls modified base on ctexbook documentclass
\LoadClass[UTF8,12pt,twoside,linespread=1.5]{ctexbook}

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
% \set {Helvetica}[Scale=MatchLowercase]
% \setmonofont{Monaco}[Scale=MatchLowercase]

%  create some new or renew commands
\renewcommand{\title}[2]{\def\@title@zh{#1}\def\@title@en{#2}}
\renewcommand{\author}[2]{\def\@author@zh{#1}\def\@author@en{#2}}
\newcommand{\degreetype}[1]{\def\@degreetype{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\major}[2]{\def\@major@zh{#1}\def\@major@en{#2}}
\newcommand{\supervisor}[2]{\def\@supervisor@zh{#1}\def\@supervisor@en{#2}}
\newcommand{\keywords}[2]{\def\@keywords@zh{#1}\def\@keywords@en{#2}}
\newcommand{\school}[1]{\def\@school{#1}}
\newcommand{\campus}[1]{\def\@campus{#1}}

% the paper geometry setup
\geometry{%
    a4paper,
    left=30mm,right=30mm,top=37mm,bottom=23mm,
    head=30mm, headsep=3mm, foot=6mm, footnotesep=3mm,
    includefoot
}

 % linking style
\hypersetup{%
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,  
    citecolor=black,    
    urlcolor=blue,
}
\urlstyle{rm}

% pdf documentinfo
\AtBeginDocument{%
    \hypersetup{%
        pdfauthor={\@author@zh},
        pdftitle={\@title@zh},
        pdfkeywords={\@keywords@zh},
        pdfcreator={LaTeX with \sysuthesis \version},
    }
}

% renew the refnames of some environment
\AtBeginDocument{%
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
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \vspace*{22pt}
        \begin{center}
            \songti{\zihao{3}\@title@zh}\\
            \vspace*{24pt}
            {\fontspec{Times New Roman}{\zihao{-4}\@title@en}}\\
            \vspace*{84pt}
            \songti\zihao{-3}
            \begin{tabular}{lll}
                &学\hspace*{0.5\ccwd}位\hspace*{0.5\ccwd}申\hspace*{0.5\ccwd}请\hspace*{0.5\ccwd}人：&\@author@zh\\
                &专\hspace*{1\ccwd}业\hspace*{1\ccwd}名\hspace*{1\ccwd}称：&\@major@zh\\
                &导师姓名及职称：&\@supervisor@zh
            \end{tabular}\\
            \vspace*{90pt}
        \end{center}
        \begin{flushleft}
            \bfseries\zihao{-3}
            \hspace*{2\ccwd}答辩委员会主席（签名）：\\
            \hspace*{2\ccwd}委员（签名）：\\
        \end{flushleft}
        \cleardoublepage
    \end{titlepage}
}

% matter text setup
\ctexset{%
    punct       = quanjiao,
    space       = auto,
    autoindent  = true,
}
% set the space between CJK text and Western text, CJK text and inline math formulas
\xeCJKsetup{CJKecglue={\hskip0pt}}

\setlength\intextsep{6pt}
% \setlength\abovedisplayskip{0pt}
% \setlength\abovedisplayshortskip{0pt}

% header and footer setup
\pagestyle{fancy}
\fancyhead{}
\fancyhead[OC]{\songti\zihao{-5}\leftmark}
\fancyhead[EC]{\songti\zihao{-5}中山大学\@degreetype\@degree 学位论文}
\renewcommand{\headrule}{\hrule height 0.8mm \vspace{0.2mm}\hrule height 0.2mm}
\renewcommand{\headruleskip}{2pt}
\fancyfoot{}
\fancyfoot[C]{\zihao{-5}-\ \thepage\ -}


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
\NewDocumentCommand{\copyrightpage}{}{
    {%
    \pagestyle{empty}
    \vspace*{36pt}
    \begin{center}\heiti{\zihao{3}论文原创性声明}\end{center}
    \vspace*{24pt}
    \linespread{1.7}
    \songti\zihao{4}
    \hspace{2\ccwd}本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
    \par \vspace*{18pt}
    \begin{flushright}
        \songti\zihao{4}
        学位论文作者签名：\hspace{6\ccwd}
        \par \vspace*{12pt}
        日期：\hspace{3\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日\hspace{2\ccwd}

    \end{flushright}
    \newpage
    \vspace*{36pt}
    \begin{center}\heiti{\zihao{3}学位论文使用授权声明}\end{center}
    \vspace*{24pt}
    \linespread{1.7}
    \songti\zihao{4}
    \hspace{2\ccwd}本人完全了解中山大学有关保留、使用学位论文的规定，即：学校有权保留学位论文并向国家主管部门或其指定机构送交论文的电子版和纸质版；有权将学位论文用于非盈利目的的少量复制并允许论文进入学校图书馆、院系资料室被查阅；有权将学位论文的内容编入有关数据库进行检索；可以采用复印、缩印或其他方法保存学位论文；可以为存在馆际合作关系的兄弟高校用户提供文献传递服务和交换服务。
        
    保密论文保密期满后，适用本声明
    \par \vspace*{18pt}
    \begin{flushleft}
        \songti\zihao{4}
        学位论文作者签名：\hspace{6\ccwd}  导师签名：
        \par \vspace*{12pt}
        日期：\hspace{2\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日 \hspace{3\ccwd}日期：\hspace{2\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日
    \end{flushleft}
    \cleardoublepage
    }
    % set the page counter to 1 after copyrightpage
    \setcounter{page}{1}
    \pagenumbering{Roman}
    \pagestyle{fancy}
}

% format of the tableofcontents, listoffigures and listoftables
\RequirePackage[titles]{tocloft}
\tocloftpagestyle{fancy}
\renewcommand*{\contentsname}{目\hspace{\ccwd}录}
\renewcommand{\listfigurename}{插图索引}
\renewcommand{\listtablename}{表格索引}
\setcounter{tocdepth}{2}
\setlength{\cftbeforechapskip}{0pt}
\setlength\cftbeforefigskip{\cftbeforechapskip}
\setlength\cftbeforetabskip{\cftbeforechapskip}
\cftsetpnumwidth{1em}
\renewcommand{\cftparskip}{0pt}
% \newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
% \addtocontents{lof}{\protect\noaddvspace}
% \addtocontents{lot}{\protect\noaddvspace}
\renewcommand{\cftfigpresnum}{图~}
\renewcommand{\cfttabpresnum}{表~}
\cftsetindents{chapter}{0em}{1.5em}
\cftsetindents{section}{1em}{1.5em}
\cftsetindents{subsection}{2em}{1.5em}
\cftsetindents{fig}{0em}{3.5em}
\cftsetindents{tab}{0em}{3.5em}
% \renewcommand{\cftchapfont}{\mdseries}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapleader}{\mdseries\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftfigleader}{\cftdotfill{\cftfigdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cfttabdotsep}}
% \renewcommand{\cftchappagefont}{(\mdseries}
% \renewcommand{\cftchapafterpnum}{)}


% setup of \tableofcontentsen
\newcommand\contentsnameen{Contents}
\newcommand\chapternameen{Chapter~}
\newcommand\sectionnameen{}
\newcommand\subsectionnameen{}
\newcommand\tableofcontentsen{%
    \if@twocolumn\@restonecoltrue\onecolumn
    \else\@restonecolfalse
    \fi
    \chapter*{\contentsnameen
        \@mkboth{\MakeUppercase\contentsnameen}{中山大学\@degreetype\@degree 学位论文}}
        \@starttoc{toe}
        \if@restonecol\twocolumn\fi
    }
\newcommand\addcontentsen[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{%
        \csname #1nameen\endcsname
        \csname the#1\endcsname}#2
    }
}
\newcommand\chapteren[1]{\addcontentsen{chapter}{#1}}
\newcommand\sectionen[1]{\addcontentsen{section}{#1}}
\newcommand\subsectionen[1]{\addcontentsen{subsection}{#1}}

% abstract enviroment setup
\NewDocumentEnvironment{abszh}{}{%
    \pagestyle{fancy}
    \phantomsection \label{abszh}
    \addcontentsline{toc}{chapter}{\protect 摘\hspace*{2\ccwd}要}
    \addcontentsline{toe}{chapter}{Abstract (In Chinese)}
    \vspace*{10pt}
    \linespread{1.5}
    \begin{center}
        \songti\zihao{-3}\@title@zh
        \par
        专业：\@major@zh
        \par
        \@degree 生：\@author@zh
        \par
        指导教师：\@supervisor@zh
        \par \vspace*{36pt}
        {\heiti\zihao{-2}{摘\hspace{2\ccwd}要}}
        \par \vspace*{11pt}
    \end{center}
    \songti\zihao{-4}
    \par
}
{%
    \par \vspace*{12pt}
    {\heiti\zihao{-4}{关键词: }} \songti{\zihao{-4}\@keywords@zh}
    \clearpage
}
\NewDocumentEnvironment{absen}{}{%
    \pagestyle{fancy}
    \phantomsection \label{absen}
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \addcontentsline{toe}{chapter}{Abstract (In English)}
    \vspace*{10pt}
    \linespread{1.5}
    \begin{center}
        \zihao{-3}\@title@en
        \par
        Major：\@major@en
        \par
        Name：\@author@en
        \par
        Supervisor：\@supervisor@en
        \par \vspace*{36pt}
        {\zihao{-2}{\bfseries Abstract}}
        \par \vspace*{11pt}
    \end{center}
    \songti\zihao{-4}
    \par
}
{%
    \par \vspace*{12pt}
    {\zihao{-4}\bfseries KeyWords: \@keywords@en}
    \clearpage
}

% format of the bibliography
\RequirePackage{cite}
\renewcommand\@cite[1]{\zihao{-4}\textsuperscript{[#1]}}
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\newcommand{\makebib}[1]{%
    \bibliographystyle{sysuthesis}
    \clearpage
    {%
        \xeCJKsetup{CJKecglue={\hskip0pt}}
        \linespread{1.0}
        \zihao{-4}
        \addcontentsline{toc}{chapter}{参考文献}
        \addcontentsline{toe}{chapter}{References}
        \bibliography{#1}
    }
    \clearpage{\pagestyle{empty}\cleardoublepage}
}


% format of chapter, section, subsection, subsubsection, paragraph and subparagraph
\pagestyle{fancy}
\ctexset{%
    chapter = {%
        beforeskip  = 9mm,
        format      = \zihao{-2}\heiti\centering,
        name        = {第~, ~章},
        number      = \arabic{chapter},
        aftername   = ~,
        afterskip   = 9mm,
        pagestyle   = fancy,
        fixskip     = true,
    },
    section = {%
        fixskip     = true,
        beforeskip  = 7mm,
        indent      = 24pt,
        format      = \zihao{-3}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 7mm,
    },
    subsection = {%
        fixskip     = true,
        beforeskip  = 6mm,
        indent      = 24pt,
        format      = \zihao{4}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 6mm,
    },
    subsubsection = {%
        fixskip     = true,
        beforeskip  = 5mm,
        indent      = 24pt,
        format      = \zihao{-4}\songti,
        name        = {（, ）},
        number      = \chinese{chapter},
        afterindent = true,
        aftername   = ~,
        afterskip   = 5mm,
    },
    paragraph = {%
        fixskip     = true,
        afterindent = true,
    },
    subparagraph = {%
        fixskip     = true,
        afterindent = true,
    },
}
\setcounter{secnumdepth}{3}

% format of itemize and enumerate
\RequirePackage{enumitem}
\setenumerate{fullwidth,itemindent=\parindent,listparindent=\parindent}
\setlist{noitemsep,topsep=0pt,itemsep=0pt,partopsep=0pt,parsep=0pt}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label = (\arabic*),ref = \arabic*}
\setlist[enumerate,2]{label = (\emph{\alph*}),ref = \theenumi.\alph*}
\setlist[enumerate,3]{label = (\roman*),ref = \theenumii.\roman*}

% setup figure, table and equation numbering and lable format
\AtBeginDocument{%
    \def\thefigure{\thechapter{-}\arabic{figure}}
    \def\p@subfigure{\thefigure}
    \def\thetable{\thechapter{-}\arabic{table}}
    \def\theequation{\thechapter{-}\arabic{equation}}
}

% setup the bicaption
\RequirePackage[skip=2pt]{caption}
\RequirePackage[listtype+=sen]{bicaption}
\DeclareCaptionFont{caption@font}{\zihao{5}}
\captionsetup{font = caption@font}
\DeclareCaptionFont{bi-second}{%
    \zihao{5}
    \def\figurename{Fig.}
    \def\tablename{Table}
}
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[fileext=lof2,chapterlistsgaps=on]{figuresen}[Figiure][List of Figures]
\DeclareFloatingEnvironment[fileext=lot2,chapterlistsgaps=on]{tablesen}[Table][List of Tables]
\PrepareListOf{figuresen}{\renewcommand{\cftfigpresnum}{Fig.~}}
\PrepareListOf{tablesen}{%
    \renewcommand{\cftfigpresnum}{Table~}
    \cftsetindents{fig}{0em}{4.5em}
}
\captionsetup[bi-second]{font=bi-second,skip=2pt}

% format of theorem and proof environment
\newtheoremstyle{thmsty}
    {}
    {}
    {\songti}
    {}
    {\bfseries\songti}
    {}
    {0.5em}
    {\thmname{#1}\thmnumber{~#2}\thmnote{~(#3)}}
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
\lstdefinestyle{codestyle}{%
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
\forestset{%
    directory/.style={%
        for tree={%
            edge+=thick, 
            folder, 
            font=\ttfamily\zihao{5},
            grow'=0,
            draw,
        },
    },
}
% create some new document environment
\NewDocumentEnvironment{conclusion}{}{%
    \ctexset{chapter/numbering=false}\chapter{结\hspace{\ccwd}论}
    \addcontentsline{toe}{chapter}{Conclusions}
}

\NewDocumentEnvironment{acknowledgements}{}{%
    \ctexset{chapter/numbering=false}\chapter{后记}
    \addcontentsline{toe}{chapter}{Acknowledgements}
}

\endinput