
# load package sem
library(sem)

# load data griliches
df_gril <- read.csv("griliches.csv", sep = "\t")

# ols estimation
b_ols <- lm(lw ~ s + iq + expr + tenure + rns + smsa, data = df_gril)
summary(b_ols)

# iv estimation (instruments age, age2, mother educ, marital status, kww)
b_iv <- tsls (lw ~ s + iq + expr + tenure + rns + smsa, ~ age + age2 + med + kww + mrt + expr + tenure + rns + smsa, data = df_gril)
summary(b_iv)