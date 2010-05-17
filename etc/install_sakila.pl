#!/usr/bin/env perl

use strict;
use warnings;

use autodie;

use ExtUtils::MakeMaker;
use File::Slurp;
use FindBin qw($Bin);
use LWP::Simple;
use Template;


chdir 'tmp';

my $zip = 'sakila-db.zip';
my $url  = "http://downloads.mysql.com/docs/$zip";

# does not work:
# getstore $url, $zip;

system("wget --verbose --continue $url");
system("unzip $zip");

print "We need credentials for logging into MySQL and installing Sakila\n";
print "** In fact, the MySQL instance must be up and running right now. **\n";
print "** If it is not, then you can always type 'make sakila' later.   **\n";
my $username = prompt('username');
my $password = prompt('password');
my $host = prompt(host => 'localhost');
my $port = prompt(port => 3306);

my @opt = ("--user=$username", "--password=$password",
	   "--host=$host", "--port=$port");

print "Starting installation of .sql files\n";

for my $sql qw(sakila-schema.sql sakila-data.sql) {
  my $file = "sakila-db/$sql";
  my $contents = read_file($file); 

  print "\t$file\n";

  open my $fh, '|-', 'mysql', @opt;

  print $fh $contents;
}

# Now write out connection info

my $dbh_dir = "$Bin/../lib/DBIx/Cookbook";
my $dbh_tt  = "$dbh_dir/DBH.tt";
my $dbh_pm  = "$dbh_dir/DBH.pm";


my %conn = (
	    username => $username,
	    password => $password,
	    host => $host,
	    port => $port
	   );

  my $tt = Template->new({ABSOLUTE=>1}) or die Template->error;

  my $vars = \%conn;
  my $opts = {} ;

  $tt->process($dbh_tt, $vars, $dbh_pm, $opts) or
     do {
        my $error = $tt->error();
        print "error type: ", $error->type(), "\n";
        print "error info: ", $error->info(), "\n";
        print $error, "\n";
    };
