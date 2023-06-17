
rm(list=ls()) # removes all variables stored previously
data<-read.csv("C:/Users/SAGNIK CHANDA/OneDrive/Desktop/Covidanalysis_R/COVID19_line_list_data.csv")
library(Hmisc) # import
describe(data) # Hmisc command
# cleaning up death column
data$death_dummy <- as.integer(data$death != 0)
# death rate
sum(data$death_dummy) / nrow(data)
# AGE
# claim: people who die are older than people who survive
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
# is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
# GENDER
# claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.46%!
mean(women$death_dummy, na.rm = TRUE) #3.66%
# is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
