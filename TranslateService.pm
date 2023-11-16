package TranslateService;

use Paws;
use Paws::Credential::Explicit;
use feature qw / signatures /;

require './Config.pm';

sub new {
    return bless {}, shift;
}

sub translate($class, $source_language, $target_language, $text_to_translate, $aws_access_key, $aws_secret_key, $aws_session_token) {

    my $aws_config = Paws->new(config => {
      credentials => Paws::Credential::Explicit->new(
        access_key => $aws_access_key,
        secret_key => $aws_secret_key,
        session_token => $aws_session_token,
      )
    });


    # Creating an instance of the Translate service with Paws
    my $translate = $aws_config->service('Translate', region => $Config::AWS_REGION); # Change this to your AWS region

    # Performing translation using AWS Translate
    my $result = $translate->TranslateText(
        SourceLanguageCode => $source_language,
        TargetLanguageCode => $target_language,
        Text               => $text_to_translate,
    );

    return $result->TranslatedText;
}

1;  # End of TranslateService.pl
