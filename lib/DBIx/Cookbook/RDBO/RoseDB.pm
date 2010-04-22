package DBIx::Cookbook::RDBO::RoseDB;

use DBIx::DBH;

__PACKAGE__use_private_registry;

use DBIx::Cookbook::DBH;

# Register your lone data source using the default type and domain
__PACKAGE__->register_db
  (
   domain   => __PACKAGE__->default_domain,
   type     => __PACKAGE__->default_type,
   driver   => 'mysql',
   database => 'sakila',
   host     => 'localhost',
   username => 'joeuser',
   password => 'mysecret',
  );

1;


