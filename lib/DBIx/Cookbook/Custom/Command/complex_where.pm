package DBIx::Cookbook::Custom::Command::complex_where;
use Moose;
extends qw(MooseX::App::Cmd::Command);

with 'DBIx::Cookbook::Custom::DBH';
with 'DBIx::Cookbook::Util';


has order_by => (
		 isa => "Str",
		 is  => "rw",
		);


sub execute {
  my ($self, $opt, $args) = @_;

  my @attr = $opt->{order_by} ? (sort_by => $opt->{order_by} ) : () ;

  my $sql=<<'EOSQL';
SELECT * FROM film
WHERE 
  ( DESCRIPTION LIKE '%drama' AND title LIKE 'bikini%' )
  OR title = 'BANG KWAI'
EOSQL

  my $result = $self->connect->execute($sql);

  while (my $row = $result->fetch_hash) {
    warn $self->dumper($row);
  }
}

1;

