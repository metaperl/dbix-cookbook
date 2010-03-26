package DBIx::Cookbook::DBIC::Command::predef_sql;
use Moose;
extends qw(MooseX::App::Cmd::Command);

has inventory_id => (
		 traits => [qw(Getopt)],
		 isa => "Str",
		 is  => "rw",

		);

has customer_id => (
		 traits => [qw(Getopt)],
		 isa => "Str",
		 is  => "rw",

		);


sub execute {
  my ($self, $opt, $args) = @_;

  $opt->{inventory_id} ||= 6;
  $opt->{customer_id}  ||= 554;

  my $rs = $self->app->schema->resultset('Rental')
    ->search_null_rentals($opt->{inventory_id}, $opt->{customer_id});

  while (my $row = $rs->next) {
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
    
  }
}

1;
