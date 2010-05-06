package Sakila;

our $config;

BEGIN {

  use DBIx::Cookbook::DBH;
  $config = DBIx::Cookbook::DBH->new;

}

# use DBIx::Skinny::Schema setup => 
my %setup = $config->for_skinny_setup;
use Data::Dumper;
warn 'setup: ', Dumper(\%setup);
use DBIx::Skinny setup => 
  {
   %setup
  };



1;
