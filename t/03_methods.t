use strict;
use warnings;
use Test::More;
use Test::Exception;
use lib qw(t);

BEGIN {
    eval "use Sledge::Plugin::NoCache";
    plan $@ ? (skip_all => "needs Sledge::Plugin::NoCache for testing $@") : (tests => 4);
}

{
    package Mock::Pages;
    ::use_ok 'Sledge::Plugin::PluginLoader';
    __PACKAGE__->load_plugins(qw(NoCache TestPlugin));
    ::can_ok __PACKAGE__, 'set_no_cache';
    ::is __PACKAGE__->testtest, 'FOO', 'fullpath test';

    ::dies_ok {__PACKAGE__->load_plugins('NotExistPluginName')} 'die if plugin does not exist';
}

