The PyGObject Tutorial
======================

An introduction to GTK+ 3 and Python.

http://live.gnome.org/PyGObject

Dependencies
------------
- Sphinx: http://sphinx.pocoo.org
- sphinx_rtd_theme


Build
-----
Run:

```
make html
```

Build in different languages
----------------------------
Install sphinx-intl and run:

```
make gettext
sphinx-intl update -p build/gettext/ -l it
make -e SPHINXOPTS="-D language='it'" html
```

For more info:
http://www.sphinx-doc.org/en/latest/intl.html
