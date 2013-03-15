CREATE USER 'superhero'@'%' IDENTIFIED BY 'J4j5yq6P6c4';
GRANT SELECT ON tweets.* TO 'superhero'@'%';
FLUSH PRIVILEGES;
