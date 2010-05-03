package Sakila::Language::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use Sakila::Language;

sub object_class { 'Sakila::Language' }

__PACKAGE__->make_manager_methods('language');

1;

use Rose::DB::Object::Helpers qw(as_tree);
