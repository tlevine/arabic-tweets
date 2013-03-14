# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="localhost")

for (spreadsheet in c('tweets/tweets_ar.txt', paste('tweets/tweets_ar', 1:12, '.txt', sep = ''))) {
  tweets <- tsv(spreadsheet)
  dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T, row.names = F)
}
