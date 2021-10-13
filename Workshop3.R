library(tidyverse)

#remove all existing variables
rm(list = ls())

# Loading data 1st option survey <- (package) ::(function)
survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

#loading data 2nd option to bring read_csv data set

survey <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey%>%head()

survey_USD<-survey%>%
  filter(currency=="USD")

#dataset with USD and Females

survey_USD_Female<-survey%>%
  filter(
  currency=="USD" & 
    gender=="Woman"
)


#data set with AUD or Female | = or

survey_AUD_Female<-survey%>%
  filter(
    currency=="AUD" | 
      gender=="Woman"
  )


survey%>%select(timestamp, gender, currency)

