package TranslateServiceTest;

use Test::More;
use lib '.';
use base 'TestBase';

use Test::MockObject;

require './TranslateService.pm';

sub make_fixture : Test(setup) {
    my $service_mock = Test::MockObject->new();
    shift->{service} = $service_mock;
}

sub test_en_to_es_translation : Test {
    my $service_mock = shift->{service};

    $service_mock->mock('translate', sub {
        my ($self, $from, $to, $text, $aws_access_key, $aws_secret_key, $aws_session_token) = @_;
        return 'hola mundo';
    });
}

sub test_es_to_en_translation : Test {
    my $service_mock = shift->{service};

    # Configura el comportamiento esperado en el mock
    $service_mock->mock('translate', sub {
        my ($self, $from, $to, $text, $aws_access_key, $aws_secret_key, $aws_session_token) = @_;
        # Simula la respuesta esperada
        return 'Hello world';
    });
}
