package DBIx::Cookbook::RDBO::Command::fetch_all;
use Moose;
extends qw(MooseX::App::Cmd::Command);

has order_by => (
		 traits => [qw(Getopt)],
		 isa => "Str",
		 is  => "rw",
		);


sub execute {
  my ($self, $opt, $args) = @_;

  my @attr = $opt->{order_by} ? (sort_by => $opt->{order_by} ) : () ;

  use Sakila::Actor::Manager;


  #my $result = Sakila::Actor::Manager->get_actor;
  my $result = Sakila::Actor::Manager->get_actor_iterator(@attr);

  warn $result;

  while (my $row = $result->next) {
    use Data::Dumper;
    warn Dumper($row->as_tree());
  }
}

1;
