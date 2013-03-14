CREATE TABLE "tweets" (
  -- Username
  -- http://www.mediabistro.com/alltwitter/tag/maximum-username-length-on-twitter
  "user" VARCHAR(20) NOT NULL,

  -- 64-bit unsigned integers
  -- https://dev.twitter.com/docs/twitter-ids-json-and-snowflake
  -- http://dev.mysql.com/doc/refman/5.6/en/integer-types.html
  "id" BIGINT UNSIGNED NOT NULL,

  "huh?",

  -- Dates without fractional seconds
  "date" TIMESTAMP(0) NOT NULL,

  -- The Tweet
  "text" VARCHAR(140) NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX "username" ON tweets("username");
CREATE INDEX "date" ON tweets("date");
