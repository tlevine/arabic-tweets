from pandas.io import sql
from data import rds

# Connect to the Amazon RDS MySQL database.
db = rds()

# Load in Pandas
# http://stackoverflow.com/questions/10065051/python-pandas-and-databases-like-mysql
df = sql.frame_query('SELECT * FROM tweets LIMIT 88', con = db)
