package DBIx::Cookbook::Custom::Command::db_func;
use Moose;
extends qw(MooseX::App::Cmd::Command);

with 'DBIx::Cookbook::Custom::DBH';
with 'DBIx::Cookbook::Util';

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $sql = <<'EOSQL';
SELECT first_name, LENGTH(first_name)
FROM actor
EOSQL

    my $result = $self->connect->select(
        table  => 'actor',
        column => [
            'first_name', [ 'LENGTH(actor.first_name)' => 'first_name_length' ]
        ]
    );

    # $result = $self->connect->execute($sql);

    while ( my $row = $result->fetch_hash ) {
        warn $self->dumper($row);
    }
}

1;

