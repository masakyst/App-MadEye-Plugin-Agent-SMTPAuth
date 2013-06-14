package App::MadEye::Plugin::Agent::SMTPAuth;

our $VERSION = "0.01";

use strict;
use warnings;
use App::MadEye::Plugin::Agent::Base;
use Net::SMTP;

sub is_dead {
    my ($self, $host) = @_;

    my $conf = $self->config->{config};
    my $user     = $conf->{user}     or die "missing user";
    my $password = $conf->{password} || '';
    my $timeout  = $conf->{timeout} || 5;

    my $smtp = Net::SMTP->new($host, Timeout => $timeout);
    if ($smtp) {
        my $res = $smtp->auth($user, $password);
        if ($res) {
            $smtp->quit;
            return;
        }
        $smtp->quit;
    }
    return "DEAD";
}

1;
__END__

=encoding utf-8

=head1 NAME

App::MadEye::Plugin::Agent::SMTPAuth - check SMTP Authentication.

=head1 SYNOPSIS

    +{
        module => 'Agent::SMTPAuth',
        config => +{
            target => [qw/
                target_domain
            /],
            user     => 'hoge',
            password => 'fuga',
            timeout  => 10,
        },
    },

=head1 DESCRIPTION

App::MadEye::Plugin::Agent::SMTPAuth is a STMP Authentication plugin of App::MadEye.

=head1 SCHEMA

    type: map
    mapping:
        target:
            type: seq
            required: yes
            sequence:
                - type: str
        user:
            required: yes
            type: str
        password:
            required: yes
            type: str
        timeout:
            required: yes
            type: int

=head1 DEPENDENCY

required Authen::SASL

=head1 LICENSE

Copyright (C) Masaaki Saito.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Masaaki Saito E<lt>masakyst.public@gmail.comE<gt>

=cut

