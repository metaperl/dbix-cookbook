#!/usr/bin/perl

use strict; use warnings;

use lib "$ENV{DBIX_COOK}/schema/lib/DBIC";

use Sakila;
use DBIx::Cookbook::DBH;

my $schema = Sakila->connect
  (
   sub { DBIx::Cookbook::DBH::dbh }
  );


# SELECT * FROM Actor
sub fetch_all {
    my $rs = $schema->resultset('Actor')->search;
    while (my $row = $rs->next) {
	use Data::Dumper;
	my %data = $row->get_columns;
	warn Dumper(\%data);

    }
}

# get a single row by primary key
# SELECT * FROM Actor WHERE actor_id=199
sub fetch_julia {

    my $row = $schema->resultset('Actor')->find(199);
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
}

# 1:1 relationship

sub pre_11 {

  my $rs = $schema->resultset('Staff')->search
      (
       { 'me.staff_id' => 2 },
       { prefetch => [ 'store' ] }
      );

    while (my $row = $rs->next) {
	warn $row->store->address_id ;
    }
}


# 1:n relationship
# SELECT * FROM Customer c INNER JOIN Payment USING (customer_id) WHERE c.customer_id=599 
# DOES NOT WORK
sub pre_1n {

    my $rs = $schema->resultset('Customer')->search
      (
       { 'me.customer_id' => 599 },
       { prefetch => [ 'payments' ] }
      );

    while (my $row = $rs->next) {
	warn $row->payment_id ;
    }
}

# complex where

sub cw {

  my $where = { 'country.country' => { like => 'Ang%' } } ;
  my $attr  = { join => 'country' } ;

  my $rs = $schema->resultset('City')->search($where, $attr);

    while (my $row = $rs->next) {
	warn $row->store->address_id ;
    }
}

# ----------------------- Create ------------------------

sub add_language {
  my($lang)=@_;

  my $lang_rs = $schema->resultset('Language');
  $lang_rs->create
    ({
      name => 'Perl'
     });
}

sub add_language_2 {
  my($lang)=@_;

  my $lang_rs = $schema->resultset('Language');
  my $lang_row = $lang_rs->new({ name => $lang });
  $lang_row->insert;
}

sub update_1 {
  my($new_lang)=@_;

  my $lang_row = $schema->resultset('Language')->find(3);
  $lang_row->name($new_lang);
  $lang_row->update;
}

sub update_1a {
  my($new_lang)=@_;

  my $lang_row = $schema->resultset('Language')->find(4);
  $lang_row->update({name => $new_lang});
}

sub update_2 {
  my($new_lang)=@_;

  my $lang_rs = $schema->resultset('Language')->search
    ({
      name => { like => 'P%' }
     });
  $lang_rs->update({ name => 'Apple' });
}

sub delete_one_row {
  my($new_lang)=@_;

  my $lang_rs = $schema->resultset('Language')->find(2);
  $lang_rs->delete;
}

sub delete_multi_rows {
  my($new_lang)=@_;

  my $lang_rs = $schema->resultset('Language')->search
    ({
      language_id => { '>=' , 6 }
     });

  $lang_rs->delete; # delete_all for cascading delete
}



#fetch_all;
#fetch_julia;
#pre_11;
#prefetch;
#add_language('Perl');
#add_language_2('Prolog');
#update_1('Scheme');
#update_2;
#delete_one_row;
#delete_multi_rows;
