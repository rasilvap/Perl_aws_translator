# Perl_aws_translator
Rest Api to use the AWS Translator service 

### Quick guide to run the service locally
* Install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
* Install [Postman](https://www.postman.com/downloads/)
* Have an [Aws account](https://aws.amazon.com/) and [Set up AWS IAM identity Center](https://www.youtube.com/watch?v=_KhrGFV_Npw) 

## Steps
1. Clone the repository
    ```sh
    git clone https://github.com/rasilvap/Perl_aws_translator.git
    ```
2.  ### Dockerfile for Perl Application with AWS cli Paws and Dancer2
    This Dockerfile provides an environment to run a Perl application based on Dancer2 that utilizes AWS and requires JSON, Paws, and AWS CLI dependencies. Additionally, a step-by-step guide is included to set up AWS credentials and run      the application on a new machine.

       #### Steps:
            Build the Docker Image: docker build -t image-name .
    
            Configure AWS Credentials
                Before running the application, ensure you configure AWS credentials. Set the AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_SESSION_TOKEN environment variables with your AWS credentials in the DockerFile:
                > 
                AWS_ACCESS_KEY_ID=your-access-key-id
                AWS_SECRET_ACCESS_KEY=your-secret-access-key
                AWS_SESSION_TOKEN=your-session-token
                > 
                
            Build and run the Docker image:
            ```bash
                docker build -t my-perl-app .
            ```
            ```bash
                docker run -p 3000:3000 my-perl-app .
            ```    
3. Test the service, open Postman and import the file:  
   >  Perl-Aws-Translator.postman_collection.json
