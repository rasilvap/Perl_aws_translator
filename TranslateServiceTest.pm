package TranslateServiceTest;

use Test::More;
use lib '.';
use base 'TestBase';

use TranslateService;

sub make_fixture : Test(setup) {
    my $service = TranslateService->new;
    shift->{service} = $service;
}

sub test_en_to_es_translation : Test {
    my $service = shift->{service};
    is($service->translate( 'en', 'es', 'Hello World!' ), 'Hola Mundo!');
}

sub test_es_to_en_translation : Test {
    my $service = shift->{service};
    is($service->translate( 'es', 'en', 'Hola Mundo!' ), 'Hello World!');
}
