# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
# con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="endpoint")
con <- dbConnect(MySQL())


spreadsheets <- c('tweets/tweets_ar.txt', paste('tweets/tweets_ar_', c(1:4,6,8), '.txt', sep = ''))

for (spreadsheet in spreadsheets) {
  cat(paste('Reading', spreadsheet, '\n'))
  tweets.new <- tsv(spreadsheet)
  if ('tweets' %in% ls()){
    tweets <- rbind(tweets, tweets.new)
  } else {
    tweets <- tweets.new
  }
}

# Just write to csv because dbWriteTable is being weird
