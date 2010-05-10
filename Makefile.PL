use inc::Module::Install;

name     'DBIx-Cookbook';
all_from 'lib/DBIx/Cookbook.pm';
author   q{Terrence Brannon <metaperl@gmail.com>};
license  'perl';

author_tests('xt');

build_requires 'Test::More';

requires 'autodie';
requires 'App::Cmd';
requires 'DBI';
requires 'DBIx::DBH';
requires 'File::Slurp';
requires 'Moose';
requires 'MooseX::App::Cmd';
requires 'Template';

auto_install;

postamble <<EOPOST;

all :: sakila pod

sakila:
	./etc/install_sakila.pl

pod:
	perl etc/build_pod.pl

github:
	git commit -a -m "'make release' `date`"; git push

release: clean manifest pod github tardist
	echo "ready for release"
EOPOST



WriteAll;

