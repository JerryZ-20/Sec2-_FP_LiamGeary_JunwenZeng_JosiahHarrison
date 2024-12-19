install.packages("readr")
library(readr)


data <- read_csv("/Users/junwen/Desktop/Stat\ 184/world-education-data.csv")
View(education)

install.packages("dplyr")
library(dplyr)




summarized_data <- education %>%
  group_by(country) %>%
  summarize(
    gov_exp_pct_gdp = mean(gov_exp_pct_gdp, na.rm = TRUE),
    pri_comp_rate_pct = mean(pri_comp_rate_pct, na.rm = TRUE),
    lit_rate_adult_pct = mean(lit_rate_adult_pct, na.rm = TRUE),
    pupil_teacher_primary = mean(pupil_teacher_primary, na.rm = TRUE),
    pupil_teacher_secondary = mean(pupil_teacher_secondary, na.rm = TRUE),
    school_enrol_primary_pct = mean(school_enrol_primary_pct, na.rm = TRUE)
  )

# 1st
ggplot(summarized_data, aes(x = gov_exp_pct_gdp, y = lit_rate_adult_pct, color = country)) +
  geom_point(size = 3) +
  labs(
    title = "Government Expenditure(In percentage of GDP) vs Literacy Rate by Country",
    x = "Government Expenditure",
    y = "Literacy Rate"
  ) +
  theme_minimal()

# problem envountered: due to color-coding all of the countries, each country has a legend lable, and the graph is no where to be seen, 
# and so much so the legend lables even crashed the R program, leading me to hide the legend lables.

# 2nd
ggplot(summarized_data, aes(x = gov_exp_pct_gdp, y = lit_rate_adult_pct)) +
  geom_point(size = 3) +
  labs(
    title = "Government Expenditure(In percentage of GDP) vs Literacy Rate by Country",
    x = "Government Expenditure",
    y = "Literacy Rate"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# 3rd
ggplot(summarized_data, aes(x = gov_exp_pct_gdp, y = lit_rate_adult_pct)) +
  geom_point(color = "black", size = 3) +
  geom_smooth(method = "lm", color = "blue", se = TRUE) +
  labs(
    title = "Government Expenditure(In percentage of GDP) vs Literacy Rate by Country",
    x = "Government Expenditure",
    y = "Literacy Rate"
  ) +
  theme_minimal() +
  scale_y_continuous(limits = c(30, 100))
