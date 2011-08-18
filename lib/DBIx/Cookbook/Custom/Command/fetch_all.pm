package DBIx::Cookbook::Custom::Command::fetch_all;
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

  my $result = $self->connect->select(table => 'actor');

  while (my $row = $result->fetch_hash) {
    warn $self->dumper($row);
  }
}

1;

