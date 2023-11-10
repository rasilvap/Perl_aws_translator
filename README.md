# Perl_aws_translator

Perl application using [Paws](https://metacpan.org/pod/Paws) A Perl SDK for AWS (Amazon Web Services) APIs
 
## ConfigureIAM Identity Center authentication
follow the next guide: https://docs.aws.amazon.com/sdkref/latest/guide/access-sso.html#idcGettingStarted

## Input and Output examples:
You can use the next body in Postman, pointing to the Url: http://localhost:8080/translator


## Input
```json
{
"source": "en",
"target": "es",
"text": "Hello world"
}
```
## Output
```json
{
"source": "en",
"target": "es",
"answer": "Hola mundo",
"timestamp": "2023-09-13T20:46:34.698+00:00"
}
```
## troubleshooting

You need to send your credentiasl in order authenticate with the aws services:

### export AWS_ACCESS_KEY_ID=<>
### export AWS_SECRET_ACCESS_KEY=<> 
### export AWS_SESSION_TOKEN=<>

You need to instal paws with cpan: cpan Paws and the required dependencies in order to run this app. cpan JSON

To run the app you just need to use the perl command: perl TranslateController.pl
After some time, you would need to do a aws sso login  --profile <profile-name> and to refresh your credentials and then update them in the ./awas/credentials file.

You can use aws configure list-profiles to know you current profile.

Then sign in to the IAM Identity center.

The format of the URL is https://d-xxxxxxxxxx.awsapps.com/startor your_subdomain.awsapps.com/start and then go to the AWS Account/Command line programmatic access and copy the new credentials to update in your ./aws/credentials file.
