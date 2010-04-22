package DBIx::Cookbook::DBH;

use warnings;
use strict;

use DBIx::DBH;

my %auth = 
  (
   username => 'shootout',
   password => 'shootout1'
  );

my %dsn = 
  (
   driver => 'mysql',
   dbname => 'sakila',
   host   => 'localhost',
   port   => 3306,
  );

my %attr = ( RaiseError => 1 ) ;

my $config = DBIx::DBH->new
  (
   %auth,
   dsn => \%dsn,
   attr => \%attr
  );

sub dbh {

  $config->dbh;
}

sub connect_data {
  $config->for_dbi;
}

1;

=head1 NAME

DBIx::Cookbook::DBH -- base class holding connection data and dbh() method

=head1 SYNOPSIS

Get connection data from class:

  my $c = DBIx::Cookbook::DBH::connect_data;

C<$c> will be:

  {
   dsn => "dbi:mysql:database=sakila;host=localhost;port=3306",
   user => 'shootout',
   pass => 'shootout1'
  };

Get a L<DBI> database handle:

  my $dbh = DBIx::Cookbook::DBH::dbh;
