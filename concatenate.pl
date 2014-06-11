#! /usr/bin/perl -w

use strict;
use warnings;
use feature qw(switch say); # need this for GIVEN-WHEN block

#Define: 
my $count;
my $parameter;
my $value;


print "Enter filename --> ";
my $inputfile = <STDIN>;
chomp $inputfile;


open (my $fh, '<', $inputfile) or die "\nCould not open file '$inputfile' $!\n";

while ( my $line = <$fh> ) {
#Step 1 of 4: Split the line on the pipe character.
	($parameter, $value) = split ('\|', $line);
#Step 2 of 4: Get rid of all the white spaces in the parameter name
	$parameter =~ s/\s*$//g;
#Step 3 of 4: Get rid of all the white spaces in the data value
	$value =~ s/\s*$//g;
#Step 4 of 4: Print to screen
	print "|", $parameter, $value;

#Keep track of the count
    $count = $.	
}


print "\nLine count is $count\n";
close $fh;

