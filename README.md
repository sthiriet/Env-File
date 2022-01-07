[![Actions Status](https://github.com/sthiriet/Env-File/workflows/test/badge.svg)](https://github.com/sthiriet/Env-File/actions)

NAME
====

Env::File - allow for "$PASSWORD_FILE" to fill in the value of "$PASSWORD" from a file, especially for Docker's secrets feature

SYNOPSIS
========

```raku
use Env::File;
my $password =  %ENVFILE<PASSWORD> ||
        die("Missing PASSWORD or PASSWORD_FILE in environment");
```

DESCRIPTION
===========

Env::File export the "%ENVFILE" variable that contains:

  * a copy of all "%*ENV" key value pairs

  * for each environment variables of type "$XYZ_FILE", an XYZ key which contains the content of this file

AUTHOR
======

sthiriet <thisamu@hotmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 sthiriet

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

