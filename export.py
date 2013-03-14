#!/usr/bin/env python2
import pickle
from pandas.io import sql
from data import rds

db = MySQLdb.connect(host="localhost", user="root", passwd="", db="tweets")

# Load in Pandas
# http://stackoverflow.com/questions/10065051/python-pandas-and-databases-like-mysql
df = sql.frame_query('SELECT * FROM tweets', con = db)

pickle.dump(df, 'tweets.pkl')
