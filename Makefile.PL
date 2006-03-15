use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Sledge::Plugin::PluginLoader',
    'VERSION_FROM' => 'lib/Sledge/Plugin/PluginLoader.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More      => 0.32,
        Test::Exception => 0.21,
    },
);
