CREATE USER 'superhero'@'localhost' IDENTIFIED BY 'J4j5yq6P6c4';
GRANT SELECT ON tweets.* TO 'superhero'@'localhost';
FLUSH PRIVILEGES;
