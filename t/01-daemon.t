#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 2;
use FindBin;

BEGIN {
	my $help = `$FindBin::Bin/../ape-server/bin/aped --help`;
	ok($help =~ m/AJAX Push Engine Server 1\.01dev/ && $help =~ m/Show version number/, 'testing ape-server help');
	my $unknown = `$FindBin::Bin/../ape-server/bin/aped --unknowncommand`;
	ok($unknown =~ m/AJAX Push Engine Server 1\.01dev/ && $unknown =~ m/Unknown parameters/, 'testing ape-server unknown parameters');
}
