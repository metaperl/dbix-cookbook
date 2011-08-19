package DBIx::Cookbook::Custom::Command::grouping;
use Moose;
extends qw(MooseX::App::Cmd::Command);

with 'DBIx::Cookbook::Custom::DBH';
with 'DBIx::Cookbook::Util';

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $result = $self->connect->select(
        table  => 'actor',
        column => [ 
	  qw(first_name last_name),
	  [ 'COUNT(film_actors.actor_id)' => 'film_count' ] ]
    );

    while ( my $row = $result->fetch_hash ) {
        warn $self->dumper($row);
    }
}

1;

