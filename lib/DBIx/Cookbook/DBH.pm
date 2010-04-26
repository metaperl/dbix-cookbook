package DBIx::Cookbook::DBH;

use Moose;
extends 'DBIx::DBH';

has '+username' => (default => 'shootout');
has '+password' => (default => 'shootout1');

has '+dsn' => 
  (default =>
   sub {
     {
   driver => 'mysql',
   dbname => 'sakila',
   host   => 'localhost',
   port   => 3306,
 }
  }
  );

has '+attr' => (default => sub { { RaiseError => 1 } } );


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
