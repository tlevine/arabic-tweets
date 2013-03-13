Arabic Tweets Data
====
Arabic Tweets from the Qatar Institute are prepared in a few convenient formats
for use at the DataKind datadive. The data are plyed in a few different ways
and are converted into a few different formats for fast loading into different
programs. A server build script is also created so that we can deploy a few
servers and load the data into the respective programs before the datadive
starts.

We store the data in these formats. For each format, we will also provide
snippets for importing of that format into R and/or Python, as is appropriate.

* CSV
* RData file of a data.frame
* Pickle file of a Pandas DataFrame
* MySQL dump
* JSON (perhaps in multiple different structures)
* SQLite file?
* I don't get what datahub.io does....

We plyed the data in these ways.

* No alteration (Just combine all 12 original files into one table.)
* Random subset
* Only certain columns
* Aggregate something by something?

The build script is intended to be run on Ubuntu on a Linode.
