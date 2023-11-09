use Paws;
use Paws::Translate;
use feature qw / signatures /;

use Exporter qw / import /;

# This way you define which methods you want to export
our @EXPORT = qw / translate_text /;

my $translate = Paws->service('Translate', region => 'us-east-1'); 
# Cambia la región según corresponda

sub translate_text ( $text, $source_language_code, $target_language_code ) {
    
    my $response = $translate->TranslateText( 
        Text => $text, 
        SourceLanguageCode => $source_language_code,     
        TargetLanguageCode => $target_language_code
    );

    if ($response->isa('Paws::Translate::TranslateTextResponse')) {
        return "Texto traducido: " . $response->TranslatedText . "\n"; 
    } else {     
        return "Error al traducir el texto: " . $response->message . "\n"; 
    }
}

1;