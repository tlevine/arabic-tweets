#!/usr/bin/env python2
'Select a random subset of lines.'
import random
import sys

expected_n = float(sys.argv[1])

t_out = open('tweets/tweets-sample-%d.csv' % int(expected_n), 'w')
t_out.write('username,userid,id,date,text\n')
t_out.close()

t_in = open('tweets/tweets.csv')
t_out = open('tweets/tweets-sample-%d.csv' % int(expected_n), 'a')

cutoff = (expected_n / 95000000.0)
for line in t_in:
    if random.uniform(0,1) < cutoff:
        t_out.write(line)
t_out.close()
