%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 sysuthesis.cls                  %%
%%                  Mar 28, 2024                   %%
%% Copyright (C) by yanghw8 <yanghewen8@gmail.com> %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% !TeX encoding = UTF-8

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sysuthesis}[2024/03/28 Sun Yat-sen University Thesis Unofficial Template]

\def\sysuthesis{sysuthesis-unofficial}
\def\version{v1.1.3}

\newcommand{\sysu@error}[1]{%
    \ClassError{sysuthesis}{#1}{}%
}
\newcommand{\sysu@warning}[1]{%
    \ClassWarning{sysuthesis}{#1}%
}

% ClassError
\RequirePackage{iftex}
\ifXeTeX\else
    \sysu@error{The sysuthesis class requires XeTeX typesetting engine. You need to change your compiler to "xelatex", instead of "lualatex", "latex" or "pdflatex"}
\fi

% define the options of cls
\RequirePackage{kvoptions}
\RequirePackage{kvsetkeys}
\RequirePackage{xstring}
\SetupKeyvalOptions{%
    family  = sysu,
    prefix  = sysu@,
    setkeys = \kvsetkeys
}
\DeclareBoolOption[true]{thesis}
\DeclareComplementaryOption{proposal}{thesis}
\DeclareBoolOption[true]{final}
\DeclareBoolOption[false]{checkmode}
\DeclareBoolOption[false]{blindmode}
\DeclareStringOption{doctype}[thesis]
\DeclareStringOption{printmode}[final]
\DeclareStringOption[fandol]{fontset}[fandol]

\DeclareBoolOption[false]{blankleft}
\DeclareBoolOption[true]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*

\IfStrEq{\sysu@doctype}{thesis}
{\sysu@thesistrue}{%
    \IfStrEq{\sysu@doctype}{proposal}
    {\sysu@proposaltrue}{}
}
\IfStrEq{\sysu@printmode}{final}
{\sysu@finaltrue}{%
    \sysu@finalfalse
    \IfStrEq{\sysu@printmode}{checkmode}
    {\sysu@checkmodetrue}{%
        \sysu@checkmodefalse
        \IfStrEq{\sysu@printmode}{blindmode}
        {\sysu@blindmodetrue}{\sysu@warning{Invalid printmode option, set to defualt: "final"}}
    }
}

\ifsysu@openright
    \PassOptionsToClass{openright}{book}
\else
    \PassOptionsToClass{openany}{book}
\fi

% this cls modified base on ctexbook documentclass
\LoadClass[a4paper,UTF8,zihao=-4,twoside,linespread=1.39,fontset=\sysu@fontset]{ctexbook}

% the required packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage[english,pinyin]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage[titles]{tocloft}
\RequirePackage{newfloat}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage[skip=2pt]{caption}
\RequirePackage{subcaption}
\RequirePackage[lang=english,listtype+=sen]{bicaption}
\RequirePackage{listings}
\RequirePackage[sort&compress]{gbt7714}

% font setup
\setmainfont{Times New Roman}
\setmathrm{Times New Roman} % 数学字体设为 Times New Roman
\setCJKmathfont{Times New Roman} % 中文里面的数字字体设为 Times New Roman

% infomation keys
\define@key{sysu@keys}{author}{\def\@author@zh{#1}}
\define@key{sysu@keys}{author-en}{\def\@author@en{#1}}
\define@key{sysu@keys}{title}{\def\@title@zh{#1}}
\define@key{sysu@keys}{title-en}{\def\@title@en{#1}}
\define@key{sysu@keys}{student-id}{\def\@studentid{#1}}
\define@key{sysu@keys}{major}{\def\@major@zh{#1}}
\define@key{sysu@keys}{major-en}{\def\@major@en{#1}}
\define@key{sysu@keys}{supervisor}{\def\@supervisor@zh{#1}}
\define@key{sysu@keys}{supervisor-en}{\def\@supervisor@en{#1}}
\define@key{sysu@keys}{research-team}{\def\@researchteam{#1}}
\define@key{sysu@keys}{discipline}{\def\@discipline{#1}}
\define@key{sysu@keys}{degree}{\def\@degree{#1}}
\define@key{sysu@keys}{keywords}{\def\@keywords@zh{#1}}
\define@key{sysu@keys}{keywords-en}{\def\@keywords@en{#1}}
\define@key{sysu@keys}{school}{\def\@school{#1}}
\define@key{sysu@keys}{campus}{\def\@campus{#1}}
\define@key{sysu@keys}{date}{\def\@date{#1}}
% infomation setup command
\newcommand{\info}[1]{
  \kvsetkeys{sysu@keys}{#1}
}

\ifsysu@blindmode
    \define@key{sysu@keys}{author}{\def\@author@zh{***}}
    \define@key{sysu@keys}{author-en}{\def\@author@en{***}}
    \define@key{sysu@keys}{supervisor}{\def\@supervisor@zh{***}}
    \define@key{sysu@keys}{supervisor-en}{\def\@supervisor@en{***}}
    \def\sysu@header{\rightmark}
    \def\sysu@pdfcreator{}
\else
    \def\sysu@header{中山大学\@discipline\@degree 学位论文}
    \def\sysu@pdfcreator{LaTeX with \sysuthesis~\version}
\fi

% the paper geometry setup
\ifsysu@thesis
    \geometry{%
        a4paper,
        left=30mm,right=30mm,top=37mm,bottom=23mm,
        head=30mm, headsep=3mm, foot=6mm, footnotesep=3mm,
        includefoot
    }
\else
    \geometry{%
        a4paper,
        left=25mm,right=25mm,top=25mm,bottom=25mm,
        head=0mm, headsep=0mm, foot=6mm, footnotesep=3mm,
        includefoot
}
\fi

% colors
\definecolor{spablue}{RGB}{45,52,83}
\definecolor{sysugreen}{RGB}{0,86,32}
\definecolor{sysured}{RGB}{115,2,5}

% titlepage setup
\def\sysu@thesistitlepage{%
\begin{titlepage}
    \vspace*{14pt}
    \begin{center}
        \songti{\zihao{3}\@title@zh}\\
        \vspace*{45pt}
        {\fontspec{Times New Roman}{\zihao{-4}\@title@en}}\\
    \end{center}
    \vspace*{55pt}
    \begin{flushleft}
        \songti\zihao{-3}
        \renewcommand\arraystretch{1.2}
        \ziju{0.25}
        \begin{tabular}{p{4.5em}ll}
            &学\hspace*{0.7\ccwd}位\hspace*{0.7\ccwd}申\hspace*{0.7\ccwd}请\hspace*{0.7\ccwd}人：&\@author@zh\\
            &专\hspace*{1.2\ccwd}业\hspace*{1.2\ccwd}名\hspace*{1.2\ccwd}称：&\@major@zh\\
            &导师姓名及职称：&\@supervisor@zh
        \end{tabular}\\
        \vspace*{85pt}
        \bfseries\zihao{-3}
        \ziju{0}
        \begin{tabular}{p{4em}l}
            &答辩委员会主席（签名）：\\
            &委员（签名）：\\
        \end{tabular}
    \end{flushleft}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
\end{titlepage}
}
\def\sysu@proposaltitlepage{%
\begin{titlepage}
    \bfseries\songti
    \vspace*{6pt}
    \begin{center}
        \ziju{0.2}
        {\bfseries\kaishu\zihao{-2}中山大学\@school}\\
        \vspace*{26pt}
        \zihao{2}\@degree 学位论文开题报告
    \end{center}
    \vspace*{8pt}
    \begin{flushleft}
        \bfseries\zihao{-2}题\hspace*{0.5\ccwd}目：\@title@zh
        \vfill
        \zihao{3}
        \renewcommand\arraystretch{1.25}
        \begin{tabular}{p{3em}lp{1em}p{8.5em}}
            &所\hspace*{0.6667\ccwd}在\hspace*{0.6667\ccwd}团\hspace*{0.6667\ccwd}队 & & \@researchteam \\ \cmidrule[1.0pt]{3-4}
            &学\hspace*{4\ccwd}科 & &\@major@zh \\ \cmidrule[1.0pt]{3-4}
            &导\hspace*{4\ccwd}师 & & \@supervisor@zh \\ \cmidrule[1.0pt]{3-4}
            &研\hspace*{1.5\ccwd}究\hspace*{1.5\ccwd}生 & & \@author@zh \\ \cmidrule[1.0pt]{3-4}
            &学\hspace*{4\ccwd}号 & & \@studentid \\ \cmidrule[1.0pt]{3-4}
            &开题报告日期 & & \@date \\ \cmidrule[1.0pt]{3-4}
        \end{tabular}\\
    \end{flushleft}
    \vspace*{114pt}
    \begin{center}
        \zihao{3}
        \@school 制
    \end{center}
    \vspace{32pt}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
\end{titlepage}
\setcounter{page}{1}
\pagenumbering{Roman}
}
\renewcommand{\maketitle}{%
    \ifsysu@thesis
        \ifsysu@checkmode\relax
        \else
            \sysu@thesistitlepage
        \fi
    \else
        \sysu@proposaltitlepage
    \fi
}

% matter text setup
\ctexset{%
    punct       = quanjiao,
    space       = auto,
    autoindent  = true,
}
% set the space between CJK text and Western text, CJK text and inline math formulas
% \xeCJKsetup{CJKecglue={\hskip0pt}}
\setlength\intextsep{0.0pt}
\setlength\abovedisplayskip{0.0pt}
\setlength\abovedisplayshortskip{0.0pt}

% header and footer setup
\pagestyle{fancy}
\fancyhead{}
\ifsysu@thesis
    \fancyhead[OC]{\songti\zihao{-5}\leftmark}
    \fancyhead[EC]{\songti\zihao{-5}\sysu@header}
    \renewcommand{\headrule}{\hrule height 0.8mm \vspace{0.2mm}\hrule height 0.2mm}
    \renewcommand{\headruleskip}{2pt}
\else
    \renewcommand{\headrule}{}
    \renewcommand{\headruleskip}{0pt}
\fi
\fancyfoot{}
\fancyfoot[C]{\zihao{-5}-~\thepage~-}
\fancypagestyle{onlyheadrule}{%
    \fancyhf{}
    \fancyhead{}
    \renewcommand{\headrule}{\hrule height 0.8mm \vspace{0.2mm}\hrule height 0.2mm}
    \fancyfoot{}
    \fancyfoot[C]{\zihao{-5}-~\thepage~-}
}

% format of footnote
\RequirePackage[symbol*,stable,bottom]{footmisc}
\RequirePackage{pifont}
\DefineFNsymbols{pifont-circled}{{\ding{192}}{\ding{193}}{\ding{194}}{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{pifont-circled}

% reset the \cleardoublepage command when blankleft is true
\ifsysu@blankleft
\def\cleardoublepage{\clearpage
    \if@twoside
        \ifodd\c@page
        \else
            {\hbox{}\thispagestyle{empty}\newpage}
            \if@twocolumn
                \hbox{}\newpage
            \fi
        \fi
    \fi
}
\fi
% reset the \cleardoublepage command to \clearpage when checkmode is true
\ifsysu@checkmode
    \def\cleardoublepage{\clearpage}
\fi

% copyright page setup
\def\copyrightpage{%
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
    \cleardoublepage
    \vspace*{36pt}
    \begin{center}\heiti{\zihao{3}学位论文使用授权声明}\end{center}
    \vspace*{24pt}
    \linespread{1.7}
    \songti\zihao{4}
    \hspace{2\ccwd}本人完全了解中山大学有关保留、使用学位论文的规定，即：学校有权保留学位论文并向国家主管部门或其指定机构送交论文的电子版和纸质版；有权将学位论文用于非盈利目的的少量复制并允许论文进入学校图书馆、院系资料室被查阅；有权将学位论文的内容编入有关数据库进行检索；可以采用复印、缩印或其他方法保存学位论文；可以为存在馆际合作关系的兄弟高校用户提供文献传递服务和交换服务。
        
    保密论文保密期满后，适用本声明。
    \par \vspace*{18pt}
    \begin{flushleft}
        \songti\zihao{4}
        学位论文作者签名：\hspace{6\ccwd}  导师签名：
        \par \vspace*{12pt}
        日期：\hspace{2\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日 \hspace{3\ccwd}日期：\hspace{2\ccwd}年\hspace{2\ccwd}月\hspace{2\ccwd}日
    \end{flushleft}
    \cleardoublepage
    }
}
\NewDocumentCommand{\makecopyright}{}{
    \ifsysu@thesis
        \ifsysu@checkmode\relax
        \else
            \ifsysu@blindmode\relax
            \else
                \ifsysu@final\copyrightpage\fi
            \fi
        \fi
    \else
        \relax
    \fi
}

% format of the tableofcontents, listoffigures and listoftables
\tocloftpagestyle{fancy}
\renewcommand*{\contentsname}{目\hspace{\ccwd}录}
\renewcommand{\listfigurename}{插图索引}
\renewcommand{\listtablename}{表格索引}
\setlength{\cftbeforechapskip}{0pt}
\setlength\cftbeforefigskip{\cftbeforechapskip}
\setlength\cftbeforetabskip{\cftbeforechapskip}
\cftsetpnumwidth{1em}
\renewcommand{\cftparskip}{0pt}
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}
\renewcommand{\cftfigpresnum}{图~}
\renewcommand{\cfttabpresnum}{表~}
\cftsetindents{chapter}{0em}{1.5em}
\ifsysu@thesis
    \cftsetindents{section}{1em}{1.5em}
    \cftsetindents{subsection}{2em}{1.5em}
\else
    \cftsetindents{section}{0em}{1em}
    \cftsetindents{subsection}{1em}{1em}
\fi
\cftsetindents{fig}{0em}{3.25em}
\cftsetindents{tab}{0em}{3.25em}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapleader}{\mdseries\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftfigleader}{\cftdotfill{\cftfigdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cfttabdotsep}}
% \renewcommand{\cftchapfont}{\mdseries}
% \renewcommand{\cftchappagefont}{\mdseries}
% \renewcommand{\cftchapafterpnum}{}

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
        \@mkboth{\MakeUppercase\contentsnameen}{\sysu@header}}
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
\def\sysu@setabs@zh{%
    % set the page counter to 1 at abstract
    \setcounter{page}{1}
    \pagenumbering{Roman}
    \pagestyle{onlyheadrule}
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
\def\sysu@setkw@zh{%
    \par \vspace*{12pt}
    {\heiti\zihao{-4}{关键词: }} \songti{\zihao{-4}\@keywords@zh}
    \cleardoublepage
}
\def\sysu@setabs@en{%
    \pagestyle{onlyheadrule}
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
\def\sysu@setkw@en{%
    \par \vspace*{12pt}
    {\zihao{-4}\bfseries KeyWords: \@keywords@en}
    \cleardoublepage
}
\NewDocumentEnvironment{abszh}{}{\sysu@setabs@zh}{\sysu@setkw@zh}
\NewDocumentEnvironment{absen}{}{\sysu@setabs@en}{\sysu@setkw@en}

% format of the bibliography
\newcommand{\makebib}[1]{%
    {%
        \xeCJKsetup{CJKecglue={\hskip0pt}}
        \linespread{1.0}
        \zihao{-4}
        \ifsysu@thesis
            \addcontentsline{toc}{chapter}{参考文献}
            \addcontentsline{toe}{chapter}{References}
        \else
            \addcontentsline{toc}{section}{参考文献}
            \addcontentsline{toe}{section}{References}
        \fi
        \citestyle{super}
        \bibliographystyle{gbt7714-numerical}
        \ifsysu@checkmode
            \nobibliography{#1}
        \else
            \ifsysu@blindmode
                \bibliography{#1}
            \else
                \ifsysu@final
                    \bibliography{#1}
                \fi
            \fi
        \fi    
    }
    \cleardoublepage
}
% new command of the journal name with bibtex for ADS Export Citation (in astrophysics area)
\def\actaa{Acta Astron.} % Acta Astronomica
\def\araa{Annu. Rev. Astron. Astrophys.} % Annual Review of Astron and Astrophys 
\def\aar{Astron. Astrophys. Rev.} % Astrononmy and Astrophysics Review 
\def\ab{Astrobiol.} % Astrobiology
\def\aj{Astron. J.} % Astrononmical Journal
\def\apj{Astrophys. J.}  % Astrophysical Journal
\def\apjl{Astrophys. J. Lett.} % The Astrophysical Journal, Letters
\def\apjs{Astrophys. J. Suppl. Ser.} % Astrophysical Journal, Supplement
\def\ao{Appl. Opt.} % Applied Optics
\def\apss{Astrophys. Space Sci.} % Astrophysics and Space Science
\def\aap{Astron. Astrophys.} % Astronomy and Astrophysics
\def\aapr{Astron. Astrophys. Rev.} % Astronomy and Astrophysics Reviews
\def\aaps{Astron. Astrophys. Suppl.} % Astronomy and Astrophysics, Supplement
\def\baas{Bull. Am. Astron. Soc.} % Bulletin of the AAS
\def\caa{Chinese Astron. Astrophys.} % Chinese Astronomy and Astrophysics 
\def\cjaa{Chinese J. Astron. Astrophys.} % Chinese Journal of Astronomy and Astrophysics 
\def\cqg{Class. Quantum Gravity} % Classical and Quantum Gravity 
\def\gal{Galaxies} % Galaxies
\def\gca{Geochim. Cosmochim. Acta} % Geochimica Cosmochimica Acta
\def\icarus{Icarus} % Icarus 
\def\jcap{J. Cosmol. Astropart. Phys.} % Journal of Cosmology and Astroparticle Physics
\def\jgr{J. Geophys. Res.} % Journal of Geophysics Research
\def\jgrp{J. Geophys. Res.: Planets} % Journal of Geophysics Research: Planets
\def\jqsrt{J. Quant. Spectrosc. Radiat. Transf.} % Journal of Quantitiative Spectroscopy and Radiative Transfer
\def\memsai{Mem. Soc. Astron. Italiana} % Mem. Societa Astronomica Italiana
\def\mnras{Mon. Not. R. Astron. Soc.} % Monthly Notices of the RAS
\def\nat{Nature} % Nature 
\def\nastro{Nat. Astron.} % Nature Astronomy 
\def\ncomms{Nat. Commun.} % Nature Communications 
\def\nphys{Nat. Phys.} % Nature Physics
\def\na{New Astron.} % New Astronomy
\def\nar{New Astron. Rev.} % New Astronomy Review
\def\physrep{Phys. Rep.} % Physics Reports
\def\pra{Phys. Rev. A} % Physical Review A: General Physics
\def\prb{Phys. Rev. B} % Physical Review B: Solid State
\def\prc{Phys. Rev. C} % Physical Review C
\def\prd{Phys. Rev. D} % Physical Review D
\def\pre{Phys. Rev. E} % Physical Review E
\def\prl{Phys. Rev. Lett.} % Physical Review Letters
\def\psj{Planet. Sci. J.} % Planetary Science Journal
\def\planss{Planet. Space Sci.} % Planetary Space Science
\def\pnas{Proc. Natl Acad. Sci. USA} % Proceedings of the US National Academy of Sciences 
\def\procspie{Proc. SPIE} % Proceedings of the SPIE
\def\pasa{Publ. Astron. Soc. Aust.} %Publications of the Astron. Soc. of Australia
\def\pasj{Publ. Astron. Soc. Jpn} % Publications of the ASJ
\def\pasp{Publ. Astron. Soc. Pac.} % Publications of the ASP
\def\rmxaa{Rev. Mexicana Astron. Astrofis.} % Revista Mexicana de Astronomia y Astrofisica \def\sci}{Science} % Science
\def\sciadv{Sci. Adv.} % Science Advances
\def\solphys{Sol. Phys.} % Solar Physics
\def\sovast{Soviet Ast.} % Soviet Astronomy
\def\ssr{Space Sci. Rev.} % Space Science Reviews
\def\uni{Universe} % Universe

% format of chapter, section, subsection, subsubsection, paragraph and subparagraph
\pagestyle{fancy}
\ifsysu@thesis
    \ctexset{%
    chapter = {%
        beforeskip  = 9mm,
        format      = \zihao{-2}\heiti\centering,
        name        = {第~, ~章},
        number      = \arabic{chapter},
        aftername   = \quad,
        afterskip   = 9mm,
        pagestyle   = fancy,
        fixskip     = true,
    },
    section = {%
        fixskip     = true,
        beforeskip  = 7mm,
        indent      = 0pt,
        format      = \zihao{-3}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 7mm,
    },
    subsection = {%
        fixskip     = true,
        beforeskip  = 6mm,
        indent      = 0pt,
        format      = \zihao{4}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 6mm,
    },
    subsubsection = {%
        fixskip     = true,
        beforeskip  = 5mm,
        indent      = 0pt,
        format      = \zihao{-4}\songti,
        name        = {（, ）},
        number      = \chinese{subsubsection},
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
\else
    \renewcommand{\thesection}{\@arabic\c@section}
    \renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
    \renewcommand{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}
    \renewcommand{\theparagraph}{\thesubsubsection.\@arabic\c@paragraph}
    \renewcommand{\thesubparagraph}{\theparagraph.\@arabic\c@subparagraph}
    \ctexset{%
    chapter = {%
        beforeskip  = 5mm,
        format      = \zihao{-3}\heiti\centering,
        aftername   = \quad,
        afterskip   = 5mm,
        pagestyle   = fancy,
        fixskip     = true,
        numbering   = false,
    },
    section = {%
        fixskip     = true,
        beforeskip  = 5mm,
        indent      = 0pt,
        format      = \zihao{-3}\heiti\centering,
        afterindent = true,
        aftername   = ~,
        afterskip   = 5mm,
    },
    subsection = {%
        fixskip     = true,
        beforeskip  = 5mm,
        indent      = 0pt,
        format      = \zihao{4}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 5mm,
    },
    subsubsection = {%
        fixskip     = true,
        beforeskip  = 10.5pt,,
        indent      = 0pt,
        format      = \zihao{-4}\heiti,
        afterindent = true,
        aftername   = ~,
        afterskip   = 10.5pt,
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
\fi
\setcounter{secnumdepth}{3}

% format of itemize and enumerate
\setenumerate{fullwidth,itemindent=\parindent,listparindent=\parindent}
\setlist{noitemsep,topsep=0pt,itemsep=0pt,partopsep=0pt,parsep=0pt}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label = (\arabic*),ref = \arabic*}
\setlist[enumerate,2]{label = (\emph{\alph*}),ref = \theenumi.\alph*}
\setlist[enumerate,3]{label = (\roman*),ref = \theenumii.\roman*}
\newlist{publications}{enumerate}{1}
\newlist{achievements}{enumerate}{1}
\setlist[publications,achievements]{%
    topsep      = 0bp,
    itemsep     = 0bp,
    leftmargin  = 1em,
    labelsep    = 0.5em,
    align       = right,
    label       = [\arabic*],
}

% setup figure, table and equation numbering and lable format
\AtBeginDocument{%
    \ifsysu@thesis
        \def\thefigure{\thechapter{-}\arabic{figure}}
        \def\p@subfigure{\thefigure}
        \def\thetable{\thechapter{-}\arabic{table}}
        \def\theequation{\thechapter{-}\arabic{equation}}
    \else
        \def\thefigure{\arabic{figure}}
        \def\p@subfigure{\thefigure}
        \def\thetable{\arabic{table}}
        \def\theequation{\arabic{equation}}
    \fi
    % 页面的垂直对齐方式, 当页面内容不足时, 这将减少页面顶部和底部之间的间距
    \raggedbottom
}

% tabularray setup
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}
\DefTblrTemplate{contfoot-text}{normal}{下页续}
\SetTblrTemplate{contfoot-text}{normal}
\DefTblrTemplate{conthead-text}{normal}{（续）}
\SetTblrTemplate{conthead-text}{normal}

\SetTblrStyle{caption-tag}{font=\zihao{5}}
\SetTblrStyle{caption-sep}{font=\zihao{5}}
\SetTblrStyle{caption-text}{font=\zihao{5}}
\SetTblrStyle{contfoot-text}{font=\zihao{5}}
\SetTblrStyle{conthead-text}{font=\zihao{5}}
\SetTblrStyle{note-tag}{font=\zihao{5}}
\SetTblrStyle{note-sep}{font=\zihao{5}}
\SetTblrStyle{note-text}{font=\zihao{5}}
\SetTblrStyle{remark-tag}{font=\zihao{5}}
\SetTblrStyle{remark-sep}{font=\zihao{5}}
\SetTblrStyle{remark-text}{font=\zihao{5}}

% setup the bicaption
\DeclareCaptionFont{caption@font}{\zihao{5}}
\captionsetup{font=caption@font}
\DeclareCaptionFont{bi-second}{%
    \zihao{5}
    \def\figurename{Figure}
    \def\tablename{Table}
}
\DeclareFloatingEnvironment[fileext=lof2,chapterlistsgaps=on]{figuresen}[Figiure][List of Figures]
\DeclareFloatingEnvironment[fileext=lot2,chapterlistsgaps=on]{tablesen}[Table][List of Tables]
\PrepareListOf{figuresen}{%
    \renewcommand{\cftfigpresnum}{Figure~}
    \cftsetindents{fig}{0em}{5em}
    \addtocontents{lof2}{\protect\noaddvspace}
}
\PrepareListOf{tablesen}{%
    \renewcommand{\cftfigpresnum}{Table~}
    \cftsetindents{fig}{0em}{4.5em}
    \addtocontents{lot2}{\protect\noaddvspace}
}
\captionsetup[bi-second]{font=bi-second,skip=0pt}

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
\lstdefinestyle{codestyle}{%
    backgroundcolor=\color{blue!5!white},
    commentstyle=\color{gray},
    basicstyle=\ttfamily\footnotesize,
    keywordstyle=\color{violet},
    stringstyle=\color{teal},
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=t,                    
    keepspaces=true,                                               
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,
    numberbychapter=true,
    aboveskip=0pt,
    belowskip=0pt,
    lineskip=0pt,
    tabsize=2
}
\lstset{style=codestyle}
\addto\captionspinyin{%
  \renewcommand\lstlistingname{代码}
  \renewcommand\lstlistlistingname{代码索引}
}
\addto\captionsenglish{%
  \renewcommand\lstlistingname{Code}
  \renewcommand\lstlistlistingname{List of Codes}
}
\DeclareFloatingEnvironment[fileext=lol2,chapterlistsgaps=on]{lstlistingsen}[Code][List of Codes]
\PrepareListOf{lstlistingsen}{%
    \renewcommand{\cftfigpresnum}{Code~}
    \cftsetindents{fig}{0em}{4.5em}
    \addtocontents{lol2}{\protect\noaddvspace}
}
\begingroup
    \let\newcounter\@gobble\let\setcounter\@gobbletwo
    \globaldefs\@ne \let\c@loldepth\@ne
    \newlistof{listings}{lol}{\lstlistlistingname}
\endgroup
\let\l@lstlisting\l@listings
\renewcommand{\lstlistoflistings}{\listoflistings}
\renewcommand\cftlistingspresnum{代码~}
\cftsetindents{listings}{0em}{4.5em}

% create some new document environment
\NewDocumentEnvironment{conclusion}{}{%
    \ctexset{chapter/numbering=false}\chapter{结\hspace{\ccwd}论}
    \addcontentsline{toe}{chapter}{Conclusions}
}{}

\NewDocumentEnvironment{appendixenv}{ +b }{%
    \ifsysu@checkmode\relax
    \else
        \ctexset{
            subsubsection = {%
                fixskip     = true,
                beforeskip  = 12pt,,
                indent      = 0pt,
                format      = \bf \zihao{-4}\songti,
                afterindent = true,
                aftername   = ,
                afterskip   = 14pt,
            },
        }
        #1
    \fi
}{}

\NewDocumentEnvironment{acknowledgements}{ +b }{%
    \ifsysu@checkmode\relax
    \else\ifsysu@blindmode\relax
        \else\ifsysu@final
            \ctexset{chapter/numbering=false}\chapter{后记}
            \addcontentsline{toe}{chapter}{Acknowledgements}
            #1
            \fi
        \fi
    \fi
}{\cleardoublepage}

\RequirePackage{bibentry}
% \ifsysu@checkmode\let\saved@bibitem\@bibitem\fi
\RequirePackage{hyperref}
% \ifsysu@checkmode\let\@bibitem\saved@bibitem\fi

 % hyperlinks style
\hypersetup{%
    colorlinks=true,
    pdfborder={0 0 0},
    bookmarksnumbered=true,
    linkcolor=black,
    filecolor=magenta,  
    citecolor=spablue,    
    urlcolor=sysugreen,
}
\urlstyle{rm}

% pdf documentinfo
\AtBeginDocument{%
    \hypersetup{%
        pdfauthor={\@author@zh},
        pdftitle={\@title@zh},
        pdfkeywords={\@keywords@zh},
        pdfcreator={\sysu@pdfcreator},
    }
}

% renew the refnames of some environment
\AtBeginDocument{%
    \def\figureautorefname~#1\null{图~#1~\null}
    \def\tableautorefname~#1\null{表~#1~\null}
    \def\appendixautorefname~#1\null{附录~#1~\null} 
    \def\equationautorefname~#1\null{公式~(#1)~\null}
    \def\chapterautorefname~#1\null{第#1章\null}
    \def\sectionautorefname~#1\null{第#1节\null}
    \def\AMSautorefname~#1\null{公式~(#1)~\null}
    \def\theoremautorefname~#1\null{#1~\null}
    \def\proofautorefname~#1\null{\null}
    \renewcommand{\thelstlisting}{\thechapter-\arabic{lstlisting}}
}

\endinput