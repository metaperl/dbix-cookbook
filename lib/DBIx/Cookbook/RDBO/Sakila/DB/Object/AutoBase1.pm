package Sakila::DB::Object::AutoBase1;

use base 'Rose::DB::Object';

use DBIx::Cookbook::RDBO::RoseDB;

sub init_db { DBIx::Cookbook::RDBO::RoseDB->new() }

1;
use Rose::DB::Object::Helpers qw(as_tree);
