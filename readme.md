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
* It's a bit small for Hadoop, but we could try [Mortar](http://www.mortardata.com/).

We plyed the data in these ways.

* Random subset
* Aggregate something by something?
* Only certain columns
* No alteration (Just combine all 12 original files into one table.)

The first two of these plyings and maybe the third way should result in a
dataset that works fine in desktop statistics programs (Excel, SAS, &c.).

The build script is intended to be run on Ubuntu on a Linode or EC2.
The [high-memory extra large instance](http://aws.amazon.com/ec2/pricing/)
looks good for this, and it would cost $9.84 per day per node.
