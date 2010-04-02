package DBIx::Cookbook::DBIC::Command::db_func;
use Moose;
extends qw(MooseX::App::Cmd::Command);


sub execute {
  my ($self, $opt, $args) = @_;



  my $rs = do {

    my $where = {};
    my $attr = {
		select => [ 'first_name', { LENGTH => 'first_name' } ],
		as     => [ qw/first_name first_name_length/ ]
	       };

    $self->app->schema->resultset('Actor')->search($where, $attr);

  } ;

  while (my $row = $rs->next) {
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
    
  }
}

1;
