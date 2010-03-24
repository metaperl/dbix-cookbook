package DBIx::Cookbook::DBIC;
use Moose;
extends qw(MooseX::App::Cmd);


has 'schema' => (is => 'rw');


sub BUILD {
  my ($self)=@_;


  use DBIx::Cookbook::DBIC::Sakila;
  use DBIx::Cookbook::DBH;

  my $schema = DBIx::Cookbook::DBIC::Sakila->connect(  sub { DBIx::Cookbook::DBH::dbh } );

  $self->schema($schema);
}

1;
