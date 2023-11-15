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
2. Go to the project, open the Dockerfile and edit the following the values:
   
     >  
        ENV AWS_ACCESS_KEY_ID=<>
        ENV AWS_SECRET_ACCESS_KEY=<>
        ENV AWS_SESSION_TOKEN=<>
     >
4. Build and run the Docker image:
    ```bash
        docker build -t my-perl-app .
    ```
    ```bash
        docker run -it --expose 8008 -p 8008:8008 --rm --name my-running-app my-perl-app
    ```    
5. Test the service, open Postman and import the file:  
   >  Perl-Aws-Translator.postman_collection.json
   >
