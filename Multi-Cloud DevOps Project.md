# Introduction
This project serves as a comprehensive guide to a }loud DevOps workflow. Leveraging Terraform for infrastructure provisioning, Ansible for configuration management, Docker for containerization, this project aims to showcase best practices for cloud-native development and deployment.

### 1. Terraform Setup
#### Customize Variables
Edit `variables.tf` in the `terraform` directory to customize variables.
### 2. Apply Terraform Configuration
#### Before applying, we need to setup the S3 bucket for the tfstate file.

**Instructions:**

1. **Create an S3 Bucket:**
   - Log in to the [AWS Management Console](https://aws.amazon.com/console/).
   - Navigate to the S3 service.
   - Create a new bucket, ensuring it has a globally unique name.

2. **Define S3 Bucket Details in `backend.tf`:**
   - Replace `"terraform-state-bucket"` with the unique name of the S3 bucket you created.
   - Choose a unique name for the bucket to avoid conflicts with other users or teams.

3. **Set AWS Region:**
   - Replace `"your-preferred-aws-region"` with your preferred AWS region (e.g., `"us-west-2"` is used).

4. **Enable Server-Side Encryption:**
   - Set `encrypt` to `true` if you want to enable server-side encryption for the Terraform state file

Once you've made these changes, you can run the following Terraform commands in the `terraform` directory:
```
terraform init
terraform apply
```

This will initialize the backend and apply your Terraform configuration, storing the state file in the specified S3 bucket.

### 3. Ansible Setup

#### Install Ansible Roles
```bash
cd ../ansible
ansible-galaxy install -r requirements.yml
```
#### Run Ansible Playbooks
```bash
ansible-playbook -i Ansible_Roles/tests/inventory playbook.yml
```
This playbook will install the following packages
- Install the required packages (Git, Docker, Java).
- Install the required packages for Jenkins.
- Install the required packages for SonarQube.

### 4. Docker Setup

#### Build Docker Image
```bash
docker build -t <your-image-name> .
```
#### Run Docker Container
```bash
docker run -p 8080:8080 <your-image-name>
```
The given docker file will create the docker image for the application in the ./Spring-Boot-App

## The Architecture
- The architecture consists of one VPC, one public subnet, one EC2 with security group of SSH port allowed, applying the concept of IaC modules.
- The application is deployed to an OpenShift cluster, & it has centralized logging on OpenShift for container logs.