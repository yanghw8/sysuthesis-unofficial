# sysuthesis-unoffical

**sysuthesis-unoffical**是旨在为中山大学熟悉LaTeX语言的研究生提供一个方便易用的学位论文写作模版，其设置的排版格式力求尽可能符合《[中山大学研究生学位论文格式要求]({https://sysgraduate.sysu.edu.cn/sites/graduate.prod.dpcms4.sysu.edu.cn/files/2019-04/%E4%B8%AD%E5%B1%B1%E5%A4%A7%E5%AD%A6%E7%A0%94%E7%A9%B6%E7%94%9F%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E6%A0%BC%E5%BC%8F%E8%A6%81%E6%B1%82.pdf})》。

本模版暂时没有为本科生学位论文设置格式，如果您是本科生，请移步至[sysu-thesis](https://github.com/SYSU-SCC/sysu-thesis)。如果您没有接触过LaTeX，又不打算花费时间和精力来入门，推荐您使用Microsoft Office套装来编写您的学位论文。

## 声明

**本模版不是官方模版，无法保证它完全符合学校的相关要求，在开始使用前，您同意，任何由于本模板而引起的论文格式审查问题与本模板作者无关。**


## 使用方法

本模版仅支持XeTeX排版引擎，其相应的编译器称为“xelatex”，字符编码仅支持UTF-8，进行编译时，您需要使用正确编译器。本模版需要编译的主文件为`main.tex`，在编译时请选择“xelatex”编译器，由于是中文文档并且与BibTeX配合使用，请遵从以下编译步骤：

* xelatex
* bibtex
* xelatex
* xelatex

如此您将得到一个最终完成的PDF文件。

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
* [Overleaf：Documentation](https://www.overleaf.com/learn)，在线英文文档，在里面实现不同功能的$LaTeX示例应有尽有；
* 《[一份不太简短的LaTeX2e介绍](http://www.ptep-online.com/ctan/lshort_chinese.pdf)》；
* 《[简单粗暴LaTeX](https://github.com/wklchris/Note-by-LaTeX)》；

最后祝您使用愉快！

## 联系方式

任何有关本模版的问题以及建议，欢迎通过以下其一方式来联系我：
* 本模版的[企鹅交流群](https://jq.qq.com/?_wv=1027&k=eA9mGWmS)，主要用于本模版的维护和交流；
* 我的个人[B站号](https://space.bilibili.com/326100515)，常用，一般能很快看到消息；
* 我的联系邮箱：<yanghewen8@gmail.com>。