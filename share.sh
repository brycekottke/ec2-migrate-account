#!/bin/bash

while read line; do

aws --profile play1 ec2 modify-image-attribute --image-id $line --launch-permission "{\"Add\": [{\"UserId\":\"322124792407\"}]}"

done <ami_id.txt


