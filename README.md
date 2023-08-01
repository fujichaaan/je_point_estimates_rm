# Fujii R. Visualization of relative measures of association: points and error bars with an appropriate axis scale. J Epidemiol, 2023.

This page is for summarizing code and figures for the letter published in the <i>Journal of Epidemiology</i> (Fujii R. 2023).


(Insert of Image)
<br>
<br>


## 1. Motivation 🌱
The relative measures (e.g. odds ratio and hazard ratio) are one of the most reported indices in statistical analysis for epidemiology. However, there are many incautious graphic presentation for these indices in both scientific papers and dissemination to the public.

<br>

## 2. Purpose 🕵️
There are two main purposes in this letter:
- To summarize the current situation of graphcal presentation in the journals
- To revisit the points to be considered in Figures

<br>

## 3. Literature review　 🖥
Breif literature review was performed in the original articles published in the following journals between April 2022 and March 2023<sup>a,b</sup>.<br>

- The American Jounral of Epidemiology
- The European Journal of Epidemiology
- The International Journal of Epidemiology
- The Journal of Epidemiology

The results are shown here:

 <table>
    <tr>
      <th>Journals</th>
      <th>Inappropriate [Axis starting from 0]<sup>c</sup></th>
      <th>Inappropriate [Axis with an arithmetic scale]<sup>c</sup></th>
      <th>Inappropriate [Undetermined]<sup>c,d</sup></th>
      <th>Inappropriate [Total]</th>
      <th>Appropriate</th>
      <th>N of papers presenting RR as figures<sup>e</sup></th>
      <th>N of papers presenting RR as tables<sup>e</sup></th>
    </tr>
    <tr>
      <td>Am J Epi</td>
      <td>2</td>
      <td>12</td>
      <td>0</td>
      <td>12<br>(48.0%)</td>
      <td>13<br>(52.0%)</td>
      <td>25</td>
      <td>45</td>
    </tr>
    <tr>
      <td>Eur J Epi</td>
      <td>0</td>
      <td>13</td>
      <td>0</td>
      <td>13<br>(44.8%)</td>
      <td>16<br>(55.2%)</td>
      <td>29</td>
      <td>27</td>
    </tr>
    <tr>
      <td>Int J Epi</td>
      <td>0</td>
      <td>16</td>
      <td>0</td>
      <td>16<br>(42.1%)</td>
      <td>22<br>(57.9%)</td>
      <td>38</td>
      <td>49</td>
    </tr>
    <tr>
      <td>J Epi</td>
      <td>1</td>
      <td>8</td>
      <td>1</td>
      <td>9<br>(90.0%)</td>
      <td>1<br>(10.0%)</td>
      <td>10</td>
      <td>30</td>
    </tr>
  </table>

<br>

<sup>a</sup>If an article presented Figures in both appropriate and inappropriate ways, it was categorized as "inappropriate".<br>
<sup>b</sup>In this literature review, there was no example like Figure 1C (non-transparent bar + error bars with a logarithmic scale).<br>
<sup>c</sup>If an article has multiple issues, each issue is counted up.<br>
<sup>d</sup>"Undetermined" includes problems for strange scale for risk ratio.<br>
<sup>e</sup>If an article reported both Table and Figure, each type is counted up.<br>

<br>

## 4. Key Tips 🔑 
To show the point estimates for relative measures in association, there are three main key points to be considered as follows.
R codes for these plots are <a href="https://github.com/fujichaaan/je_point_estimates_rm/blob/main/code_figures.R">here</a>

![Figure1](https://user-images.githubusercontent.com/19466700/223692748-e4871878-9ca1-4a65-a375-08d3634933b7.png)

### 1. Starting from 1 (A vs. B)
In panel A (starting from 0), OR=2.0 seems to be four times bigger than OR=0.5, while panel B shows each bar graph start from 1.
It is much better than the the 0-starting bar chars, but panel B is still problematic...


### 2. Use logarithmic scale (B vs. C)
In panel B, OR=2.0 seems to be twice bigger than OR=0.5, but panel C improve the magnitude of effect size.
Therefore, although it can make fair comparison for OR=2.0 and OR=0.5 (different direction), it is unclear for statistical significance yet.


### 3. Use point + error bars (C vs. D)
In panel C, we can make fair comparison of effect sizes, however, it remains unclear the range of confidentce intervals.
To improve this point, the panel D shows better data visualization for relative measures to clearly shows confidential intervals.
(Another solution would make bars transparent)

<br>

## 5. More practical examples 🤼
Here we prepare codes for more practical examples for relative measures including point estimates and others.
Please check R codes <a href="https://github.com/fujichaaan/je_point_estimates_rm/blob/main/code_practices.R">here</a>

### 1. Point estimates for each variables in regression analyses (using R "forplo" package)

![PRAC1](https://user-images.githubusercontent.com/19466700/223471763-e969ec6c-b6b4-43bc-94f9-d7a916058554.jpeg)


### 2. Forest plots for summarizing previous studies (using R "forplo" package)

![PRAC2](https://user-images.githubusercontent.com/19466700/223471819-af080dfc-0f26-44f7-b371-f4f994d2ae70.jpeg)


### (3. Non-linear association between exposure and binary outcome) (using R "ggplot2" package)

![PRAC3](https://user-images.githubusercontent.com/19466700/223697190-42cfb1b5-8aaf-4ebc-b565-c22da554ca9a.jpg)

<br>


## 6. Final caution ⚠

Please keep in your mind that there is a trade-off between visualizing the results in Figures and showing them as Tables, in other words, it is often impossible to correctly reproduce numerical results from Figures.

<br>


## 7. References 📚
1.	Szklo M, Nieto FJ. Epidemiology beyond the Basics. 2nd Edition, Jones and Bartlett Publishers, Boston. Sudbury, MA: Jones & Bartlett, 2007;368–70.
2.	Hosseinpoor AR, Abouzahr C. Graphical presentation of relative measures of association. Lancet. 2010;375:1254.
3.	Levine MA, El-Nahas AI, Asa B. Relative risk and odds ratio data are still portrayed with inappropriate scales in the medical literature. J Clin Epidemiol. 2010;63:1045–1047.
4.	Kim J, Kaufman JS, Bang H. Graphing Ratio Measures on Forest Plot. J Am Coll Cardiol. 2018;71:585–586.

<br>


## 8. Inquires 📨
If you have any questions, please feel free to contact me 😎

<b>Ryosuke FUJII, PhD.</b><br>
Eurac Research/Fujita Health University<br>
rfujii [at] fujita-hu.ac.jp
