#!/usr/bin/env perl

use Paws;
use Paws::Translate;
use feature qw / signatures /;

my $translate = Paws->service('Translate', region => 'us-east-1');

sub translate_text ( $text, $source_language_code, $target_language_code ) {
    
    my $response = $translate->TranslateText( 
        Text => $text, 
        SourceLanguageCode => $source_language_code,     
        TargetLanguageCode => $target_language_code
    );

    if ($response->isa('Paws::Translate::TranslateTextResponse')) {
        return "Translated text: " . $response->TranslatedText . "\n"; 
    } else {     
        return "Error translating text: " . $response->message . "\n"; 
    }
}

1;