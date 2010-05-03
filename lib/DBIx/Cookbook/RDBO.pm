package DBIx::Cookbook::RDBO;
use Moose;
extends qw(MooseX::App::Cmd);

use lib "$ENV{DBIX_COOK}/lib/DBIx/Cookbook/RDBO";

use Rose::DB::Object::Helpers qw(as_tree);

1;
