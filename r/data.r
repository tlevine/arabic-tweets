# Make a connection to the data in the RDS.
rds <- function() {
  library(RMySQL)
  con <- dbConnect(MySQL(), user="superhero", password="foo", dbname="tweets", host="merced")
  cat('This is a connection. Run `?RMySQL` to see how to use it.\n')
  con
}

# Load the data from an RData file.
rdata <- function() {
  cat("The data are being downloaded from S3. This might take a while.")
  load(url('http://data-in-s3.Rdata'))
  tweets
}

# Load sample data from a spreadsheet
spreadsheet.sample <- function() {
  .colClasses <- c('factor', 'numeric', 'numeric', 'character', 'character', 'character', 'character')
  .col.names  <- c('user',   'foo',     'id',      'bar',       'date',      'text',      'junk')
  d <- read.csv('tweets_ar_1.txt', colClasses = .colClasses, sep = '\t',
    header = F, col.names = .col.names, flush = T)
  d$date <- strptime(d$date, format = '%a %b %d %H:%M:%S AST %Y')
  d$junk <- NULL
  d
}