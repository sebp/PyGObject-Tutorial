# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = PythonGTK3Tutorial
SOURCEDIR     = ../source
BUILDDIR      = ../build
MERGEDDIR     = po
LOCALEDIR     = locale

PO_LINGUAS=$(shell grep -v "^\#" ./LINGUAS)
SOURCE_FILES=$(basename $(notdir $(wildcard $(SOURCEDIR)/*.txt)))

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
gettext:
	@$(SPHINXBUILD) -M "gettext" "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

$(SPHINXPROJ).pot: gettext
	xgettext -o $(SPHINXPROJ).pot $(wildcard $(BUILDDIR)/gettext/*.pot)

check-po:
	for lang in $(PO_LINGUAS); do \
		grep -q 'msgstr "|version|"' "$(MERGEDDIR)/$$lang.po"; \
		if [ $$? -ne 0 ]; then \
			echo "ERROR: Translation in $(MERGEDDIR)/$$lang.po has no |version|." >&2; \
			exit 1; \
		fi; \
		grep -q 'msgstr "|today|"' "$(MERGEDDIR)/$$lang.po"; \
		if [ $$? -ne 0 ]; then \
			echo "ERROR: Translation in $(MERGEDDIR)/$$lang.po has no |today|." >&2; \
			exit 1; \
		fi; \
	done

split-po: check-po
	for lang in $(PO_LINGUAS); do \
		echo "$$lang:"; \
		mkdir -p "$(LOCALEDIR)/$$lang/LC_MESSAGES"; \
		for src in $(SOURCE_FILES); do \
			msggrep -N "../$(SOURCEDIR)/$$src.txt" "$(MERGEDDIR)/$$lang.po" > "$(LOCALEDIR)/$$lang/LC_MESSAGES/$$src.po"; \
		done; \
	done

.PHONY: check-po gettext split-po
