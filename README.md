# NAME

Alien::APE::Server - Packages the APE-Project (Ajax Push Engine) Server.

# SYNOPSIS

  use Alien::APE::Server;
	

  print Alien::APE::Server->root;
  print Alien::APE::Server->aped;
	

  Alien::APE::Server->start_dist_aped;
  

# DESCRIPTION

This version is based on the github version of APE as described by: __v1.0-49-ga5d079c__

For using this package, you must furfill all the requirements needed for build APE-Server
from source. You can read about that here: <http://www.ape-project.org/wiki/index.php/Setup#Installing_from_source_or_git>.
The part about the ./build.sh and the complete download of the source is taken care of by
this package.

# METHODS

- __root__

Gives back the directory root of the ape-server installation

- __aped__

Gives back the filename of the ape-server aped binary

- __start_dist_aped__

Will directly startup the ape-server with the unmodified configuration

# SEE ALSO

[Net::APE](http://search.cpan.org/perldoc?Net::APE)

APE-Project home page: <http://www.ape-project.org/>

# AUTHOR

Torsten Raudssus <torsten@raudssus.de>

# BUGS 

Please report any bugs or feature requests through the following methods:

# SUPPORT

- __IRC__

You can find me on __irc.freenode.net__ on __#ape-project__ as __Getty__. Or
somewhere on __irc.perl.org__ with the same nickname.

- __Repository__

<http://github.com/Getty/alien-ape-server>
 

- __Issue Tracker__

<http://github.com/Getty/alien-ape-server/issues>
  

# COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute APE-Server and this Perl modules under the GPL2 license.