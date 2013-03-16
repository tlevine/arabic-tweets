#!/usr/bin/env python2
'Select a random subset of lines.'
import random

t_in = open('tweets/tweets.csv')
t_out = open('tweets/tweets-sample.csv', 'a')

for line in t:
    if random.uniform(0,1) < (20000 / 95000000):
        t_out.write(line)