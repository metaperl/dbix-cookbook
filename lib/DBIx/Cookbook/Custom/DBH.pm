package DBIx::Cookbook::Custom::DBH;

use Moose::Role;

sub connect {

  require DBIx::Cookbook::DBH;

  my $config = DBIx::Cookbook::DBH->new;
  my %setup  = $config->for_custom;

  #use Data::Dumper;
  #warn 'setup: ', Dumper(\%setup);

  require DBIx::Custom;

  DBIx::Custom->connect( %setup );

}

1;
