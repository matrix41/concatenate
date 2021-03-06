#! /usr/bin/perl -w

use strict;
use warnings;
use feature qw(switch say); # need this for GIVEN-WHEN block

#Define: 
my $count = 0;
my $parameter;
my $value;
my $superstring;


# print "Enter filename --> ";
# my $inputfile = <STDIN>;
# chomp $inputfile;

#Get filename from command line argument
my $inputfile = $ARGV[0];
chomp $inputfile;


#Declare new filehandle and associated it with filename
open (my $fh, '<', $inputfile) or die "\nCould not open file '$inputfile' $!\n";

$superstring .= "USER:            raymond\n";
$superstring .= "BUILD:           6.1\n";
$superstring .= "DESCRIPTION:     Stellar/Planetary Parameters Additions and Updates\n";
$superstring .= "FILETYPE:        edm\n";
$superstring .= "FILENAME:        $inputfile\n";
$superstring .= "DATE:            2014-06-10 09:52:41\n";
$superstring .= "#\n";
$superstring .= "# Addition of planet parameter values\n";
$superstring .= "#\n";
$superstring .= "EDMT|planet";
while ( my $line = <$fh> ) {
#Step 1 of 4: Split the line on the pipe character.
	($parameter, $value) = split ('\|', $line);
#Step 2 of 4: Get rid of all the white spaces in the parameter name
	$parameter =~ s/\s*$//g;
#Step 3 of 4: Get rid of all the white spaces in the data value
	$value =~ s/\s*$//g;
#Step 4 of 4: Prints only those parameter names that do not end 
# with 'format', 'str', or 'def'
    if ( $parameter !~ /format$/ )
    {
        if ( $parameter !~ /str$/ )
        {
      	    if ( $parameter !~ /def$/)
      	    {
	            print "|", $parameter, $value;
              if ( $count == 1 )
              {
                $superstring .= "|add";
                $count = $count + 1;
              }
# In the IF-block below, use && instead of ||.  Using || will just 
# short-circuit the algorithm because the first statement match will 
# evaluate to true and the remaining statements will not be evaluated. 
              if ( ( $parameter !~ /^plnletter$/ ) && 
                   ( $parameter !~ /^rowupdate$/ ) && 
                   ( $parameter !~ /^cntr$/ ) )
              {
                $superstring .= "|";
                if ( $parameter !~ /^objectid$/ )
                {
                  $superstring .= "$parameter";
                }
                if ( $value eq "" )
                {
                   $superstring .= " null";
                }
                else
                {
                   $superstring .= "$value";
                }
                $count = $count + 1;
               }
      	    }
        }
    }
}
# Close file when done 
print "\n";
$superstring .= "|";
close $fh;


# print "\nLine count is $count\n";
$superstring .= "\n";

#Declare new filehandle and overwrite filename with content in $superstring
open (my $oh, '>', $inputfile) or die "\nCould not open file '$inputfile' $!\n";
print $oh "$superstring";
close $oh;
