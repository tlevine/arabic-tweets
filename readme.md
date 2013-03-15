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

The raw data files are about 10 GB compressed. I think that instances that have
slow IO, less CPU and just a bit more memory than the data size will be most
appropriate.

Let's make sure that there's an easy way for people to save output to other
places. In particular, I'm thinking of PNG or PDF plots and aggregated data
in JSON files.

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

### Idea 2: Maximal cloudness
We don't configure our own computers at all.

We use [Amazon RDS](http://aws.amazon.com/rds/) for the database.
I'd go with the High-Memory Extra Large DB instance. They have
[directions for loading data](http://aws.amazon.com/articles/Amazon-RDS/2933).

We use someone else's EC2 iPython Notebook configuration. Here are possibilities.

* [NotebookCloud](https://notebookcloud.appspot.com)
* [PiCloud Notebook](http://blog.picloud.com/2012/12/23/introducing-the-picloud-notebook/)
* [iPython in a box](https://github.com/wholeslide/ipython_in_a_box)
* [This EC2 image](https://aws.amazon.com/amis/crosscompute-python-scientific-computing-environment-and-tutorials-20121009)

We use someone else's AMI that already has RStudio.
[These](http://bioconductor.org/help/bioconductor-cloud-ami/)
[two](http://www.louisaslett.com/RStudio_AMI/) are promising.

We use [Mortar](https://mortardata.com) for Hadoop. They have
[directions for loading CSVs from S3](http://help.mortardata.com/reference/loading_and_storing_data/CSV).

## Plans
We don't have to do everything I suggest there. I'll probably start
by putting it in MySQL and then transforming everything from there.

## Converting data
I'm loading everything into R, then to MySQL, then plying it and pulling it back
out into the various formats.

First, add the database to your `~/.my.cnf`.

Next, set up the schema.

    mysql < schema.sql

Download the files to the `tweets` directory, and gunzip them; they'll now be
named `tweets/tweets_ar_1?[0-9].txt`.

Run the MySQL import script.

    Rscript import.r
