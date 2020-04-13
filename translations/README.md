Translations
============

- sphinx expects one PO file per document, but [Damned Lies](https://l10n.gnome.org/)
expects a single file.
- The file `PythonGTK3Tutorial.pot` contains all messages from all documents.
- Translations are listed in `LINGUAS` and the corresponding translations
  reside in the `po` directory (one PO file per language).
- Executing `make split-po` will take the single-file PO and split it into individual
  documents for sphinx to process.
