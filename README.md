The PyGObject Tutorial
======================

An introduction to deveolping GTK+ 3 applications in Python with [PyGObject](http://live.gnome.org/PyGObject).

The tutorial's web site is https://python-gtk-3-tutorial.readthedocs.io


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
sphinx-intl update -p ./translations/templates/ -l it
make -e SPHINXOPTS="-D language='it'" html
```

For more info:
http://www.sphinx-doc.org/en/latest/intl.html
