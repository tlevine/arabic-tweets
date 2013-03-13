CREATE TABLE "tweets" (
  "user" NOT NULL,

  -- 64-bit unsigned integers
  -- https://dev.twitter.com/docs/twitter-ids-json-and-snowflake
  -- http://dev.mysql.com/doc/refman/5.6/en/integer-types.html
  "id" BIGINT NOT NULL,
  ??,
  "date" TIMESTAMP(0),
  "text" VARCHAR(140),
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX "username" ON tweets("username");
CREATE INDEX "date" ON tweets("date");
