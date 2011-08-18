package DBIx::Cookbook::AppCmd;
use Moose;
extends qw(MooseX::App::Cmd);

use Data::Dumper;

sub dumper {
  my ($self, @struct);
  Data::Dumper::Dumper(@struct);
}

1;
