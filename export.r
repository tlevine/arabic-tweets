#!/usr/bin/env Rscript
library(RMySQL)
con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="localhost")
tweets <- dbReadTable(con, 'tweets', 'tweets')
save('tweets', 'tweets/tweets.RData')
