package DBIx::Cookbook::DBIC::Command::custom_sql;
use Moose;
extends qw(MooseX::App::Cmd::Command);

use Data::Dump;

use DBIx::Cookbook::DBIC::CustomSQL;

sub execute {
  my ($self, $opt, $args) = @_;

  my $rs = do {
    my $where = {};
    my $attr  = { bind => [ 'C%' ] };
    $self->app->schema->resultset('OverdueDVDs')->search($where, $attr);
  };

  my $row = $rs->single;

  my %data = $row->get_columns;
  warn Data::Dump::dump(\%data);

}

1;
