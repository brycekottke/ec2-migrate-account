profile="redaptcust"
filter="Rancher*"

aws ec2 --profile $profile describe-instances \
  --region us-west-2 \
  --filter "Name=tag:Name,Values=$filter" |\

    jq '.Reservations[].Instances[] | {instance_id: .InstanceId,
       instance_name: .Tags[] | select(.Key == "Name") | .Value}' \
    > $0".out"

#  --query "Reservations[*].Instances[*].InstanceId" \
