#!/usr/bin/python

account2 = ""

import boto
from boto import ec2

conn = boto.ec2.connect_to_region('us-west-2', profile_name='play1')


reservations = conn.get_all_instances(filters={"tag:createImage" : "yes"})

for res in reservations:
  for inst in res.instances:
    print "%s (%s)" % (inst.tags['Name'], inst.id)

    new_ami_id = conn.create_image(instance_id=inst.id, name=inst.tags['Name'] +" - Image", description="Image for migration: "+inst.tags['Name'], no_reboot=True, dry_run=False)
    print new_ami_id

#    share_ami = conn.modify_image_attribute(image_id, attribute='launchPermission', operation='add', user_ids='771502366784', groups=None, product_codes=None)
