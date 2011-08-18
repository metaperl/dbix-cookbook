#!/usr/bin/env perl

use strict;
use warnings;

use autodie;

use ExtUtils::MakeMaker;
use File::Slurp;
use FindBin qw($Bin);
use LWP::Simple;
use Template;

use Archive::Extract;
use LWP::Simple;

my $bin = $FindBin::Bin;

use File::Path;
File::Path::make_path('tmp');

chdir 'tmp';

my $zip = 'sakila-db.zip';
my $url = "http://downloads.mysql.com/docs/$zip";

# does not work:
# getstore $url, $zip;

print "Downloading $url\n";
my $status = getstore( $url, $zip );

if ( is_success($status) ) {
  #print "file downloaded correctly\n";
}
else {
    die "error downloading file: $status\n";
}

print "Unpacking $zip\n";
my $ae = Archive::Extract->new( archive => $zip );
$ae->extract or die $ae->error;

print "We need credentials for logging into MySQL and installing Sakila\n";
print "** In fact, the MySQL instance must be up and running right now. **\n";
print "** And the mysql client must be invokeable (it must be on your PATH) **\n";
print "** If it is not, then you can always type 'make sakila' later.   **\n";
my $username = prompt('username');
my $password = prompt('password');
my $host     = prompt( host => 'localhost' );
my $port     = prompt( port => 3306 );

my @opt = ( "--user=$username", "--password=$password", "--host=$host",
    "--port=$port" );

print "Starting installation of .sql files\n";

for my $sql qw(sakila-schema.sql sakila-data.sql) {

    use File::Spec;
    my $file = File::Spec->catfile( $bin, '..', 'tmp', 'sakila-db', $sql );

    my @system = (
        mysql => "--user=$username",
        "--password=$password",
	"<", $file
#        "--database=test",
#        "-e SOURCE $file"
    );

    warn "@system";
    system "@system";

}

# Now write out connection info

my $dbh_dir = "$Bin/../lib/DBIx/Cookbook";
my $dbh_tt  = "$dbh_dir/DBH.tt";
my $dbh_pm  = "$dbh_dir/DBH.pm";

my %conn = (
    username => $username,
    password => $password,
    host     => $host,
    port     => $port
);

my $tt = Template->new( { ABSOLUTE => 1 } ) or die Template->error;

my $vars = \%conn;
my $opts = {};

$tt->process( $dbh_tt, $vars, $dbh_pm, $opts )
  or do {
    my $error = $tt->error();
    print "error type: ", $error->type(), "\n";
    print "error info: ", $error->info(), "\n";
    print $error, "\n";
  };
