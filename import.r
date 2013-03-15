# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
# con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="endpoint")
con <- dbConnect(MySQL())

spreadsheets <- paste('tweets/tweets_ar.txt', 'tweets/tweets_ar_', c(1:4,6,8), '.txt', sep = '')

# Make this faster?
# http://dev.mysql.com/doc/refman/5.0/en/innodb-tuning.html
# SET autocommit=0; SET unique_checks=0;

for (spreadsheet in spreadsheets) {
  cat(paste('Reading', spreadsheet, 'from disk\n'))
  tweets <- tsv(spreadsheet)
  cat(paste('Inserting', spreadsheet, 'into the database\n'))
  dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T, row.names = F)
}
