use 5.006;
use strict;
use warnings;
use Module::Build;

my %cgis;
$cgis{$_} = $_ foreach <cgi/*>;

my $builder = Module::Build->new(
  module_name        => 'HON::Http::UrlChecker::Service',
  license            => 'mit',
  dist_author        => q{William Belle <william.belle@gmail.com>},
  dist_version_from  => 'lib/HON/Http/UrlChecker/Service.pm',
  release_status     => 'stable',
  configure_requires => { 'Module::Build' => 0, },
  build_requires     => {
    'Test::More'            => 0,
    'File::Temp'            => 0.2304,
    'Test::Exception'       => 0.43,
    'File::Find::Rule'      => 0.34,
    'File::Copy::Recursive' => 0.38,
  },
  requires => {
    'CGI'            => 4.31,
    'URI'            => 1.71,
    'Carp'           => 1.38,
    'JSON'           => 2.90,
    'Try::Tiny'      => 0.24,
    'Readonly'       => 2.05,
    'LWP::UserAgent' => 6.15,
  },
  cgi_files          => \%cgis,
  add_to_cleanup     => ['HON-Http-UrlChecker-Service-*'],
  create_makefile_pl => 'traditional',
);

$builder->add_build_element('cgi');
$builder->create_build_script();
