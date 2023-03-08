# Practical case 1 --------------------------------------------------------
# Perform multivariable logistic regression to estimate odds ratio and plot it as points + error bars

install.packages("causaldata")
library(causaldata)

# Peforming logistic regression
data(nhefs_complete)
fit <- glm(death ~ sex + age + sbp + tumor, data = nhefs_complete, family = binomial)
summary(fit)

# Creating data frame for data visualization
table2 <- data.frame(OR  = exp(summary(fit)$coefficients[-1,1]),
                     UCI = exp(confint(fit, level = .95)[-1,1]),
                     LCI = exp(confint(fit, level = .95)[-1,2]))

rownames(table2) <- c("SEX_Female",
                      "Age",
                      "SBP",
                      "Cancer")

# Visualization
install.packages("forplo")
library(forplo)

forplo(table2[,1:3],
       sort        = TRUE,
       favorlabs   = c("Lower mortality", "Higher mortality"),
       size        = 3,
       ci.edge     = FALSE,
       ci.lwd      = 2,
       char        = 20,
       left.bar    = FALSE, 
       row.labels  = c("SEX_Female",
                       "Age",
                       "SBP",
                       "Cancer"),
       title       = "Logistic regression, sorted by OR")



# Practical case 2 --------------------------------------------------------
# Summarize different studies and plot it as forest plot
# Example from the forplo package 

# Creating original data
forest <- data.frame(OR     = c(1.21,0.90,1.02,
                                1.54,1.32,0.79,1.38,0.85,1.11,
                                1.58,1.80,2.27),
                     LCI    = c(0.82,0.61,0.66,
                                1.08,0.91,0.48,1.15,0.39,0.91,
                                0.99,1.48,0.92),
                     UCI    = c(1.79,1.34,1.57,
                                2.19,1.92,1.32,1.64,1.87,1.34,
                                2.54,2.19,5.59),
                     groups = c(1,1,1,
                                2,2,2,2,2,2,
                                3,3,3))


rownames(forest) <- c('Barry, 2005', 'Frances, 2000', 'Rowley, 1995',
                      'Biro, 2000', 'Crowe, 2010', 'Harvey, 1996',
                      'Johns, 2004', 'Parr, 2002', 'Zhang, 2011',
                      'Flint, 1989', 'Mac Vicar, 1993', 'Turnbull, 1996')


# Calculating weights and overall results
logOR <- round(log(forest$OR), 2)
SE <- round((log(forest$UCI) - logOR) / 1.96, 2)
metatot <- meta::metagen(logOR, SE)

forest$logOR <- logOR
forest$SE <- SE
forest$weights <- round(metatot$w.random / sum(metatot$w.random) * 100, 2)

forest <- rbind(forest,
                c(round(exp(metatot$TE.random), 2),
                  round(exp(metatot$lower.random), 2),
                  round(exp(metatot$upper.random), 2),
                  4,
                  round(metatot$TE.random, 2),
                  round(metatot$seTE.random, 2),
                  100))

rownames(forest)[13] <- "All"


# Data visualization for meta-analsys
w <- forest$weights
w[13] <- NA

forplo(forest[,1:3],
       groups       = forest$groups,
       grouplabs    = c('Low risk of bias',
                        'Some concerns',
                        'High risk of bias',
                        'Overall'),
       left.align   = TRUE,
       ci.edge      = FALSE,
       ci.lwd       = 2,
       char         = 15,
       left.bar     = FALSE, 
       diamond      = 13,
       diamond.col  = "Grey",
       scaledot.by  = w)


# Practical case 3 --------------------------------------------------------
# Perform logistic regression with spline and plot it

install.packages("rms")
library(rms)

data(nhefs_complete)
nhefs_complete1 <- nhefs_complete |>
  drop_na(sbp)

# Setting knots
ddist <- datadist(nhefs_complete1)
options(datadist = 'ddist')
k <- with(nhefs_complete1, quantile(sbp, c(.05, 0.25, .75, .95)))

# Logistic regression
summary2 <- lrm(death ~ sex + age + rcs(sbp, k) + tumor, data = nhefs_complete1)

# Change SBP = 102 as a reference
ddist$limits["Adjust to", "sbp"] <- 120
summary3 <- update(summary2)


## Pattern 1: Liner scale for non-linear association #####################

table3 <- Predict(summary3, sbp, ref.zero = TRUE, fun = exp) |>
  as_tibble()

ggplot(table3, aes(x = sbp, y = yhat)) +
  geom_hline(yintercept = 1, linetype = "dashed") +
  geom_line(color = "#191970",
            linewidth = 1.1) +
  geom_ribbon(aes(ymin = lower,
                  ymax = upper),
              alpha = 0.2,
              fill = c("#4169e1")) +
  scale_y_continuous(limits = c(0.1, 10),
                     breaks = c(0.1, 0.2, 0.5, 1, 2, 5, 10), trans = "log") +
  scale_x_continuous(limits = c(90, 190),
                     breaks = seq(100, 180, 20)) +
  labs(x = "SBP, mmHg",
       y = "Odds ratio (95% CI)") +
  theme_bw() +
  theme(axis.line = element_line(size = 0.5, linetype = "solid"),
        panel.grid.major = element_line(colour = "gray98"),
        axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        plot.caption = element_blank(),
        panel.background = element_rect(fill = "gray99",
                                        colour = "white", linetype = "twodash"),
        plot.background = element_rect(fill = "white"))


## Pattern 2: Logarithmic scale for non-linear association #####################

table4 <- Predict(summary3, sbp, ref.zero = TRUE) |>
  as_tibble()

ggplot(table4, aes(x = sbp, y = yhat)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_line(color = "#dc143c",
            linewidth = 1.1) +
  geom_ribbon(aes(ymin = lower,
                  ymax = upper),
              alpha = 0.2,
              fill = c("#db7093")) +
  scale_y_continuous(limits = c(-2, 2),
                     breaks = seq(-2, 2, 1)) +
  scale_x_continuous(limits = c(90, 190),
                     breaks = seq(100, 180, 20)) +
  labs(x = "SBP, mmHg",
       y = "Log-transformed odds ratio (95% CI)") +
  theme_bw() +
  theme(axis.line = element_line(size = 0.5, linetype = "solid"),
        panel.grid.major = element_line(colour = "gray98"),
        axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        plot.caption = element_blank(),
        panel.background = element_rect(fill = "gray99",
                                        colour = "white", linetype = "twodash"),
        plot.background = element_rect(fill = "white"))
