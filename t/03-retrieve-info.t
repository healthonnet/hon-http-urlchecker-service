use strict;
use warnings;

use HTTP::Response;

use HON::Http::UrlChecker::Service qw/p_retrieveInfo/;

use Test::More tests => 1;

my $response = HTTP::Response->new(200, 'OK');
$response->header(
  date           => 'Sat, 25 Jun 2016 16:38:00 GMT',
  server         => 'Apache',
  content_length => 666,
);

my %expectedResult = (
  code    => 200,
  date    => 'Sat, 25 Jun 2016 16:38:00 GMT',
  server  => 'Apache',
  message => 'OK',
);

my %status = p_retrieveInfo($response);
is_deeply(\%status, \%expectedResult, 'retrieve response info');
