load(here::here("data", "clean.Rdata"))

library(tidyverse)
library(forcats)
#data viz

plot1 = covid %>%
  mutate(county = factor(county),
         county = fct_reorder(county, concentration)) %>%
  ggplot(aes(county, log(concentration), group = county, fill = county)) +
  geom_boxplot() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("County of state")


## gonna do something here with the dates to make this prettier.
plot2 = covid %>%
  ggplot(aes(date, concentration, group = interaction(county, wwtp_id))) +
  geom_line() +
  facet_wrap(~county, scales = "free")



