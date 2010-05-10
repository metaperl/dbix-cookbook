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
ORM's capabilities with fully-working code that you can actually run!

=head2 Searching

R is the most common CRUD operation. L<DBIx::Cookbook::Recipe::Searching> will
show you common search tasks.


=cut

=head1 INSTALLATION

Installation of L<DBIx::Cookbook> is simple 
(thanks to #perl-help on irc.perl.org):

 perl Makefile.pl
 make
 make install

=head2 The sakila database is installed automatically

Just FYI, there is a C<sakila> target that runs automatically when you
run C<make>. This target downloads the sakila database and loads it
into MySQL. It also stores the MySQL auth credentials in
F<lib/DBI/Cookbook/DBH.pm>. 

If you ever want to run it separately simply type

  make sakila

=head2 Run the examples

For L<DBIx::Class>, you would execute F<scripts/dbic_cmd>:

  dbic_cmd complex_where
  dbic_cmd paged
  dbic_cmd subquery

Invoke F<dbic_cmd> without arguments to see all possible queries
to run:

  metaperl@locohost:~/prg/DBIx-Cookbook$ ./scripts/dbic_cmd 
  Available commands:

             commands: list the application's commands
                 help: display a command's help screen

        complex_where: (unknown)
           custom_sql: (unknown)
              db_func: (unknown)
       distinct_count: (unknown)
            fetch_all: (unknown)
          fetch_first: (unknown)
         fetch_single: (unknown)
           get_column: (unknown)
             grouping: (unknown)
                paged: (unknown)
    predefined_search: (unknown)
     specific_columns: (unknown)
              sql_lhs: (unknown)
          stored_proc: (unknown)
             subquery: (unknown)
  subquery_correlated: (unknown)

F<skinny_cmd> and F<rdbo_cmd> currently implement C<fetch_all> but no other
examples.

=head1 CONTRIBUTING (another ORM)

It is highly desired to have code from as many ORMs as possible. In
this section we will review the steps to install another ORM
into L<DBIx::Cookbook>.

=head2 Rose::DB::Object

Let's see how I added L<Rose::DB::Object> to the Cookbook.

=head3 Make the ORM-database connection

The file
L<lib/DBIx/Cookbook/RDBO/RoseDB.pm|http://github.com/metaperl/dbix-cookbook/blob/master/lib/DBIx/Cookbook/RDBO/RoseDB.pm>
was used to form a connection to the database to Rose::DB::Object via
the L<Rose::DB> protocol.

=head3 Create a command class

L<DBIx::Cookbook> uses L<MooseX::App::Cmd> to separate the mechanics
of scripting from command development. Let's copy
F<lib/DBIx/Cookbook/DBIC.pm> to
F<lib/DBIx/Cookbook/RDBO.pm> and modify it.

=head3 Write a ::Loader script

F<scripts/rdbo_loader> was used to scan the entire database for
entities and relations and store them in Perl classes

As a sidenote, I had to write a custom base class instead of
using the autogenerated base class so that the C<as_tree> method in
L<Rose::DB::Object::Helpers> was available to all row instances.

=head3 Write a command script

L<DBIx::Cookbook::RDBO::Command::fetch_all> is the command that I
implemented after writing the base command class and creating 
Rose::DB::Object classes for the database schema

=head3 Write a command

This time we copy F<lib/DBIx/Cookbook/DBIC/Command/fetch_all.pm> to 
F<lib/DBIx/Cookbook/DBIC/Command/fetch_all.pm> and modify it to load in
the Rose::DB::Object schema and fetch the results of the table.

=head2 DBIx::Skinny

A similar set of steps was followed for L<DBIx::Skinny>. I had some
problems getting it L<setup|http://groups.google.com/group/dbix-skinny/topics?start=>

but the Skinny crew was very helpful both via the google group and IRC
channel (as was Siracusa for RDBO).

The hardest part was again making the ORM-database connection.
The file
L<lib/DBIx/Cookbook/Skinny/Sakila.pm|http://github.com/metaperl/dbix-cookbook/blob/master/lib/DBIx/Cookbook/Skinny/Sakila.pm>
is how the connection was made.

=head1 AUTHOR

Terrence Brannon, C<< <metaperl at gmail.com> >>

=head2 Acknowledgements

=head3 DBIx::Skinny

Yoshimi Keiji, Atsushi Kobayashi, Ryo Mikake

=head3 Rose::DB::Object 

John Siracusa

=head3 #perl-help

Possum (Daniel LeWarne) - massive help on the F<etc/install-sakila.pl> script!

Matthew Trout:

   [10:24] <mst> metaperl: I tend to use ExtUtils::MakeMaker::prompt
   for simple stuff 
   [10:24] <mst> metaperl: see Devel::REPL for using Term::ReadLine
   for more complex things 
   [10:35] <metaperl> Before releasing DBIx::Cookboox to CPAN, how to
   eliminate the need for config.bashrcwhich is being used through
   various .pm files via use lib "$ENV{DBIX_COOK}/etc/etc/" 
   [10:37] <mst> er. why not use FindBin?

=head3 Pod::Server

Writing all the docs for this would have been much harder to review and
debug without John Beppu's L<Pod::Server.>

=head1 Support, source code, etc 

irc://irc.perl.org/#dbix-class - I can be found as 'metaperl' here

You can find documentation for this module with the perldoc command.

    perldoc DBIx::Cookbook

=head2 Source Code Repo

   git clone http://github.com/metaperl/dbix-cookbook.git


=head1 LICENSE AND COPYRIGHT

Copyright Terrence Brannon.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of DBIx::Cookbook
