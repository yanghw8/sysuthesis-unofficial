 # sysuthesis-unoffical

**sysuthesis-unoffical**是旨在为中山大学熟悉LaTeX语言的研究生提供一个方便易用的学位论文写作模版，其设置的排版格式力求尽可能符合《[中山大学研究生学位论文格式要求]({https://sysgraduate.sysu.edu.cn/sites/graduate.prod.dpcms4.sysu.edu.cn/files/2019-04/%E4%B8%AD%E5%B1%B1%E5%A4%A7%E5%AD%A6%E7%A0%94%E7%A9%B6%E7%94%9F%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E6%A0%BC%E5%BC%8F%E8%A6%81%E6%B1%82.pdf})》。

本模版暂时没有为本科生学位论文设置格式，如果您是本科生，请移步至[sysu-thesis](https://github.com/SYSU-SCC/sysu-thesis)。如果您没有接触过LaTeX，又不打算花费时间和精力来入门，推荐您使用Microsoft Office套装来编写您的学位论文。

## 声明

**本模版不是官方模版，无法保证它完全符合学校的相关要求，在开始使用前，您同意，任何由于本模板而引起的论文格式审查问题与本模板作者无关。**

## 更新描述

### v1.1.0 2023/03/03

-   增加以下模版选项：

    -   `doctype`，可选 `thesis`\|`proposal`
        (`<default> = thesis`)，分别为学位论文和开题报告的格式。

    -   `printmode`，可选 `final`\|`checkmode`\|`blindmode`
        (`<default> = final`)，分别为终稿、查重和盲审的打印模式。

    -   `openright`\|`openany`，互为 `true`\|`false`
        (`<default> = openright`)。`openright`
        选项为每一章在右页（奇数页）开始，`openright`
        选项为在上一章结束的下一页开始。

    -   `blankleft` (`<default> = false`)，当 `blankleft = true`
        时，章节结束的偶数页如果没有内容，使之空白，但页码计数器仍然有效。

-   增加了 `appendixenv`、`publications`和`achievements`
    环境，分别为附录、学术论文发表列表和学术成果列表的环境。

-   对论文扉页进行了微调。

-   修改 `lstlisting` 双语标题格式，微调相关颜色。

-   增加了 NASA/ADS Export Citation 的期刊名命令，不需要再手动修改以避免
    编译出错。

### v1.0.1 2022/03/06

-   最新适配物理与天文学院的格式要求，调整了参考文献的引用格式并添加文献类型标识，将中文与西文之间的一个半角字符的自动间距关闭。`\texttt`命令只在本文档用以展示命令，不建议大家使用。

### v1.0 2022/02/23

-   最初版本。

## 注意事项

本模版预设的封面、原创性声明及使用授权说明页、摘要页均以物理与天文学院的格式要求为主。如果您所在学院的要求与本模版预设的不同，建议参考以下
项的说明，正文以及参考文献部分各学院的要求应该是一致的。

-   一般而言，通常不需要在中英文之间添加额外的空格，但为了代码的可读性（良好的习惯），还是建议在中文字符和
    English 字符之间加上空格。

-   对于扉页，如果对本模版预设的扉页不满意，可以使用 `pdfpages` 宏包中的
    `\includepdf` 命令导入您的扉页的 PDF 文件，例如

    ``` {.latex language="TeX"}
    \includepdf{titlepage.pdf}
    ```

    其中 `titlepage.pdf` 为扉页的 PDF 文件。

-   同样的，对于原创性及使用授权说明页，也可以利用类似的方法：

    ``` {.latex language="TeX"}
    \includepdf{copyrightpage.pdf}
    ```

    其中 `copyrightpage.pdf` 为扉页的 PDF
    文件（可以为签字过后的扫描文件）。

-   对于摘要页，在使用类似上述的命令之后，此外还应将摘要加入目录，因此建议使用以下命令

    ``` {.latex language="TeX"}
    \addcontentsline{toc}{chapter}{\protect 摘\hspace*{2\ccwd}要}
    \addcontentsline{toe}{chapter}{Abstract (In Chinese)}
    \includepdf{abstract-zh.pdf}
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \addcontentsline{toe}{chapter}{Abstract (In English)}
    \includepdf{abstract-en.pdf}
    ```

    其中 `abstract-zh.pdf` 和 `abstract-en.pdf` 分别为中英文摘要页的 PDF
    文件。

-   对于插图和表格的标题，本模版推荐使用 `bicaption` 宏包的 `\bicaption`
    命令，具体用法为:

    ``` {.latex language="TeX"}
    \bicaption[中文短标题]{中文标题}[英文短标题]{英文标题}
    ```

    其中，短标题在插图索引或者表格索引中展示，而标题则在插图下方或者表格上方展示，见[\[fig:hexbin\]](#fig:hexbin){reference-type="ref"
    reference="fig:hexbin"}示例。

-   在图表标题中，出现了引用文献后字号变回正文字号的问题，该问题有一个简单的解决方法，即使用
    `{\cite{key}}` 来避免上述问题发生。

## 使用方法

本模版仅支持XeTeX排版引擎，其相应的编译命令称为`xelatex`，字符编码仅支持UTF-8，进行编译时，您需要使用正确编译器。本模版需要编译的主文件为`main.tex`，在编译时请选择`xelatex`编译命令，由于是中文文档并且与BibTeX配合使用，请遵从以下编译步骤：

* `xelatex`
* `bibtex`
* `xelatex`
* `xelatex`

如此您将得到一个最终完成的PDF文件。

Overleaf对免费用户只开放了1分钟以内的编译时长，本模版上传至Overleaf编译时长超过1分钟，所以建议您在本地编译，并养成时常备份的好习惯。

如果您使用Visual Studio Code来作为LaTeX编辑器，您需要设置`settings.json`来定制您的编译链，配置代码在`main.pdf`里有说明。

## 致谢

本模版在编写的过程当中，遇到了不少问题，也参考了许多小组以及个人的工具和模版：

* 感谢[CTex-kit](https://github.com/CTeX-org/ctex-kit)提供了LaTeX的中文支持，其开发的[CTeX](https://ctan.org/tex-archive/language/chinese/ctex)宏集在章节格式的排版上提供了很大的方便；
* 感谢[白鸽坐飞机](https://www.zhihu.com/people/sgcd-33)师兄，本模版在排版上主要参考了他的[中山大学研究生毕业论文模板SYSUpalte](https://www.overleaf.com/latex/templates/zhong-shan-da-xue-yan-jiu-sheng-bi-ye-lun-wen-mo-ban-sysupalte/kybsnywqbcdc)；
* 感谢[SJTUThesis](https://github.com/sjtug/SJTUThesis)模板的制作小组和[李振楠](https://github.com/nanmu42)（[CQUThesis](https://github.com/nanmu42/CQUThesis)），本模版在编写文档类的过程中主要参考了他们的成果，获益匪浅；
* 感谢[Patrick W. Daly](https://www.ctan.org/author/daly)，本模版在制作参考文献引用格式时使用了他的[custom-bib](https://www.ctan.org/tex-archive/macros/latex/contrib/custom-bib/)工具；

向你们致以真诚的敬意和由衷的感谢！

## 推荐读物
本文档不是LaTeX的入门教程，因此不会对复杂的LaTeX代码进行介绍。如果您只是用来编写您的学位论文，完全可以将源代码里的内容替换成你的内容，然后经过若干次复制、粘贴和修改，最终您会得到你所需要的文档。然而，有时候您想实现一些自己的个性化内容，希望下面推荐的读物可以帮助到您：
* [Overleaf：Documentation](https://www.overleaf.com/learn)，在线英文文档，在里面实现不同功能的LaTeX示例应有尽有；
* 《[一份不太简短的LaTeX2e介绍](http://www.ptep-online.com/ctan/lshort_chinese.pdf)》；
* 《[简单粗暴LaTeX](https://github.com/wklchris/Note-by-LaTeX)》；

最后祝您使用愉快！

## 联系方式

任何有关本模版的问题以及建议，欢迎通过以下其一方式来联系我：
* 本模版的[企鹅交流群](https://jq.qq.com/?_wv=1027&k=eA9mGWmS)，主要用于本模版的维护和交流，常用；
* 我的个人[B站号](https://space.bilibili.com/326100515)，常用，一般能很快看到消息；
* 我的联系邮箱：<yanghewen8@gmail.com>。
