package Sakila::FilmText;

use strict;

use base qw(Sakila::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'film_text',

    columns => [
        film_id     => { type => 'integer', not_null => 1 },
        title       => { type => 'varchar', length => 255, not_null => 1 },
        description => { type => 'text', length => 65535 },
    ],

    primary_key_columns => [ 'film_id' ],
);

1;

use Rose::DB::Object::Helpers qw(as_tree);
