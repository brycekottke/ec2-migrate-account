profile="redaptcust"
filter="Rancher*"

aws ec2 --profile $profile describe-instances \
  --region us-west-2 \
  --filter "Name=tag:Name,Values=$filter" |\

    jq '.Reservations[].Instances[] | {instance_id: .InstanceId,
       instance_name: .Tags[] | select(.Key == "Name") | .Value}' \
    > $0".out"

  while read info; do
name=$(jq '.instance_name' $0".out" > name.out)
id=$(jq '.instance_id' $0".out" > id.out)
done





#echo $name
#read -p "enter"
#echo $id
#  --query "Reservations[*].Instances[*].InstanceId" \
