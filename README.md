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
    This Dockerfile provides an environment to run a Perl application based on Dancer2 and requires JSON, Paws, and AWS CLI dependencies.

       #### Steps:
                
            Build and run the Docker image:
           
                docker build -t my-perl-app .
            
                docker run -p 3000:3000 my-perl-app .

3. Test the service, open Postman and import the file:  
   >  Perl-Aws-Translator.postman_collection.json

    Configure AWS Credentials
        Before running the test, ensure you configure AWS credentials. Set the aws_access_key, aws_secret_key, and aws_session_token in the headers.
   
    #### Notes:
    Make sure to replace aws_access_key, aws_secret_key, and your aws_secret_key with your actual AWS credentials.
    This command is suitable for applications that require AWS credentials to run, the token duration is one hour,
    after this time you need to update the credentials to run the app.
    
    In order to update your credentials, you would need to do a aws sso login  --profile <profile-name> and to refresh
    your credentials and then update them in the ./awas/credentials file.
    You can use aws configure list-profiles to know you current profile.
    Then sign in to the IAM Identity center.
    The format of the URL is https://d-xxxxxxxxxx.awsapps.com/startor your_subdomain.awsapps.com/start and then go to the AWS Account/Command line programmatic access and reeplace
    the new credentials in you env vars, in the above docker command.

    You can configure the AWS region by changing the value of the $AWS_REGION variable in the Config.pm File.
