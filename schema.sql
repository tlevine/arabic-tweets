CREATE TABLE `tweets` (
  `pk` INT NOT NULL AUTO_INCREMENT,

  -- http://www.mediabistro.com/alltwitter/tag/maximum-username-length-on-twitter
  `username` VARCHAR(20) NOT NULL,

  -- MEDIUMINT is too small, INT seems way larger than necessary.
  `userid` INT NOT NULL,

  -- 64-bit unsigned integers
  -- https://dev.twitter.com/docs/twitter-ids-json-and-snowflake
  `id` BIGINT UNSIGNED NOT NULL,

  -- Dates without fractional seconds
  `date` TIMESTAMP NOT NULL DEFAULT 0,

  -- The Tweet
  `text` VARCHAR(140) NOT NULL,

  KEY `username` (`username`),
  KEY `userid` (`userid`),
  KEY `date` (`date`),
  UNIQUE KEY (`id`),
  PRIMARY KEY(`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
