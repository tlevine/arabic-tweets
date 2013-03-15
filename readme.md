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

* CSV of a random sample
* RData file of a data.frame
* Pickle file of a Pandas DataFrame
* MySQL dump
* JSON (perhaps in multiple different structures)

## Plying
We plyed the data in these ways.

* Random subset
* Aggregate something by something?
* Only certain columns
* No alteration (Just combine all 12 original files into one table.)

The first two of these plyings and maybe the third way should result in a
dataset that works fine in desktop statistics programs (Excel, SAS, &c.).

## Converting data
I've cleaned up the spreadsheets slightly and loaded them into MySQL.
Now we can pull them out of MySQL into R, Python (Pandas), &c.

### Cleaning up spreadsheets
Download the files to the `tweets` directory, and gunzip them; they'll now be
named `tweets/tweets_ar_1?[0-9].txt`. We stored them in S3, so `s3cmd` was
helpful.

Load each source spreadsheet into R, clean it up, then export it as another
spreadsheet, this time a csv.

    Rscript clean.r

### Into the database
Add the database to your `~/.my.cnf`, then set up the schema.

    mysql < schema.sql

Add the users while you're at it.

    mysql < users.sql

Then load the data.

    ./import.sh

Once that finishes, everything will be in the `tweets.tweets` table.

### Out of the database
The `python` and `r` directories have boilerplate code for accessing the data
from the MySQL server.

## Infrastructure
We have some files that are suitable for analysis on a laptop, but we've also
loaded the full dataset into a server in Virginia and have set up some other
servers in Virginia from which you can analyse the dataset. 

All of the systems are AWS EC2 or RDS instances. I've been using the ones with
15GB of RAM ([m2.xlarge](http://aws.amazon.com/ec2/instance-types/) and
db.m2.xlarge, respectively), which is enough to fit most of the data in RAM.
The m2.2xlarge should be enough to fit the whole thing in RAM, and we can
easily use different instances if you need more power.

### Database
Data are in a canonical MySQL database. You can access it with
[this .my.cnf](.my.cnf) or just with this command:

    mysql -usuperhero -pJ4j5yq6P6c4 -h arabic-tweets.carpklcd5jnh.us-east-1.rds.amazonaws.com tweets

This account only has `SELECT` permissions on the `tweets` table; you need not
worry that you will accidentally alter the data if you use this account.

If lots of people start hitting this, we'll spin up more databases with the same data.

You'll probably want to alter the database somewhat, so we'll make database
users with more privileges.

### iPython Notebook
We have iPython Notebooks running in Virginia. We're gonna use one of these images/services.

* [NotebookCloud](https://notebookcloud.appspot.com)
* [This EC2 image](https://aws.amazon.com/amis/crosscompute-python-scientific-computing-environment-and-tutorials-20121009)

### RStudio
We're using the [Bioconductor AMI](http://bioconductor.org/help/bioconductor-cloud-ami/)
Make sure to use the version with SSH access so you can add these extra things:

    # As root
    apt-get install libmysqlclient-dev
    adduser [username]

    # As the user
    cd
    git clone git://github.com/tlevine/arabic-tweets.git
    ln -s arabic-tweets/.my.cnf .
    Rscript -e "install.packages('RMySQL')"

RStudio runs on port 8787.

