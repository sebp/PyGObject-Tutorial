# Translations

## How to contribute

Translations to PyGObject-Tutorial happen in [Damned Lies](https://l10n.gnome.org/). See [GNOME Translation Project wiki](https://wiki.gnome.org/TranslationProject) for more info.

Please make sure to test and review the translation before considering it as finished.

Once you're done translating, file a [pull request](https://github.com/sebp/PyGObject-Tutorial/pulls) containing your translation in `translations/po/<lang>.po`, where `<lang>` is your language's code (e.g. pt_BR).

Refer to GitHub docs for more information on [proposing changes via pull requests](https://help.github.com/pt/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests).

## Testing translations

A good way to assure the quality of the translations is to build the docs with the up-to-date message catalog (.po file). If you are willing to down that way, follow the steps below.

**Note:** All instructions below assume the current working directory is the project's root directory.

1. Install `tox` (hint: add `--user` flag for a per-user installation, without requiring admin privileges):
```
pip install tox
```

2. Copy your .po file to `translations/po/` (replace `<lang>` accordingly):
```
cp path/to/your/translated/file.po translations/po/<lang>.po
```

3. If you are adding new translation for a language, add your language code to the `translations/LINGUAS` file in alphabetical order (see [supported language codes](https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-language)); otherwise, skip this step.

4. Build HTML docs in your language by running:
```
tox
```

5. Check `build/html/` for the translated docs in HTML format.

## Building translation template

This is **not** necessary for translating PyGObject-Tutorial, as [Damned Lies](https://l10n.gnome.org/) automatically updates the translation template (.pot file) and the message catalogs (.po files). Therefore, it should be all up-to-date already.

1. To build the .pot file, run:
```
make -C translations PythonGTK3Tutorial.pot
```

2. If the execution is done successfully, then `translations/PythonGTK3Tutorial.pot` should be available.

## Why splitting PO files

[Sphinx](https://www.sphinx-doc.org) expects one message catalog (.po) file per document, but [Damned Lies](https://l10n.gnome.org/) expects a single file. So the conciliate both needs, the following method was implemented:

1. The `xgettext` tool is set to extract strings from source docs into a single translation template (.pot) file to be used by Damned Lies.

2. When including an updated translation for a given language, the message catalog in `po/` is split into separated files stored in `locale/<lang>/LC_MESSAGES/`. Those separated files will be used by Sphinx to build translated docs.
