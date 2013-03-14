import MySQLdb

def rds():
    'Connect to the data in Amazon RDS.'
    db = MySQLdb.connect(host="localhost", user="john", passwd="megajonhy", db="jonhydb")
    print('This is a connection. Read http://mysql-python.sourceforge.net/MySQLdb.html#mysqldb to see how to use it.')
    return db
