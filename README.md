# lando-zsh
A simple zsh plugin for lando commands.

> Note: Not fully tested. I use this personally and decided to share.

#### PURPOSE:
To enable the use of common commands in web development without having to prepend `lando ` to them. E.G. `lando php artisan` can not just become

A simple collection of alias functions to enable the use of the CLIs within Lando without having to type `lando` to access them.

The functions *should* enable the ability to not have to type `lando` before a command by prepending 'lando' for all commands executed in the same directory as a .lando.yml config file.

#### WARNING: 
This could conflict with any aliases previously installed. If you have any of the CLIs installed globally (outside of lando). The `if` statements *should* account for this by calling the non-lando command for you, but not all have been tested fully.
