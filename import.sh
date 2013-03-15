#!/bin/sh

cat tweets/tweets_ar*.txt.csv > tweets/tweets.csv
mysqlimport --default-character-set=utf8 --fields-enclosed-by=\" --fields-terminated-by=, --lines-terminated-by=\\n ---columns=username,userid,id,date,text tweets.csv
