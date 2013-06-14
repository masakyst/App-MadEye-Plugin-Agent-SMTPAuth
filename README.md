# NAME

App::MadEye::Plugin::Agent::SMTPAuth - check SMTP Authentication.

# SYNOPSIS

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

# DESCRIPTION

App::MadEye::Plugin::Agent::SMTPAuth is a STMP Authentication plugin of App::MadEye.

# DEPENDENCY

required Authen::SASL

# LICENSE

Copyright (C) Masaaki Saito.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Masaaki Saito <masakyst.public@gmail.com>
