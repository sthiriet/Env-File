my %ENVFILE;
sub get-fileenv(-->Hash) {
    my %env = %*ENV;
    for %*ENV.kv -> $key, $value {
        if $key ~~ m/^ (<alnum>+) '_FILE' $/ {
            try my $val = slurp($value.IO);
            %env{$0} = $val if $val;
        }
    }
    return %env;
}

sub EXPORT {
    Map.new:
            '%ENVFILE' => get-fileenv()
}


=begin pod

=head1 NAME

Env::File - allow for "$PASSWORD_FILE" to fill in the value of "$PASSWORD" from a file, especially for Docker's secrets feature

=head1 SYNOPSIS

=begin code :lang<raku>

use Env::File;
my $password =  %ENVFILE<PASSWORD> ||
        die("Missing PASSWORD or PASSWORD_FILE in environment");

=end code

=head1 DESCRIPTION

Env::File export the "%ENVFILE" variable that contains:

=item a copy of all "%*ENV" key value pairs
=item for each environment variables of type "$XYZ_FILE", an XYZ key which contains the content of this file

=head1 AUTHOR

sthiriet <thisamu@hotmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2022 sthiriet

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
