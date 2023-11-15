package TranslateServiceTest;

use Test::More;
use lib '.';
use base 'TestBase';

use TranslateService;
 
# setup methods are run before every test method.
sub create_object : Test(setup) {
    my $service = TranslateService->new;
    shift->{service} = $service;
}

sub test_translation : Test {
    my $service = shift->{service};
    my $$source_language = 'en';
    my $target_language = 'es';
    my $text_to_translate = 'Hello World!';
    is($service->translate, 'Hola Mundo!', 'Successful translation!');
} 
