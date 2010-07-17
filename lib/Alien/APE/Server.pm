package Alien::APE::Server;
use strict;
use warnings;
use File::ShareDir ':ALL';
use Carp;

our $VERSION = '1.000000049003';
use 5.008;

sub root {
	my ( $self ) = @_;
	return dist_dir('Alien-APE-Server');
}

sub aped {
	my ( $self ) = @_;
	return dist_file('Alien-APE-Server','bin/aped');
}

sub start_dist_aped {
	my $self = shift;
	chdir dist_dir('Alien-APE-Server').'/bin';
	exec('./aped', @_) or croak "couldn't exec aped: $!";
}

1;

=head1 NAME

Alien::APE::Server - Packages the APE-Project (Ajax Push Engine) Server.

=head1 SYNOPSIS

  use Alien::APE::Server;
	
  print Alien::APE::Server->root;
  print Alien::APE::Server->aped;
	
  Alien::APE::Server->start_dist_aped;
  
=head1 DESCRIPTION

This version is based on the github version of APE as described by: B<v1.0-49-ga5d079c>

For using this package, you must furfill all the requirements needed for build APE-Server
from source. You can read about that here: L<http://www.ape-project.org/wiki/index.php/Setup#Installing_from_source_or_git>.
The part about the ./build.sh and the complete download of the source is taken care of by
this package.

=head1 METHODS

=over

=item B<root>

Gives back the directory root of the ape-server installation

=item B<aped>

Gives back the filename of the ape-server aped binary

=item B<start_dist_aped>

Will directly startup the ape-server with the unmodified configuration

=back

=head1 SEE ALSO

L<Net::APE>

APE-Project home page: L<http://www.ape-project.org/>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 BUGS 

Please report any bugs or feature requests through the following methods:

=head1 SUPPORT

=over

=item B<IRC>

You can find me on B<irc.freenode.net> on B<#ape-project> as B<Getty>. Or
somewhere on B<irc.perl.org> with the same nickname.

=item B<Repository>

L<http://github.com/Getty/alien-ape-server>
 
=item B<Issue Tracker>

L<http://github.com/Getty/alien-ape-server/issues>
  
=back

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute APE-Server and this Perl modules under the GPL2 license.

=cut
