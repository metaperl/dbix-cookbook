use inc::Module::Install;

name     'DBIx-Cookbook';
all_from 'lib/DBIx/Cookbook.pm';
author   q{Terrence Brannon <metaperl@gmail.com>};
license  'perl';

author_tests('xt');

build_requires 'Test::More';

requires 'DBI';

auto_install;

WriteAll;

