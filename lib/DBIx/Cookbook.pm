package DBIx::Cookbook;

use warnings;
use strict;

our $VERSION = '0.01';


=head1 NAME

DBIx::Cookbook - executable cookbook code for DBI(-based ORMs)?

=head1 SYNOPSIS

   dbic_cmd distinct_count
   dbic_cmd grouping

=head1 DESCRIPTION

L<DBIx::Cookbook> is a working cookbook of code for L<DBI>-based ORMs. 
It is based on the Sakila database schema 
(L<http://dev.mysql.com/doc/sakila/en/sakila.html>). Currently, the
majority of code is for L<DBIx::Class> but all ORMs are encouraged to
contribute code so that comparisons can be made between various ORMs
for the same task. 

If you only want to read the code samples, then simply see L</RECIPES>. If you
want to run them on actual data, the see L</INSTALLATION>. And for those that
want to contribute more code, see L</CONTRIBUTING>.

=head1 RECIPES

The recipes section gives you a good overview of each
ORMs capabilities with fully-working code that you can actually run!

=head2 Searching

R is the most common CRUD operation. L<DBIx::Cookbook::Recipe::Searching> will
show you common search tasks.


=cut

=head1 INSTALLATION

=head2 Install the Sakila database into MySQL

The MySQL installation instructions:

L<http://dev.mysql.com/doc/sakila/en/sakila.html#sakila-installation>

are quite clear. Be sure to retain the MySQL login information because you
will need it for the next step.


=head2 Download and configure DBIx::Cookbook

   git clone http://github.com/metaperl/dbix-cookbook.git

=head3 Configure DBIx::Cookbook::DBH

Edit F<lib/DBIx/Cookbook/DBH.pm>, setting the C<dsn>, C<user>, and
C<pass> in C<%c>:

  our %c = 
  (
   dsn => "dbi:mysql:database=sakila;host=localhost;port=3306",
   user => 'shootout',
   pass => 'shootout1'
  );


=head2 Run the Cookbook examples

For DBIx::Class, you would execute F<scripts/dbic_cmd>:

  dbic_cmd complex_where
  dbic_cmd paged
  dbic_cmd subquery

etc.

=head1 CONTRIBUTING (another ORM)

It is highly desired to have code from as many ORMs as possible. In
this section we will review the steps to install another ORM
into L<DBIx::Cookbook>.

=head2 Rose::DB::Object

Let's see how I added L<Rose::DB::Object> to the Cookbook. I've only written
one reciple, so it still needs to flesh out the problem space with examples,
but I will let the RDBO addicts handle that C<< ;) >>.

=head3 Create a command class

I copied the DBIx::Class command class, L<DBIx::Cookbook::DBIC> to
L<DBIx::Cookbook::RDBO> and modified it




L<DBIx::Cookbook> uses L<MooseX::App::Cmd> to separate the mechanics
of scripting from command development. Let's copy 
F<lib/DBIx/Cookbook/DBIC.pm> to 
F<lib/DBIx/Cookbook/Rose.pm> and modify it so that all of our 
DBIx::Simple commands will be able to make DBIx::Simple APi calls 
by simply doing:

   $self->app->simple->simple_api_call()



=head3 Edit installation section

Add a section to L</Connect the ORM to the Sakila database>


=head1 AUTHOR

Terrence Brannon, C<< <metaperl at gmail.com> >>


=head1 SUPPORT

irc://irc.perl.org/#dbix-class - I can be found as 'metaperl' here

You can find documentation for this module with the perldoc command.

    perldoc DBIx::Cookbook


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker / bug report system

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=DBIx-Cookbook>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/DBIx-Cookbook>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/DBIx-Cookbook>

=item * Search CPAN

L<http://search.cpan.org/dist/DBIx-Cookbook/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Terrence Brannon.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of DBIx::Cookbook
