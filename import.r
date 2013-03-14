# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="localhost")

# spreadsheets <- c('tweets/tweets_ar.txt', paste('tweets/tweets_ar_', 1:12, '.txt', sep = ''))
spreadsheets <- paste('tweets/tweets_ar_', 1:3, '.txt', sep = '')

for (spreadsheet in spreadsheets) {
  tweets <- tsv(spreadsheet)
  dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T, row.names = F)
}
