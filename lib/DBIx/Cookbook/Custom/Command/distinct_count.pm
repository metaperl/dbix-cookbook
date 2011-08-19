package DBIx::Cookbook::Custom::Command::distinct_count;
use Moose;
extends qw(MooseX::App::Cmd::Command);

with 'DBIx::Cookbook::Custom::DBH';
with 'DBIx::Cookbook::Util';

has count => (
    isa => "Bool",
    is  => "rw",
);

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $result = $self->connect->select(
        table  => 'actor',
        column => [ [ 'DISTINCT(last_name)' => 'last_name' ] ]
    );

    while ( my $row = $result->fetch_hash ) {
        warn $self->dumper($row);
    }
}

1;

