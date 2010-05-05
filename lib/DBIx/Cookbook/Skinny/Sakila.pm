package Sakila;

our $config;

BEGIN {

  use DBIx::Cookbook::DBH;
  $config = DBIx::Cookbook::DBH->new;

}

# use DBIx::Skinny::Schema setup => 
use Sakila::Schema setup => 
  {
   $config->for_dbi
  };



1;
