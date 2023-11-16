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

    # Change these variables with correct values
    my $aws_access_key = "ASIAYMID7O5HH6Z43K4G";
    my $aws_secret_key = "WefVsdbbsShpT6zOOs3t6lPvcMeXn1sCGaQN2B1V";
    my $aws_session_token = "IQoJb3JpZ2luX2VjEEkaCXVzLWVhc3QtMiJIMEYCIQDjDcsYAdCRsiHez3qH32jc6wnElPHNmvk4IFZxDv4FiQIhAPV7X76PDM9V1BuWCLKN03Ut+g1o3EP+FAHpOoEi0lEaKoADCJP//////////wEQABoMNTc2MDcwODQyMTkwIgzYwm6R2SRy9zW8RbMq1AKp/cAPlen+6VmJKJRKB5FDKU0CXoy3kELBvX7wZ3boRrXPPJLb46HIu67chuET5nQpr/uFtt8oylnSHoGnCvGTL1qNfgbAXFbNqWBF3Mb30F9cVmglH+NN+OSkYNgGX4ttkgKOi2OPOdU4oe0P5ihR0UVDnjf/51fJ2OSQN3zT4xrlrX+J8zTskSgqUG2mIomB2AT9QtXWkiQMNGjRRRlaSwVE35PqYQ0FcCIbqMMTaqgnbinLUrrObzp9cHvO/SVEvFBum6nvHv10ea/erjrBkmskZc5KshiuSuUKQeZaW2/JczHacolMjMz53f+9D3K+2OB1BT1l41h/3tesgWf+Tus7/rmV/7WM/lAb5GrrXp0OvYTWN6Aq2Yyy9dC1S1RCH3RdkGReursSQ9Aw82wtMP66F/BrXzQsWQkKGJaq/If5ck48siPvLdmj/KmTzJM32/uzMPKj2aoGOqYB7+GhYFIqJ84zmXFj7h7c0VxUN7D8EC/+PDeeooWo9sKIZ8/7nSQSo60Ql/2tfpwuTq6S+7vJWRjtVWnNq8FDqwq3uwBcbi3C2zH+CYJxnxcP2F/FMbRcrRoqNNk/r/JuPh0i/8+MocHatSNBo1+Klr1Lby7gI2DbGC/0G7i32FpdvgOmpJEIw1AWALH1cqluCFnys+Van5pIvfhFfTBc2HbM33Vckg==";

    is($service->translate( 'en', 'es', 'hello world', $aws_access_key, $aws_secret_key, $aws_session_token ), 'hola mundo');
}

sub test_es_to_en_translation : Test {
    my $service = shift->{service};

    # Change these variables with correct values
    my $aws_access_key = "ASIAYMID7O5HH6Z43K4G";
    my $aws_secret_key = "WefVsdbbsShpT6zOOs3t6lPvcMeXn1sCGaQN2B1V";
    my $aws_session_token = "IQoJb3JpZ2luX2VjEEkaCXVzLWVhc3QtMiJIMEYCIQDjDcsYAdCRsiHez3qH32jc6wnElPHNmvk4IFZxDv4FiQIhAPV7X76PDM9V1BuWCLKN03Ut+g1o3EP+FAHpOoEi0lEaKoADCJP//////////wEQABoMNTc2MDcwODQyMTkwIgzYwm6R2SRy9zW8RbMq1AKp/cAPlen+6VmJKJRKB5FDKU0CXoy3kELBvX7wZ3boRrXPPJLb46HIu67chuET5nQpr/uFtt8oylnSHoGnCvGTL1qNfgbAXFbNqWBF3Mb30F9cVmglH+NN+OSkYNgGX4ttkgKOi2OPOdU4oe0P5ihR0UVDnjf/51fJ2OSQN3zT4xrlrX+J8zTskSgqUG2mIomB2AT9QtXWkiQMNGjRRRlaSwVE35PqYQ0FcCIbqMMTaqgnbinLUrrObzp9cHvO/SVEvFBum6nvHv10ea/erjrBkmskZc5KshiuSuUKQeZaW2/JczHacolMjMz53f+9D3K+2OB1BT1l41h/3tesgWf+Tus7/rmV/7WM/lAb5GrrXp0OvYTWN6Aq2Yyy9dC1S1RCH3RdkGReursSQ9Aw82wtMP66F/BrXzQsWQkKGJaq/If5ck48siPvLdmj/KmTzJM32/uzMPKj2aoGOqYB7+GhYFIqJ84zmXFj7h7c0VxUN7D8EC/+PDeeooWo9sKIZ8/7nSQSo60Ql/2tfpwuTq6S+7vJWRjtVWnNq8FDqwq3uwBcbi3C2zH+CYJxnxcP2F/FMbRcrRoqNNk/r/JuPh0i/8+MocHatSNBo1+Klr1Lby7gI2DbGC/0G7i32FpdvgOmpJEIw1AWALH1cqluCFnys+Van5pIvfhFfTBc2HbM33Vckg==";

    is($service->translate( 'es', 'en', 'hola mundo', $aws_access_key, $aws_secret_key, $aws_session_token  ), 'Hello world');
}
