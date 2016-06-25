use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name        => 'HON::Http::UrlChecker::Service',
  license            => 'mit',
  dist_author        => q{William Belle <william.belle@gmail.com>},
  dist_version_from  => 'lib/HON/Http/UrlChecker/Service.pm',
  release_status     => 'stable',
  configure_requires => { 'Module::Build' => 0, },
  build_requires     => {
    'Test::More'       => 0,
    'Test::MockModule' => 0.11,
  },
  requires           => { 'LWP::UserAgent' => 6.15, },
  add_to_cleanup     => ['HON-Http-UrlChecker-Service-*'],
  create_makefile_pl => 'traditional',
);

$builder->create_build_script();
