# TranslateController.pl

use Dancer2;
use JSON;
require './TranslateService.pl';

set serializer => 'JSON';

any ['get', 'post'] => '/translate' => sub {
    my $c = shift;

    # Obtaining JSON from the request body (either GET or POST)
    my $json_input = $c->request->body;

    # Decoding the JSON
    my $input_data = decode_json($json_input);

    # Extracting data from the JSON
    my $source_language     = $input_data->{source} // '';
    my $target_language     = $input_data->{target} // '';
    my $text_to_translate   = $input_data->{text}   // '';

    # Performing translation using the TranslateService
    my $translated_text = translate($source_language, $target_language, $text_to_translate);

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
