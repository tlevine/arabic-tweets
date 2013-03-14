# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="localhost")

for (spreadsheet in paste('tweets/tweets_ar', 1:12, '.txt')) {
#  tweets <- tsv(spreadsheet)
#  dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T, row.names = F)
}
