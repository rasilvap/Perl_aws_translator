#!c:/Strawberry/perl/bin/perl.exe

use strict;
use warnings;
use REST::Client;
use JSON;
# Data::Dumper makes it easy to see what the JSON returned actually looks like 
# when converted into Perl data structures.
use Data::Dumper;
use MIME::Base64;

my $json = '{"SourceLanguageCode":"en","TargetLanguageCode":"fr","Text":"Hello team"}';
my $client = REST::Client->new();
$client->POST ('https://translate.us-east-1.amazonaws.com',
$json,
{Authorization => 'AWS4-HMAC-SHA256 Credential=AKIAYMID7O5HHILSQ6EN/20231109/us-east-1/translate/aws4_request, SignedHeaders=content-type;host;x-amz-content-sha256;x-amz-date;x-amz-target, Signature=998f7cd5316261de094bcbf40b3195d4aaa757a0421ea252cd35549a08326dfd', "Content-type" =>'application/x-amz-json-1.1', "X-Amz-Target" => 'AWSShineFrontendService_20170701.TranslateText',"X-Amz-Content-Sha256" => '10a858e5958160bb0d80a2626b30c553478a842827f138ae2f91737b05a5a859', "X-Amz-Date" => '20231109T211610Z'}

);
print $client->responseContent();
if( $client->responseCode() eq '200' ){
    print "Updated\n";
}
print($client->responseCode());

exit;
