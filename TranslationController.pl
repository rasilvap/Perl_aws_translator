#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

require './TranslationService.pl';

get '/:txt/:source-language-code/:target_language_code' => sub ($c) {
  my $text = $c->param('txt');
  my $source_language_code = $c->param('source-language-code');
  my $target_language_code = $c->param('target_language_code');
  
  my $result = translate_text( $text, $source_language_code, $target_language_code );
  $c->render(text => $result);
};

app->start;