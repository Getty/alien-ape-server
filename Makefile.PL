use inc::Module::Install;

# Create the Makefile
name            'Alien-APE-Server';
perl_version    '5.008';
license         'gpl2';
all_from        'lib/Alien/APE/Server.pm';

requires        'File::ShareDir';

test_requires   'Test::More' => '0.42';
test_requires   'FindBin';
test_requires   'Proc::Background';
test_requires   'LWP::UserAgent';
test_requires   'HTTP::Request';

author_requires 'Module::Install::AuthorRequires';
author_requires 'Module::Install::AutoLicense';
author_requires 'Module::Install::AutoManifest';

no_index        directory => 'ape-server';

install_script  'alien_ape_server_dist';

# get_file        'http://github.com/APE-Project/APE_Server/tarball/a5d079cece721c38f48177589ef3a9bd8b7137c2';

auto_license;
auto_install;
auto_manifest;

my $S = ($^O eq 'MSWin32') ? "\\" : "\/";
my $root = "\$(INST_LIB)${S}auto${S}share${S}dist${S}\$(DISTNAME)";

sub MY::postamble {
	return <<"APE_BUILD_MAKEFILE";

all :: ape-server/bin/aped ape-server/modules/lib/libmod_spidermonkey.so

ape-server/bin/aped: ape-server/build.sh
		( cd ape-server && .${S}build.sh )

ape-server/modules/lib/libmod_spidermonkey.so :: ape-server/bin/aped
		
pure_all :: aped_to_blib
		
aped_to_blib: ape-server/bin/aped ape-server/modules/lib/libmod_spidermonkey.so blibdirs
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
