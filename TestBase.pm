package TestBase;

use base 'Test::Class';

INIT { Test::Class->runtests }

1;