#!/usr/bin/perl
use DBIx::Cookbook::RDBO::RoseDB;

use strict;
use warnings;

my $rosedb = DBIx::Cookbook::RDBO::RoseDB->new;

warn $rosedb->username;

warn $rosedb->dbh;


=head1 NAME

rdbo_test_rosedb - a script 

=head1 SYNOPSIS

  ./scripts/

=head1 DESCRIPTION
