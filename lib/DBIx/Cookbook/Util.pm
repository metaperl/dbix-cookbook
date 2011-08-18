package DBIx::Cookbook::Util;
use Moose::Role;

sub dumper {
  my ($self, @struct)=@_;
  require Data::Dumper;

  Data::Dumper::Dumper(@struct);
}

1;
