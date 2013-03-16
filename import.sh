#!/bin/sh

# Stack in order
cat tweets/tweets_ar.txt.csv tweets/tweets_ar[1-9].txt.csv tweets/tweets_ar1[01].txt.csv > tweets/tweets.csv

# Import
mysql --local-infile=1 < import.sql
