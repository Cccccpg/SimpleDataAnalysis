# -*- coding = UTF-8 -*-
# @Time ： 2023/7/9 12:14
# @Author : Cccccpg
# @File : test.py
# @Software : PyCharm

# -*- coding: utf-8 -*-
import os
import re
import jieba
import chardet
import pandas as pd
from collections import Counter

# 定义要读取的文件夹路径和Excel文件路径
folder_path = 'E:\\PythonCode\\ansisy\\data02'
excel_file = 'keywords.xlsx'

# 读取Excel表中的关键词
keywords = pd.read_excel(excel_file, header=None)[0].tolist()

# 定义表格的列名
columns = ['文件名', '文本总长度', '文本总长度-仅中英文', '全模式', '精确模式'] + keywords

# 创建一个空的数据列表
data = []

# 定义停用词列表（可选）
stopwords = []

def detect_encoding(file_path):
    with open(file_path, 'rb') as file:
        raw_data = file.read()
        result = chardet.detect(raw_data)
        encoding = result['encoding']
    return encoding

# 遍历文件夹下的所有文件
for root, dirs, files in os.walk(folder_path):
    # 获取当前文件夹名
    folder_name = os.path.basename(root)

    for file in files:
        file_path = os.path.join(root, file)

        if file.endswith('.txt'):

            # 读取文件并根据编码进行解码
            file_encoding = detect_encoding(file_path)
            # 读取txt文件内容
            with open(file_path, 'r', encoding=file_encoding) as f:
                text = f.read()

            # 统计文本总长度
            text_length = len(text)

            # 移除标点符号和空格
            text_clean = re.sub(r'[^\w\s]', '', text)
            # 统计无标点符号和空格的长度
            text_clean_length = len(text_clean)

            # 全模式
            full_mode_words = jieba.lcut(text, cut_all=True)
            full_mode_words_counts = dict(Counter(full_mode_words))

            # 精确模式
            exact_mode_words = jieba.lcut(text)
            exact_mode_words_counts = dict(Counter(exact_mode_words))

            # 统计关键词出现的频次
            keyword_counts = {}
            for keyword in keywords:
                count = text.count(keyword)
                keyword_counts[keyword] = count

            # 删除文件名中的特定字符串
            file = file.replace('政府工作报告', '')
            file = file.replace('.txt', '')
            file = file.replace('年', '_')

            # 将数据添加到列表中
            row_data = [file, text_length, text_clean_length, len(full_mode_words_counts), len(exact_mode_words_counts)] + list(keyword_counts.values())
            data.append(row_data)

# 创建DataFrame对象
df = pd.DataFrame(data, columns=columns)

# 将DataFrame导出为Excel表格
df.to_excel('result.xlsx', index=False)

print("Data export is complete.")









