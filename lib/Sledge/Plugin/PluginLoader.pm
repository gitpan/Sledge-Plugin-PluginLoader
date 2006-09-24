package Sledge::Plugin::PluginLoader;
use strict;
use warnings;
our $VERSION = '0.02';
use UNIVERSAL::require;

sub import {
    my $self = shift;
    my $pkg  = caller(0);

    no strict 'refs';
    *{"$pkg\::load_plugins"} = sub {
        my ($class, @plugins) = @_;
        my $pkg     = caller;

        for my $plugin (@plugins) {
            my $name = $plugin->require ? $plugin : "Sledge::Plugin::$plugin";

            # XXX Sledge Plugin uses caller in the import method.
            eval qq{
                package $pkg;
                use $name;
            };

            die $@ if $@;
        }
    };
}

1;
__END__

=head1 NAME

Sledge::Plugin::PluginLoader - plugin loader

=head1 SYNOPSIS

    package Your::Pages;
    use Sledge::Plugin::PluginLoader;
    __PACKAGE__->load_plugins(qw(Email::Japanese Cache));
    # This code is equivalent to:
    use Sledge::Plugin::Email::Japanese;
    use Sledge::Plugin::Cache;

=head1 DESCRIPTION

Sledge::Plugin::PluginLoader is an plugin loader for sledge.

This plugin provides readability for your code.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Bundle::Sledge>

=cut
