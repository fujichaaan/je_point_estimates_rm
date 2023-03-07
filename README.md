# je_point_estimates_rm
This page is for summarizing code and figures for the letter published in the <i>Journal of Epidemiology</i> (Fujii R. 2023).

# Fujii R. Visualization in relative measures of association: points and error bars. Journal of Epidemiology, 2023.

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
Breif literature review was performed in the articles published in the following journals between April 2022 and March 2023.

- The American Jounral of Epidemiology
- The European Journal of Epidemiology
- The International Journal of Epidemiology
- The Journal of Epidemiology

The results are shown here:

<br>

 <table>
    <tr>
      <th>Journals</th>
      <th>Axis starting from 0</th>
      <th>Axis with an arithmetic scale</th>
      <th>Bar + error bars</th>
      <th>Undetermined</th>
      <th>Appropriate</th>
      <th>N of papers presenting figures</th>
    </tr>
    <tr>
      <td>Am J Epi</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Int J Epi</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Eur J Epi</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>J Epi</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>

<br>

## 4. Key Tips 🔑 
To show the point estimates for relative measures in association, there are three main key points to be considered as follows.
R codes for these plots are <a href="https://github.com/fujichaaan/je_point_estimates_rm/blob/main/code_figures.R">here</a>

![Figure1](https://user-images.githubusercontent.com/19466700/220636651-3529c453-cf69-43b7-a604-fb80acf0cedb.jpg)

### 1. Starting from 1 (A vs. B)
In panel A (starting from 0), OR=2.0 seems to be four times bigger than OR=0.5, while panel B shows each bar graph start from 1.
It is much better than the the 0-starting bar chars, but panel B is still problematic...

<br>

### 2. Use logarithmic scale (B vs. C)
In panel B, OR=2.0 seems to be twice bigger than OR=0.5, but panel C improve the magnitude of effect size.
Therefore, although it can make fair comparison for OR=2.0 and OR=0.5 (different direction), it is unclear for statistical significance yet.

<br>

### 3. Use point + error bars (C vs. D)
In panel C, we can make fair comparison of effect sizes, however, it remains unclear whether error bar crosses 0 or not.
To improve this defect, the panel D shows better data visualization for relative measures to clearly shows confidential intervals.

<br>

## 5. Examples for relative measures 🤼
Here we prepare codes for more practical examples for relative measures including point estimates and others.
Please check <a href="https://github.com/fujichaaan/je_point_estimates_rm/blob/main/code_figures.R">here</a>

## 6. References 📚


<br>

## 7. Inquires　📨
If you have any questions, please feel free to contact me 😎

<b>Ryosuke FUJII, PhD.</b><br>
Eurac Research/Fujita Health University<br>
rfujii [at] fujita-hu.ac.jp
