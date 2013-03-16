#!/usr/bin/env python2
'Select a random subset of lines.'
import random

# Expected sample size
EXPECTED_N = 20000.0

t_out = open('tweets/tweets-sample.csv', 'w')
t_out.write('username,userid,id,date,text\n')
t_out.close()

t_in = open('tweets/tweets.csv')
t_out = open('tweets/tweets-sample.csv', 'a')

cutoff = (EXPECTED_N / 95000000.0)
for line in t_in:
    if random.uniform(0,1) < cutoff:
        t_out.write(line)
t_out.close()
