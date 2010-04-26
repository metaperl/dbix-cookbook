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

  my $where = {};
  my $attr = {};

  if (my $val = $opt->{order_by}) {
    $attr->{order_by} = $val;
  }

  my $rs = $self->app->schema->resultset('Actor')->search($where, $attr);

  use DBIx::Cookbook::RDBO::Schema::Actor::Manager;


  while (my $row = $rs->next) {
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
    
  }
}

1;
