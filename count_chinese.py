from pathlib import Path
import re

class ChineseCharacterCounter:
    def __init__(self, folder_path, exclude_files = None,exclude_cmds = ''):
        self.folder_path = Path(folder_path)
        self.exclude_files = set(exclude_files) if exclude_files else set(['setup.tex'])
        self.exclude_cmds = exclude_cmds
        self.total_chinese_characters = 0

    def remove_comments(self, text):
        # 去掉注释内容
        return re.sub(r'%.*?\n', '', text)

    def remove_text_in_commands(self, text):
        # 排除掉命令中的内容
        if self.exclude_cmds == '':
            exclude_cmds = 'chapter'
        else:
            exclude_cmds = '|'.join(self.exclude_cmds)
        return re.sub(r'\\(' + exclude_cmds + '){.*?}\n', '', text)

    def count_chinese_characters(self, text):
        # 统计中文字数
        chinese_characters = [char for char in text if '\u4e00' <= char <= '\u9fff']
        return len(chinese_characters)

    def process_tex_file(self, tex_file_path):
        with open(tex_file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            
        content = self.remove_comments(content)
        content = self.remove_text_in_commands(content)
        chinese_character_count = self.count_chinese_characters(content)
        self.total_chinese_characters += chinese_character_count

        print(f'{tex_file_path} 文件里的中文字数是: {chinese_character_count}')

    def process_all_tex_files(self):
        for tex_file_path in self.folder_path.rglob('*.tex'):
            # 排除掉的文件
            if tex_file_path.name in self.exclude_files:
                pass
            else:
                self.process_tex_file(tex_file_path)

        print(f'总的中文字数是: {self.total_chinese_characters}')

# 当前目录
folder_path = './'
# 排除掉的 tex 文件
exclude_files = ['setup.tex']
# 排除掉的命令
exclude_cmds = ['chapter', 'section']
# 设置计数器
counter = ChineseCharacterCounter(folder_path, exclude_files = exclude_files, exclude_cmds = exclude_cmds)
# 对所有tex文件计数
counter.process_all_tex_files()