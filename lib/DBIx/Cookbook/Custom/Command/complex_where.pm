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
    my ( $self, $opt, $args ) = @_;

=for comment
  my $sql=<<'EOSQL';
SELECT * FROM film
WHERE 
  ( DESCRIPTION LIKE '%drama' AND title LIKE 'a%' )
  OR title = 'BANG KWAI'
EOSQL

  my $result = $self->connect->execute($sql);
=cut

    #use DBI;
    #DBI->trace(1);

    my $result = $self->connect->select(
        table => 'film',
        where => [
            [
                or => [
                    and => "LOWER(DESCRIPTION) LIKE '%drama%'",
                    "LOWER(title) LIKE 'a%'"
                ],
                "title = 'FISH OPUS'"
            ],
            {}
        ]
    );

    while ( my $row = $result->fetch_hash ) {
        warn $self->dumper($row);
    }
}

1;

