use inc::Module::Install;

# Create the Makefile
name            'Alien-APE-Server';
perl_version    '5.008';
license         'perl';
all_from        'lib/Alien/APE/Server.pm';
requires        'File::ShareDir';
test_requires   'Test::More' => '0.42';
test_requires   'FindBin';

no_index		'ape-server';

auto_install;

my $S = ($^O eq 'MSWin32') ? "\\" : "\/";
my $root = "\$(INST_LIB)${S}auto${S}share${S}dist${S}\$(DISTNAME)";

sub MY::postamble {
	return <<"APE_BUILD_MAKEFILE";

all :: ape-server/bin/aped ape-server/modules/lib/libmod_spidermonkey.so

ape-server/bin/aped: ape-server/build.sh
		( cd ape-server && .${S}build.sh )

ape-server/modules/lib/libmod_spidermonkey.so :: ape-server/bin/aped
		
install :: install_aped
		
install_aped: ape-server/bin/aped ape-server/modules/lib/libmod_spidermonkey.so 
		\$(MKPATH) $root
		\$(CHMOD) 0755 $root
		\$(CP) -ar ape-server${S}bin $root
		\$(CP) -ar ape-server${S}modules $root
		\$(CP) -ar ape-server${S}scripts $root

clean :: delete_aped

delete_aped:
		\$(RM_F) ape-server${S}bin${S}aped
		\$(RM_F) ape-server${S}modules${S}lib${S}libmod_spidermonkey.so
		
APE_BUILD_MAKEFILE
}

WriteAll;
