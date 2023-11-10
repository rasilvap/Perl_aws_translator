# TranslateService.pl

use Paws;
use Paws::Credential::ProviderChain;

sub translate {
    my ($source_language, $target_language, $text_to_translate) = @_;

    # Configuring the Translate service with Paws
    my $aws_config = {
        region      => 'us-east-1', # Change this to your AWS region
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
