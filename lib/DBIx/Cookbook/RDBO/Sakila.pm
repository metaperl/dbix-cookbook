package DBIx::Cookbook::RDBO::Sakila;

# This is a package I manually created to have fewer use statements in my code
# Then again, on second thought, I'm not adding any code. I'm going to use
# each ORM as it stands

# The way to do this with RDBO is $loader->make_classes

use DBIx::Cookbook::RDBO::Sakila::Actor::Manager;

1;


