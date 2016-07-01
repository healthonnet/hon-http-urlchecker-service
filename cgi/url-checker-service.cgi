#!/usr/bin/env perl

use strict;
use warnings;

use CGI;
use JSON;

use HON::Http::UrlChecker::Service qw/checkUrl/;

my $cgi = CGI->new();
my $url = $cgi->param('url') || undef;

if (defined $url) {
  my @listOfStatus = checkUrl($url);
  my $json = to_json(\@listOfStatus, {pretty => 1});
  printOutput($json, 200);
} else {
  printOutput(
    '{"error": "Bad Request"}',
    '400 Bad Request'
  );
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
