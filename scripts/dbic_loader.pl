#!/usr/bin/perl

use DBIx::Class::Schema::Loader qw/ make_schema_at /;

use DBIx::Cookbook::DBH;

use strict;
use warnings;


my $dump_dir="$ENV{DBIX_COOK}/schema/lib/DBIC";
my $c = DBIx::Cookbook::DBH::connect_data;

make_schema_at 
  ( 
   'Sakila',
   {
    debug => 1, 
    dump_directory => $dump_dir,
    },
   [
    $c->{dsn}, $c->{user}, $c->{pass}
    ]
  );


