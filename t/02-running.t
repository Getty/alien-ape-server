#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 2;
use FindBin;
use LWP::UserAgent;
use HTTP::Request;
use Proc::Background;

BEGIN {

	diag('starting ape...');
	my $aped = Proc::Background->new("( cd $FindBin::Bin/../ape-server/bin && ./aped )");
	diag('waiting a second...');
	sleep 1;

	ok($aped->alive, 'startup check');
	
	my $http_client = LWP::UserAgent->new();
	$http_client->timeout(2);

	diag('starting request...');
	my $http_response = $http_client->request(HTTP::Request->new(
		GET => 'http://localhost:6969/'
	));
	
	my $reply = $http_response->content;

	ok($reply =~ m/No command given./ && $reply =~ m!http://www\.ape-project\.org/!, 'ape server reply');
	
	while( $aped->alive ) {
		diag('killing ape...');
		$aped->die;
		sleep 1;
		$aped->wait;
	}

}
