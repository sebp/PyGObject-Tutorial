.. _install:

Installation
============
The fist step before we start with actual coding consists of setting up
`PyGObject`_ and its dependencies. PyGObject is a Python module
that enables developers to access GObject-based libraries such as GTK+
within Python.
It exclusively supports GTK+ version 3 or later. If you want to use
GTK+ 2 in your application, use `PyGTK`_, instead.

Dependencies
------------

* GTK+3

* Python 2 (2.6 or later) or Python 3 (3.1 or later)

* gobject-introspection

Prebuilt Packages
-----------------
Recent versions of PyGObject and its dependencies are packaged by nearly all major Linux
distributions.
So, if you use Linux, you can probably get started by installing the package from the
official repository for your distribution.

Installing From Source
----------------------
The easiest way to install PyGObject from source is using `JHBuild`_. It is
designed to easily build source packages and discover what dependencies need to be
build and in what order. To setup JHBuild, please follow the `JHBuild manual`_.

Once you have installed JHBuild successfully, download the latest configuration from
[#]_. Copy files with the suffix `.modules` to JHBuild's module directory and the file
`sample-tarball.jhbuildrc` to `~/.jhbuildrc`.

If you have not done it before, verify that your build environment is setup correctly
by running::

    $ jhbuild sanitycheck

It will print any applications and libraries that are currently missing on your
system but required for building. You should install those using your distribution's
package repository. A list of `package names <http://live.gnome.org/JhbuildDependencies>`_
for different distributions is maintained on the GNOME wiki.
Run the command above again to ensure the required tools are present.

Executing the following command will build PyGObject and all its dependencies::

    $ jhbuild build pygobject

Finally, you might want to install GTK+ from source as well::

    $ jhbuild build gtk+

To start a shell with the same environment as used by JHBuild, run::

    $ jhbuild shell

.. _PyGObject: https://live.gnome.org/PyGObject
.. _PyGTK: http://www.pygtk.org
.. _JHBuild: https://live.gnome.org/Jhbuild
.. _JHBuild manual: http://library.gnome.org/devel/jhbuild/unstable/

.. [#] http://download.gnome.org/teams/releng/
