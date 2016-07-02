#!/usr/bin/env perl

use strict;
use warnings;

use CGI;
use JSON;
use Try::Tiny;

use HON::Http::UrlChecker::Service qw/checkUrl/;

my $cgi = CGI->new();
my $url = $cgi->param('url') || undef;

if (defined $url) {
  try {
    my @listOfStatus = checkUrl($url);
    my $json = to_json(\@listOfStatus, {pretty => 1});
    printOutput($json, 200);
  } catch {
    badRequest();
  }
} else {
  badRequest();
}

=head2 printOutput

Print the http header et the json response.

=cut

sub printOutput {
  my ($json, $status) = @_;

  print $cgi->header(
    -type    => 'application/json',
    -charset => 'utf-8',
    -status  => $status,
  );
  print "$json\n";
}

=head2 badRequest

Print a 400 Bad Request

=cut

sub badRequest {
  printOutput(
    '{"error": "Bad Request"}',
    '400 Bad Request'
  );
}
