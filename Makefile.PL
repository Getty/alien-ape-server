use inc::Module::Install;

# Create the Makefile
name            'Alien-APE-Server';
perl_version    '5.008';
license         'perl';
all_from        'lib/Alien/APE/Server.pm';
requires        'File::ShareDir';
test_requires   'Test::More' => '0.42';

auto_install;

my $S = ($^O eq 'MSWin32') ? "\\" : "\/";
my $root = "\$(INST_LIB)${S}auto${S}share${S}dist${S}\$(DISTNAME)";

sub MY::postamble {
	return <<"APE_BUILD_SH";

all :: ape-server/bin/aped

ape-server/bin/aped: ape-server/build.sh
		( cd ape-server && ./build.sh )

install :: install_aped
		
install_aped: ape-server/bin/aped
		\$(NOECHO) \$(MKPATH) $root
		\$(NOECHO) \$(CHMOD) 0755 $root
		\$(NOECHO) \$(CP) -ar ape-server/bin $root
		\$(NOECHO) \$(CP) -ar ape-server/modules $root
		\$(NOECHO) \$(CP) -ar ape-server/scripts $root

clean :: delete_aped

delete_aped:
		\$(RM_F) ape-server/bin/aped
		
APE_BUILD_SH
}

WriteAll;
