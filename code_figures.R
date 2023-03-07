install.packages("tidyverse")
library(tideyverse)

# Data preparation --------------------------------------

table <- data.frame(ID    = c(1, 2),
                    Class = c("A", "B"),
                    RR    = c(0.5, 2.0),
                    Start = c(1.0, 1.0),
                    End   = c(0.5, 2.0),
                    Upper = c(0.87, 2.8),
                    Lower = c(0.35, 1.5))

# Figure 1 Panel A --------------------------------------

ggplot(table, aes(x = Class, y = RR)) +
  geom_bar(stat = "identity", fill = "Black") +
  geom_errorbar(aes(ymin = Lower, ymax = Upper), 
                width = .2,
                position = position_dodge(.9)) +
  labs(y = "Risk ratio (95% CI)") +
  scale_y_continuous(limits = c(0, 3),
                     breaks = seq(0, 3, 0.5)) +
  theme_bw() +
  theme(axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# Figure 1 Panel B --------------------------------------


ggplot(table, aes(x = Class)) +
  geom_rect(aes(x = Class, xmin = ID - 0.45, xmax = ID + 0.45,
                ymin = End, ymax = Start), fill = "Black") +
  geom_errorbar(aes(ymin = Lower, ymax = Upper), 
                width = .2,
                position = position_dodge(.9)) +
  labs(y = "Risk ratio (95% CI)") +
  scale_y_continuous(limits = c(0, 3),
                     breaks = seq(0, 3, 0.5)) +
  theme_bw() +
  theme(axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


# Figure 1 Panel C --------------------------------------

ggplot(table) +
  geom_rect(aes(x = Class, xmin = ID - 0.45, xmax = ID + 0.45,
                ymin = End, ymax = Start), fill = "Black") +
  geom_errorbar(aes(x = Class, ymin = Lower, ymax = Upper), 
                width = .2,
                position = position_dodge(.9)) +
  labs(y = "Risk ratio (95% CI)") +
  scale_y_continuous(limits = c(0.1, 3),
                     breaks = c(0.25, 0.5, 1.0, 2.0, 3.0),
                     trans = "log10") +
  theme_bw() +
  theme(axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


# Figure 1 Panel D --------------------------------------

ggplot(table) +
  geom_hline(yintercept = 1, linetype = 2) +
  geom_pointrange(aes(x = Class, y = RR, 
                      ymin = Lower, ymax = Upper),
                  size = 2, linewidth = 2,
                  position = position_dodge(0.85)) +
  labs(y = "Risk ratio (95% CI)") +
  scale_y_continuous(limits = c(0.1, 3),
                     breaks = c(0.25, 0.5, 1.0, 2.0, 3.0),
                     trans = "log10") +
  theme_bw() +
  theme(axis.title = element_text(size = 24),
        axis.text = element_text(size = 20),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

