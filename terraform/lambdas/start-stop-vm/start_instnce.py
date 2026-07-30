import boto3

TAG_KEY = 'project'
TAG_VALUE = 'k8s_aws'

# TAG_KEY = 'Name'
# TAG_VALUE = 'ubuntu-bastion-nat'

INSTANCE_IDS=[]

def get_instance_by_tag(tag_key, tag_value):
    # Create an EC2 client
    ec2 = boto3.client('ec2')

    # Filter instances by the specified tag key and value
    response = ec2.describe_instances(
        Filters=[
            {
                'Name': f'tag:{tag_key}',  # Corrected the space after 'tag:'
                'Values': [tag_value]
            }
        ]
    )

    # Loop through the instances and print relevant information
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            INSTANCE_IDS.append(instance['InstanceId'])
            # print(f"Instance ID: {instance['InstanceId']}")
            # print(f"Instance State: {instance['State']['Name']}")
            # print(f"Instance Type: {instance['InstanceType']}")
            # print(f"Public IP: {instance.get('PublicIpAddress')}")
            # print(f"Private IP: {instance['PrivateIpAddress']}")
            # print('-' * 60)

def start_instance(instance_ids):
    ec2 = boto3.client('ec2')
    ec2.start_instances(InstanceIds=instance_ids)

if __name__ == "__main__":
    # Example: Get instance by tag 'project' with value 'k8s_aws'
    get_instance_by_tag(TAG_KEY, TAG_VALUE)
    print("Starting",INSTANCE_IDS)
    try:
        start_instance(INSTANCE_IDS)
    except Exception as e:
        print("Starting Instance Failed",e)

def lambda_handler(event, context):
    """Lambda handler function."""
    print("Event and Context received:", event ,context)
    get_instance_by_tag(TAG_KEY, TAG_VALUE)
    start_instance(INSTANCE_IDS)
    return {
        'statusCode': 200,
        'body': f"Instances started: {INSTANCE_IDS}"
    }
