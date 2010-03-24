package DBIx::Cookbook::DBIC::Command::complex_where;
use Moose;
extends qw(MooseX::App::Cmd::Command);

use Data::Dump;

sub execute {
  my ($self, $opt, $args) = @_;

  my $rs = do {

    my $where = 
      {
       -or => [
	       -and => [
			description => { 'like' , '%drama%' },
			title => { 'like', 'bikini%' }
		       ],
	       title => 'BANG KWAI'
	      ]
      };

    my $attr = { order_by => 'title' };

    my $retval = $self->app->schema->resultset('Actor')->search($where, $attr)->as_query;
    my @a = @{${$retval}};
  

    warn Data::Dump::dump(@a);
  };
}

1;
