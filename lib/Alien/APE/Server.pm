package Alien::APE::Server;
use strict;
use warnings;
use File::ShareDir ':ALL';

our $VERSION = '1.000000049001';
use 5.008;

sub root {
	my ( $self ) = @_;
	return dist_dir('Alien-APE-Server');
}

sub aped {
	my ( $self ) = @_;
	return dist_file('Alien-APE-Server','bin/aped');
}

1;

=head1 NAME

Alien::APE::Server - Packages the APE-Project (Ajax Push Engine) Server.

=head1 SYNOPSIS

	use Alien::APE::Server;
	
	print Alien::APE::Server->root;
	print Alien::APE::Server->aped;
	
	chdir Alien::APE::Server->root.'/bin';
	exec Alien::APE::Server->aped;
  
=head1 DESCRIPTION

This version is based on the github version of APE as described by: B<v1.0-49-ga5d079c>

=head1 METHODS

=item B<root>

Gives back the directory root of the ape-server installation

=item B<aped>

Gives back the filename of the ape-server aped binary

=head1 SEE ALSO

L<Net::APE>

APE-Project home page: L<http://www.ape-project.org/>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 BUGS 

Please report any bugs or feature requests through the methods following.

=head1 SUPPORT

IRC

  You can join #ape-project on irc.freenode.net, talk to Getty
  or you can connect to irc.perl.org and talk there to Getty

Repository

  http://github.com/Getty/alien-ape-server
  Pull request and additional contributors are welcome
 
Issue Tracker

  http://github.com/Getty/alien-ape-server/issues  

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
