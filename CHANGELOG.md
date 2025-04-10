# sysuthesis-unofficial 的修订记录

### v1.1.6 2025/04/10

- 增加摘要环境的 `noinfo` 选项，允许用户在摘要中不显示作者信息。
- 修复 $\hbar$ 输出错误问题，修复参考文献的引用标注排序问题。
- 更新查重和盲审模式下的输出，查重模式保留附录，盲审模式保留学校信息。
- 更新 VSCode 的 `latex-workshop` 插件的推荐配置，使用[王然老师的配置](https://github.com/OsbertWang/install-latex-guide-zh-cn)。

### v1.1.5 2024/04/12

-   增加了 `blindthis[<replace>]{<content>}` 命令，用于在盲审模式下（即 `printmode=blindmode`）替换内容。在非盲审模式下，该命令不会有任何效果。在盲审模式下，该命令会将 `<content>` 替换为 `<replace>`；如果直接使用 `\blindthis{<content>}` 命令，则内容不会打印出来。
-   微调 `publications` 和 `achievements` 环境中标签的左边距。

### v1.1.4 2024/04/10

-   修复了附录章在英文模式下的标签名，从 Chapter 改为 Appendix。并且新增了两个无标签章的命令 `\notagchapter` 和 `\notagchapteren`，用于不带章节标签的章节。
-   对图表标题的对齐方式进行了调整，使之居中，并将之前第二标题的额外空格去除。
-   完善 `algorithm2e` 标题的格式，使之与图表标题一致。

### v1.1.3 2024/03/30

-   在模板参数中对 `gbt7714` 宏包进行参数传递，可以使用著者-出版年制的参考文献格式。
-   使用 `algorithm2e` 宏包定制算法环境。
-   增加 `language` 选项，可选 `chinese` | `english` ( `<default> = chinese`)，或 `zh` | `en`。如果选项为 `language=english`（或 `language=en`），这将会将章节图表等的标题语言设置为英文。
-   将 `\info` 命令改为 `\sysuset`，对模版的一些参数（如图表标签名和 `acknowledgements` 环境名称等）任由用户自定义，详情见 `setup.tex` 文件。
-   `openany`、`openright` 和 `fontset` 为 `ctexbook` 文档类的选项，不应作为模板的选项，现已移除。
-   撤销将 `\ref` 命令的引用格式重设为 `（\autoref{key}）` 的更改。
-   解决了一些与 `hyperref` 宏包的冲突问题。

### v1.1.2 2024/03/14

-   放弃自制的 `sysuthesis.bst`，改用 `gbt7714` 宏包。
-   增加 `count_chinese.py` Python 脚本，用于统计中文字数。
-   重新设置论文信息的设置方式，即键值对（key-value）的格式，更加友好。
-   修改了`checkmode`的版面，去除无效的空白页。
-   添加了中山大学的颜色 `sysugreen`、 `sysured` 和 `spablue`。
-   给出了长表格的示例，并配置了 `tabularray` 的风格。

### v1.1.1 2023/03/30

-   使用 `\raggedbottom` 调整页面的垂直对齐方式, 当页面内容不足时,
    这将减少页面顶部和底部之间的间距，使得页面看起来更加紧凑。

-   增加 `fontset` 选项 (`<default> = fandol`)，指定CTeX宏集加载的字库，详情请查看CTeX宏集的具体说明。例如，如果您的系统为Windows，则可以用以下选项：

    ``` {.latex language="TeX"}
    \documentclass[doctype=thesis,printmode=final,openright,blankleft,fontset=windows]{sysuthesis}
    ```

    如果您在 Overleaf 上编译，则可以设置为:

    ``` {.latex language="TeX"}
    \documentclass[doctype=thesis,printmode=final,openright,blankleft,fontset=ubuntu]{sysuthesis}
    ```

    目前 Mac OS 可以暂时使用 `fontset=macnew`，依然解决不了找不到对应字体的警告问题，但无伤大雅。

-   对一些笔误进行了修改。

### v1.1.0 2023/03/03

-   增加以下模版选项：

    -   `doctype`，可选 `thesis`\|`proposal` (`<default> = thesis`)，分别为学位论文和开题报告的格式。

    -   `printmode`，可选 `final`\|`checkmode`\|`blindmode`
(`<default> = final`)，分别为终稿、查重和盲审的打印模式。

    -   `openright`\|`openany`，互为 `true`\|`false` (`<default> = openright`)。`openright` 选项为每一章在右页（奇数页）开始，`openany` 选项为在上一章结束的下一页开始。

    -   `blankleft` (`<default> = false`)，当 `blankleft = true` 时，章节结束的偶数页如果没有内容，使之空白，但页码计数器仍然有效。

-   增加了 `appendixenv`、`publications` 和 `achievements` 环境，分别为附录、学术论文发表列表和学术成果列表的环境。

-   对论文扉页进行了微调。

-   修改 `lstlisting` 双语标题格式，微调相关颜色。

-   增加了 NASA/ADS Export Citation 的期刊名命令，不需要再手动修改以避免编译出错。

### v1.0.1 2022/03/06

-   最新适配物理与天文学院的格式要求，调整了参考文献的引用格式并添加文献类型标识，将中文与西文之间的一个半角字符的自动间距关闭。`\texttt` 命令只在本文档用以展示命令，不建议大家使用。

### v1.0 2022/02/23

-   最初版本。