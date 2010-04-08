package DBIx::Cookbook;

use warnings;
use strict;

our $VERSION = '0.01';


=head1 NAME

DBIx::Cookbook - executable cookbook code for DBI-based ORMs

=head1 VERSION

Version 0.01

=cut


=head1 SYNOPSIS

   dbic_cmd distinct_count
   dbic_cmd grouping

=head1 DESCRIPTION

L<DBIx::Cookbook> is a working cookbook of code for L<DBI>-based ORMs. 
It is based on the Sakila database schema 
(L<http://dev.mysql.com/doc/sakila/en/sakila.html>). While it currently only
contains code for L<DBIx::Class>, all ORMs are encouraged to contribute code 
so that comparisons can be made between various ORMs for the same task.

If you only want to read the code samples, then simply see L</RECIPES>. If you
want to run them on actual data, the see L<INSTALLATION>. And for those that
want to contribute more code, see L<CONTRIBUTING>.

=head1 RECIPES

The recipes section loosely bases its structure on 
L<DBIx::Class::Manual::Cookbook>. It will give you a good overview of each
ORMs capabilities.

=over 4

=item L<DBIx::Cookbook::doc::searching::fetch_all> 

how to fetch all records from a table

=item L<DBIx::Cookbook::doc::searching::fetch_single> 

how to fetch a single record from a query which could potentially return many

=item L<DBIx::Cookbook::doc::searching::complex_where> 

how to issue a query with a complex where

=item L<DBIx::Cookbook::doc::searching::db_func> 

how to issue a query with a database function as one of the return columns

=item L<DBIx::Cookbook::doc::searching::distinct_count>

Flexibly return a distinct resultset or the count of it

=item L<DBIx::Cookbook::doc::searching::get_column>

  SELECT column FROM table

=item L<DBIx::Cookbook::doc::searching::group_by>

  GROUP BY

=cut

=head1 INSTALLATION

=head2 Install the Sakila database into MySQL

=head2 Download and Configure DBIx::Cookbook

=head3 Configure DBIx::Cookbook::DBH

=head3 Connect your ORM(s) to the Sakila database via DBIx::Cookbook::DBH

The C<scripts> directory of the distribution contains F<dbic_loader>, a script
which runs L<DBIx::Class::Schema::Loader> on the Sakila instance to build the
schema classes.

=head2 Run the Cookbook examples

  dbic_cmd complex_where
  dbic_cmd paged
  dbic_cmd subquery
 
etc.

=head1 CONTRIBUTING (another ORM)



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
