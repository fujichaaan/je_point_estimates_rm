# je_point_estimates_rm
This page is for summarizing code and figures for the letter published in the <i>Journal of Epidemiology</i> (Fujii R. 2023).

# Fujii R. Visualization in relative measures of association: points and error bars. Journal of Epidemiology, 2023.

(Insert of Image)
<br>
<br>


## 1. Motivation 🌱
The relative measures (e.g. odds ratio and hazard ratio) are one of the most reported indices in statistical analysis for epidemiology. However, there are many incautious graphic presentation for these indices in both scientific papers and dissemination to the public.
This letter is inspired by the previous correspondence by in <i>Lancet</i>

<br>

## 2. Purpose 🕵️
There are two main purposes in this letter:
- to provide what is not good in conventional graphic presentation
- to provide how to improve such incautious figures

<br>

## 3. Key messages 🔑  R code is <a href="https://github.com/fujichaaan/je_point_estimates_rm/blob/main/code_figures.R">here</a>
To show the point estimates for relative measures, there are three main key messages as follows:

![Figure1](https://user-images.githubusercontent.com/19466700/220636651-3529c453-cf69-43b7-a604-fb80acf0cedb.jpg)

### 1. Starting from 1 (A vs. B)
In panel A, OR=2.0 seems to be fourth bigger than OR=0.5, while panel B shows each bar graph start from 1.
It is much better than the the 0-starting bar chars, but still problematic...

<br>

### 2. Use logarithmic scale (B vs. C)
In panel B, OR=2.0 seems to be twice bigger than OR=0.5, but panel C improve the magnitude of effect size.
Therefore, although it can make fair comparison for OR=2.0 and OR=0.5, it is unclear for statistical significance yet.

<br>

### 3. Use point + error bars (C vs. D)
In panel C, we can make fair comparison of effect sizes, however, it remains unclear whether error bar crosses 0 or not.
To improve this defect, the panel D shows better data visualization for relative measures to clearly shows confidential intervals.

<br>

## 4. Inquires　📨
If you have any questions, please feel free to contact me 😎

<b>Ryosuke FUJII, PhD.</b><br>
Eurac Research/Fujita Health University<br>
rfujii [at] fujita-hu.ac.jp
