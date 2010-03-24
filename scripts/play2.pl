#!/usr/bin/perl

use strict; use warnings;

use lib "$ENV{SHOOTOUT}/lib";
use lib "$ENV{SAKILA}";
use lib "$ENV{SAKILA}/DBIx/Class";

use Sakila; 


use Sakila::DBH;

my $schema = Sakila->connect
  (
   sub { Sakila::DBH::dbh }
  );




#fetch_all;
#fetch_julia;
#pre_11;
#prefetch;
#add_language('Perl');
#add_language_2('Prolog');
#update_1('Scheme');
#update_2;
#delete_one_row;
delete_multi_rows;
