#!/usr/bin/perl

use strict;
use warnings;

use File::Find;

find(\&wanted, '.');

sub filter_pod_code {

  my($text)=@_;

  my @line = split /\n/, $text;
  @line = map { "    " . $_ } @line ;
  join "\n", @line;

}

sub wanted {



  return unless /[.]tt$/ ;

  use Template;
  use File::Basename;

  my ($name, $path, $suffix) = fileparse($File::Find::name, '.tt', '.tt2');

  $path =~ s/RecipeTT/Recipe/;
  my $output_file = "$path$name.pod";

  my $config = {
		INCLUDE_PATH => [ 'lib/DBIx/Cookbook' ],
		FILTERS => { pod_code => \&filter_pod_code },
		DEBUGGING => 1,
		RELATIVE => 1
	       };

  my $tt = Template->new($config) or die Template->error;

  my $vars = {};
  my $opts = {} ;
  warn "$tt->process($File::Find::name, $vars, $output_file, $opts);";
  $tt->process($File::Find::name, $vars, $output_file, $opts) or
     do {
        my $error = $tt->error();
        print "error type: ", $error->type(), "\n";
        print "error info: ", $error->info(), "\n";
        print $error, "\n";
    };

}
