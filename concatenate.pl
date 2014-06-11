#! /usr/bin/perl -w

use strict;
use warnings;
use feature qw(switch say); # need this for GIVEN-WHEN block

#Define: 

print "Enter filename --> ";
my $inputfile = <STDIN>;
chomp $inputfile;


open (my $fh, '<', $inputfile) or die "\nCould not open file '$inputfile' $!\n";

close $fh;
