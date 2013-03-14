# Convert the source TSV files to a bunch of nice formats.
source('r/data.r')

library(RMySQL)
con <- dbConnect(MySQL(), user="root", password="", dbname="tweets", host="localhost")

tweets <- spreadsheet('h')
dbWriteTable(con, 'tweets', tweets, overwrite = F, append = T)
