package TranslateService;

use Paws;
use Paws::Credential::ProviderChain;
require './Config.pm';

sub new {
    return bless {}, shift;
}

sub translate {
# Imprimir para depuración
   
    my ($source_language, $target_language, $text_to_translate) = @_;

    # Configuring the Translate service with Paws
    my $aws_config = {
        region      => $Config::AWS_REGION, # Change this to your AWS region
        credentials => Paws::Credential::ProviderChain->new(
            providers => [ 'Paws::Credential::Environment', 'Paws::Credential::InstanceProfile' ],
        ),
    };

    # Creating an instance of the Translate service with Paws
    my $translate = Paws->service('Translate', %$aws_config);

    # Performing translation using AWS Translate
    my $result = $translate->TranslateText(
        SourceLanguageCode => $source_language,
        TargetLanguageCode => $target_language,
        Text               => $text_to_translate,
    );

    return $result->TranslatedText;
}

1;  # End of TranslateService.pl
