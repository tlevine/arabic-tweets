#!/usr/bin/env python2
'Select a random subset of lines.'
import random

t_in = open('tweets/tweets.csv')
t_out = open('tweets/tweets-sample.csv', 'a')

t_out.write('username,userid,id,date,text\n')
for line in t_in:
    if random.uniform(0,1) < (20000 / 95000000):
        t_out.write(line)
