package DBIx::Cookbook::DBH;

use warnings;
use strict;

use DBIx::DBH;

my %dat = 
  (
   driver => 'mysql',
   dbname => 'sakila',
   host   => 'localhost',
   port   => 3306,
   user => 'shootout',
   password => 'shootout1'
  );

my %opt = ( RaiseError => 1 ) ;

=for comment

The code below is ol'sk00l. DBIx::DBH should be rewritten 

=cut


sub dbh {

    use DBI;

    my $dbh = DBIx::DBH->connect( %dat, %opt )

}

sub connect_data {
  DBIx::DBH->connect_data( %dat, %opt )
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
