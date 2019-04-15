# devops_packer
Repository for AMI creation by using packer tool

Build the docker image

    docker build -t packer .

Run the docker container

    docker run -i -d -v ~/Documents/workstation/:/mnt/packer packer:latest

Login to container in interactive mode

    docker exec -it <container_id> "/bin/bash"
                    or
    docker exec -it $(docker ps | grep packer:latest | awk '{print $1}') "/bin/bash"

Setup the AWS profile

    aws configure
    AWS Access Key ID [None]: *********
    AWS Secret Access Key [None]: **********
    Default region name [None]:
    Default output format [Noµne]:
    Run the chef recipe

Variable for packer build need to pass via a variable file as below

    packer build --var-file=variables.json

Sample variable file could be as below

    {
    	"notes": "This variables are used when running a packer build -var-file",
        "aws_access_key": "",
        "aws_secret_key": "",
    	"aws_region": "",
    	"security_group_id": "",
    	"subnet_id": "",
    	"source_ami":"",
        "ssh_keypair_name":"",
        "ssh_private_key_file":""
    }
