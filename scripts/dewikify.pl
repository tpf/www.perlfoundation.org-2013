#!/usr/bin/perl

use strict;
use warnings;

## Need to remove all the crazy comments
system("mv", "$ARGV[0]", "$ARGV[0].old");
open(OLD, "$ARGV[0].old") || die "ERROR: Could not open file.\n";
open(NEW, ">", "$ARGV[0]") || die "ERROR: Could not create new file.\n";

## http://www.perlmonks.org/?node_id=285983
my $markup = do { local $/; <OLD> };
$markup =~ s/<!--.*?--\s*>//gs;
print NEW $markup;

close(NEW);
close(OLD);
