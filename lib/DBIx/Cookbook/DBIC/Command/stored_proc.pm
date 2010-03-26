package DBIx::Cookbook::DBIC::Command::stored_proc;
use Moose;
extends qw(MooseX::App::Cmd::Command);

use Data::Dump;
use DBIx::Cookbook::DBIC::CustomResult::FilmInStock;

has 'film_id' => (
	       traits => [qw(Getopt)],
	       isa => "Int",
	       is  => "rw",
	       documentation => "film_id"
	      );

has 'store_id' => (
	       traits => [qw(Getopt)],
	       isa => "Int",
	       is  => "rw",
	       documentation => "store_id"
	      );


sub execute {
  my ($self, $opt, $args) = @_;

  my $rs = do {
    my $where = {};
    my $attr  = { bind => [ $opt->{film_id}, $opt->{store_id} ] };
    $self->app->schema->resultset('FilmInStock')->search($where, $attr);
  };


  while (my $row = $rs->next) {
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
    
  }

}

1;
