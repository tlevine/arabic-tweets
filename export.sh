#!/bin/sh

echo "SELECT * FROM tweets ORDER BY RAND() LIMIT 10000;" | mysql -uroot scraperwiki > tweets/tweets.tsv
