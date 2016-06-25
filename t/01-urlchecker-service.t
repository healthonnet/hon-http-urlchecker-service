use strict;
use warnings;

use HON::Http::UrlChecker::Service qw/p_createUserAgent/;

use Test::More tests => 2;
use Test::MockModule;

my $ua = p_createUserAgent();

is($ua->timeout, 1200);
is($ua->agent, 'HonBot');
