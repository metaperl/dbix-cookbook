package DBIx::Cookbook::DBH;

use warnings;
use strict;


our %c = 
  (
   dsn => "dbi:mysql:database=sakila;host=localhost;port=3306",
   user => 'shootout',
   pass => 'shootout1'
  );


sub dbh {

    use DBI;

    #warn "my dbh = DBI->connect( $c{dsn}, $c{user}, $c{pass}, { RaiseError => 1 } ) ;" ;
    my $dbh = DBI->connect( $c{dsn}, $c{user}, $c{pass}, { RaiseError => 1 } ) ;

}

sub connect_data {
    \%c;
}

1;
