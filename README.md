# devops_packer
Repository for AMI creation by using packer tool

## Variables
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
