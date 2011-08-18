package DBIx::Cookbook::Custom;
use Moose;
extends qw(MooseX::App::Cmd);

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
