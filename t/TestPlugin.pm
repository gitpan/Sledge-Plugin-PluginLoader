package TestPlugin;
use strict;
use warnings;

sub import {
    my $pkg = caller;
    no strict 'refs';
    *{"$pkg\::testtest"} = sub {"FOO"};
}

1;
