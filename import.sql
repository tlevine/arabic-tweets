SET CHARACTER SET utf8;
SET NAMES utf8;
LOAD DATA LOCAL
INFILE 'tweets/tweets.csv'
INTO TABLE tweets.tweets
CHARACTER SET 'utf8'
FIELDS
  OPTIONALLY ENCLOSED BY '"'
  ESCAPED BY '\\'
  TERMINATED BY ','
LINES TERMINATED BY '\n'
(username,userid,id,date,text);
