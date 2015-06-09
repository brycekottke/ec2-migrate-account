#!/usr/bin/python

import boto
from boto import ec2

conn = boto.ec2.connect_to_region('us-west-2', profile_name='redaptcust')

reservations = conn.get_all_instances()
for res in reservations:
    for inst in res.instances:
        if 'Name' in inst.tags:
            print "%s (%s)" % (inst.tags['Name'], inst.id)
        else:
            print "%s %s" % (inst.id, inst.state)
