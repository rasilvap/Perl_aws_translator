# TranslateController.pl

use Dancer2;
use JSON;
use Dancer2::Logger::Console;
require './TranslateService.pm';

set serializer => 'JSON';

any ['get', 'post'] => '/translate' => sub {
    my $c = shift;

    # Obtaining JSON from the request body (either GET or POST)
    my $json_input = $c->request->body;
    my $aws_access_key = request_header 'aws_access_key';
    my $aws_secret_key = request_header 'aws_secret_key';
    my $aws_session_token = request_header 'aws_session_token';    

    # Decoding the JSON
    my $input_data = decode_json($json_input);

    # Extracting data from the JSON
    my $source_language     = $input_data->{source} // '';
    my $target_language     = $input_data->{target} // '';
    my $text_to_translate   = $input_data->{text}   // '';

    
    # Performing translation using the TranslateService
    my $service = TranslateService->new;
    my $translated_text = $service->translate($source_language, $target_language, $text_to_translate, $aws_access_key, $aws_secret_key, $aws_session_token);

    # Converting the response to a serializable data structure
    my $response_data = {
        source           => $source_language,
        target           => $target_language,
        original_text    => $text_to_translate,
        translated_text  => $translated_text,
    };

    # Returning the serialized response in JSON format
    return $response_data;
};

start;
