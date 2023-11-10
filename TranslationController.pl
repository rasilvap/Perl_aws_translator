#!/usr/bin/env perl

use Mojolicious::Lite -signatures;
use JSON;
use feature qw / signatures /;

require './TranslationService.pl';

get '/' => sub ($c) {
  my %data = from_json($c->req->body)->%*;
  my $text = $data{text};
  my $source_language_code = $data{source_language_code};
  my $target_language_code = $data{target_language_code};
  
  my $response = translate_text( $text, $source_language_code, $target_language_code );

  $c->render(json => $response);
};

app->start;