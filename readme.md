Arabic Tweets Data
====
Arabic Tweets from the Qatar Institute are prepared in a few convenient formats
for use at the DataKind datadive. The data are plyed in a few different ways
and are converted into a few different formats for fast loading into different
programs. A server build script is also created so that we can deploy a few
servers and load the data into the respective programs before the datadive
starts.

## Formats
We store the data in these formats. For each format, we will also provide
snippets for importing of that format into R and/or Python, as is appropriate.

* CSV
* RData file of a data.frame
* Pickle file of a Pandas DataFrame
* MySQL dump
* JSON (perhaps in multiple different structures)
* SQLite file?
* It's a bit small for Hadoop, but we could try [Mortar](http://www.mortardata.com/).
* Some sort of web API, but datahub.io doesn't seem to do this.

## Plying
We plyed the data in these ways.

* Random subset
* Aggregate something by something?
* Only certain columns
* No alteration (Just combine all 12 original files into one table.)

The first two of these plyings and maybe the third way should result in a
dataset that works fine in desktop statistics programs (Excel, SAS, &c.).

## Infrastructure
Here are a few ideas of how we set up the infrastructure. Regardless of which
one we choose, we'll store the data in the various formats in S3 or EBS so that
we can quickly get it from the various Amazon services and from other places
over the web.

### Idea 1: Minimal cloudness
We make one self-contained instance that can load everything, and we deploy a
few copies of this.

The [high-memory extra large instance](http://aws.amazon.com/ec2/pricing/)
looks good for this, and it would cost $9.84 per day per node.
I looked at a few other things, but they mostly look annoying to sign up for.
Joyent, Azure and Linode are decent, but AWS seems to have better machines.

If we make one build script for everything, it might include

* Python, iPython Notebook, various python libraries
* R with various libraries
* MySQL, configured with particular credentials
* Download and import the data files in the various formats

My [desk install script](https://github.com/tlevine/desk/blob/master/install)
has some ideas regarding the libraries.

We could use an existing image, but
[this](https://aws.amazon.com/amis/crosscompute-python-scientific-computing-environment-and-tutorials-20121009)
was the only relevant one I found.

### Idea 2: Cloud database
[Amazon RDS](http://aws.amazon.com/rds/) looks promising. I'd go with the
High-Memory Extra Large DB instance. They have some
[directions](http://aws.amazon.com/articles/1663) on using it for MySQL
with persistent storage on EBS.


## Infrastructure
Let's store the data in the various formats at the same datacenter
as the various computation nodes.

## Plans
We don't have to do everything I suggest there. I'll probably start
by putting it in MySQL and then transforming everything from there.
