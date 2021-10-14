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

#select observations with annual salary above or equal to 50K using USD data

survey_USD%>%
  filter(
    annual_salary>="50000"
  )

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

#arrange function

survey_USD%>%arrange(annual_salary)

#function to have a look an specific info inside a column (old one)

min(survey_USD$annual_salary)

#what is the earliest date for the survey

min(survey_USD$timestamp)

#what is the latest date for the survey
max(survey_USD$timestamp)

#select the observations with annual salary grater than 0 and save it under the same name

survey_USD<-survey%>%
  filter(
    annual_salary > 0
  )

#Sort in a descending order

survey_USD%>%arrange(
  desc(annual_salary)
  )

#what are industries in the data set

survey_USD%>%distinct(industry)

# how many under each industry

survey_USD%>%count(industry,gender,sort=TRUE)

#how many responses from each age category and gender


survey_USD%>%count(
  how_old_are_you,
  gender,
  sort=TRUE
  )

#group by

#calculate avr_salary for gender in each industry

survey_USD_grouped<-survey_USD%>%
  group_by(gender,
           industry)%>%
  mutate(
    avr_salary=mean(annual_salary),
    min_salary=min(annual_salary),
    max_salary=max(annual_salary)
         )%>%
  ungroup()



  #mutate () create a new variable

survey_USD_avr<-survey_USD%>%
  mutate(
    avr_salary=mean(annual_salary)
    )

#transmute

survey_total<-
  survey_USD%>%
  transmute(
    total_salary=annual_salary+as.numeric(other_monetary_comp),
    min_salary=min(annual_salary)
  )

#summarise

survey_USD_summarise<-survey_USD%>%
  group_by(gender,
           industry)%>%
  summarise(
    avr_salary=mean(annual_salary),
    min_salary=min(annual_salary),
    max_salary=max(annual_salary)
  )%>%
  ungroup()
  
#parse_number

#as.numeric

survey_USD%>%
  parse_number(how_old_are_you)

#case_when
