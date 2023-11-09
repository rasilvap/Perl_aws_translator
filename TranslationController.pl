#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use TranslationService;

get '/:text/:source_language_code/:target_language_code' => sub ($c) {
  my $text = $c->param('text');
  my $source_language_code = $c->param('source_language_code');
  my $target_language_code = $c->param('target_language_code');
  
  TranslationService->translate_text( $text, $source_language_code, $target_language_code );
};

app->start;