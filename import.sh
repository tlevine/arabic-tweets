#!/bin/sh

# Stack in order
cat tweets/tweets_ar.txt.csv tweets/tweets_ar[1-9].txt.csv tweets/tweets_ar1[01].txt.csv > tweets/tweets.csv

# Import
mysqlimport tweets --local --default-character-set=utf8 --fields-enclosed-by=\" --fields-terminated-by=, --lines-terminated-by=\\n --columns=username,userid,id,date,text tweets/tweets.csv
