use inc::Module::Install;

name     'DBIx-Cookbook';
all_from 'lib/DBIx/Cookbook.pm';
author   q{Terrence Brannon <metaperl@gmail.com>};
license  'perl';

author_tests('xt');

build_requires 'Test::More';

requires 'DBI';
requires 'MooseX::App::Cmd';
requires 'DBIx::DBH';
requires 'autodie';

auto_install;

postamble <<EOPOST;
pod:
	perl etc/build_pod.pl

release: manifest pod tardist
	echo "ready for release"
EOPOST



WriteAll;

