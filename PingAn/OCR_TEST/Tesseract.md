---
title: "Batch OCR sample"
output: pdf_document
mainfont: Noto Serif CJK TC
---

# Aim

Converting bulk images into text format, combine with <code>find</code> instruction for the convinence of searching information of documentations.

# OCR software

Recommending [tesseract](https://github.com/tesseract-ocr/tesseract) as it provide both command line options and python packages.

## Download & Install

### Linux

Using pacman:

```shell
sudo pacman -S tesserat
```

Other package managers could run the similar command.

Install language packages:

```shell
sudo pacman -S tesserat-data-<language package name>
```

Usually <code>tesseract-data-chi_sim</code> for Chinese, and <code>tesseract-data-eng</code> for english.

### Winsows

For windows, download installer from [website](https://github.com/UB-Mannheim/tesseract/wiki), and select relavent language packages.

### Testing

Once finished, test command line with:

<a id="langpac"></a>
```shell
$ tesseract --list-langs
List of available languages (4):
chi_sim
chi_tra
eng
osd
```

## Usage

## Command line

Tesseract is a command line tool that transfer image files into text file.

The normal command line format is as follow:

```shell
tesseract <path/to/image/file> <path/to/output/file> -l <language package>
```

[language package](#langpac) results from <code>tesseract --list-langs</code>.

Example is as follow:

```shell
tesseract ./file_0/image-000.tif ./file_0/test-000.txt -l chi-sim
```

## Python

Install [python package](https://pypi.org/project/tesseract/), and following the [tutorials](https://pytesseract.readthedocs.io/en/latest/tutorials.html) with goot examples of how to apply relative functions in python.

# Sample Program

We list a sample program that will transfer bulk <code>.pdf</code> contained images into text using <code>teaseract</code> using command lines. Due to the reason of multi-processing to speed up the transfer.

## Pdfimages

Tools to retrive pdf format into images, format as follow:

```shell
pdfimages -tiff <path/to/image/file> <path/to/output/file>
```

## Python script

```python
import os
import time

direct = os.popen("ls | grep pdf").read().splitlines()
tmp = [0 for i in range(8)]

for i in range(len(direct)):
    # Popen will open a new process, program need to Wait untill process 
    # finished and close
    # "2" = stderr, "1" = stdout
    # "2>err.log" = output stderr to err.log
    # "1>err.log 2>&1" = output stderr to stdout, then output stdout to 
    #                    err.log. "2>&1" must behind "1>err.log", since 
    #                    parameters are read backward
    os.popen("mkdir file_"+str(i)+" 2>>err.log").close()
    os.popen("cp \""+direct[i] + "\" ./file_"+str(i)+" 2>>err.log").close() 
    os.popen("pdfimages -tiff ./file_"+str(i)+"/"+direct[i]+" ./file_"+str(i)+
    "/image 2>>./file_"+str(i)+"/err.log 0>&2").close()
    tmp = os.popen("ls ./file_"+str(i)+" | grep tif").read().splitlines()
    for j in range(int(len(tmp)/8) + 1):
        for k in range(8):
            idx = j*8 + k
            if idx < len(tmp):
                tmp[k] = os.popen("tesseract ./file_"+str(i)+"/"+tmp[idx]+" ./file_"+
                str(i)+"/text_"+str(idx)+" -l chi_sim 2>>./file_"+str(i)+"/err.log 0>&2")
        for k in range(8):
            idx = j*8 + k
            if idx < len(tmp):
                tmp[k].close()
    print(str(i)+" finished")
```

# Find content

## Linux

Using <code>grep</code> instruction in terminal:

```shell
grep -r <content> <path>
```

Sample as follow:

```shell
$ grep -r "医疗机构" ./
./file_13/text_3.txt:噩疗救助及政府兜底资全口医疗机构垫付
./file_10/text_4.txt:同'医疗机构多次住院的只计′次起付线。
./file_10/text_5.txt:医疗机构按病种付费定点医院 怡 点 病 种 、 贻 用 定 额 、 特 殊
./file_10/text_5.txt:盆困人口在省内医疗机构
```

## Windows

Using <code>findstr</code> instruction in terminal:

```shell
findstr /s /c:<content> <path\to\dir>\<file.format>
```

Sample as follow:

```shell
findstr /s /c:"import IO" .\*
```