package Sakila;


BEGIN {

  require DBIx::Cookbook::DBH;

  my $config = DBIx::Cookbook::DBH->new;
  my %setup = $config->for_skinny_setup;

  use Data::Dumper;
  warn 'setup: ', Dumper(\%setup);

  require DBIx::Skinny;

  DBIx::Skinny->import( setup => \%setup );

}




1;
