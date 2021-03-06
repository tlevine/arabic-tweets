#!/usr/bin/env Rscript
# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')
spreadsheets <- c('tweets/tweets_ar.txt', paste('tweets/tweets_ar_', c(1:12), '.txt', sep = ''))
for (spreadsheet.in in spreadsheets) {
  spreadsheet.out <- paste(spreadsheet.in, '.csv', sep = '')

  # Open
  cat(paste('Reading', spreadsheet.in, '\n'))
  tweets <- tsv(spreadsheet.in)

  # Just write to csv because dbWriteTable is being weird
  cat(paste('Writing', spreadsheet.out, '\n'))
  write.table(tweets, row.names = F, file = spreadsheet.out, col.names = F, sep = ',')
}
