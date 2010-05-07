#!/usr/bin/perl

use strict;
use warnings;

use autodie;

use ExtUtils::MakeMaker;
use File::Slurp;
use LWP::Simple;

chdir 'tmp';

my $zip = 'sakila-db.zip';
my $url  = "http://downloads.mysql.com/docs/$zip";

# does not work:
# getstore $url, $zip;

system("wget --verbose --continue $url");
system("unzip $zip");

print "We need credentials for logging into MySQL and installing Sakila\n";
my $username = prompt('username');
my $password = prompt('password');
my $host = prompt(host => 'localhost');
my $port = prompt(port => 3306);

my @opt = ("--user=$username", "--password=$password",
	   "--host=$host", "--port=$port");

for my $sql qw(sakila-schema.sql sakila-data.sql) {
  my $file = "sakila-db/$sql";
  my $contents = read_file($file); 
  
  open my $fh, '|-', 'mysql', @opt;

  print $fh $contents;
}
