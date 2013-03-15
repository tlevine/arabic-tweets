# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
# con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="endpoint")
con <- dbConnect(MySQL())

# spreadsheets <- c('tweets/tweets_ar.txt', paste('tweets/tweets_ar_', 1:12, '.txt', sep = ''))
spreadsheets <- paste('tweets/tweets_ar_', 2:3, '.txt', sep = '')

for (spreadsheet in spreadsheets) {
  cat(paste('Reading', spreadsheet, 'from disk'))
  tweets <- tsv(spreadsheet)
  cat(paste('Inserting', spreadsheet, 'into the database'))
  dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T, row.names = F)
}
