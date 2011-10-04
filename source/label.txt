Label
=====

Labels are the main method of placing non-editable text in windows, for instance
to place a title next to a :class:`Gtk.Entry` widget. You can specify the text
in the constructor, or later with the :meth:`Gtk.Label.set_text` or
:meth:`Gtk.Label.set_markup` methods.

The width of the label will be adjusted automatically. You can produce
multi-line labels by putting line breaks ("\\n") in the label string.

Labels can be made selectable with :meth:`Gtk.Label.set_selectable`.
Selectable labels allow the user to copy the label contents to the
clipboard. Only labels that contain useful-to-copy information —
such as error messages — should be made selectable.

The label text can be justified using the :meth:`Gtk.Label.set_justify` method.
The widget is also capable of word-wrapping, which can be activated with
:meth:`Gtk.Label.set_line_wrap`.

:class:`Gtk.Label` support some simple formatting, for instance allowing you to
make some text bold, colored, or larger. You can do this by providing a string
to :meth:`Gtk.Label.set_markup`, using the
Pango Markup syntax [#pango]_.
For instance, ``<b>bold text</b> and <s>strikethrough text</s>``.
In addition, :class:`Gtk.Label` supports clickable hyperlinks.
The markup for links is borrowed from HTML, using the a with href and title
attributes. GTK+ renders links similar to the way they appear in web browsers,
with colored, underlined text. The title attribute is displayed as a tooltip
on the link.

.. code-block:: python

    label.set_markup("Go to <a href=\"http://www.gtk.org\" title=\"Our website\">GTK+ website</a> for more")

Labels may contain *mnemonics*. Mnemonics are underlined characters in the
label, used for keyboard navigation. Mnemonics are created by providing a
string with an underscore before the mnemonic character, such as "_File",
to the functions :meth:`Gtk.Label.new_with_mnemonic` or
:meth:`Gtk.Label.set_text_with_mnemonic`.
Mnemonics automatically activate any activatable widget the label is inside,
such as a :class:`Gtk.Button`; if the label is not inside the mnemonic's target
widget, you have to tell the label about the target using
:meth:`Gtk.Label.set_mnemonic_widget`.

Label Objects
-------------

.. class:: Gtk.Label([text])

    Creates a new label with the given *text* inside it.
    If *text* is omitted, an empty label is created.

    .. staticmethod:: new_with_mnemonic(text)

    Creates a new label with *text* inside it.
    
    If characters in *text* are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use '__' (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic. The mnemonic key can be used to activate
    another widget, chosen automatically, or explicitly using
    :meth:`Gtk.Label.set_mnemonic_widget`.

    If :meth:`Gtk.Label.set_mnemonic_widget` is not called, then the first
    activatable ancestor of the :class:`Gtk.Label` will be chosen as the
    mnemonic widget. For instance, if the label is inside a button or menu
    item, the button or menu item will automatically become the mnemonic
    widget and be activated by the mnemonic. 

    .. method:: set_justify(justification)

    Sets the alignment of the lines in the text of the label relative to each other.
    *justification* can be one of :attr:`Gtk.Justification.LEFT`,
    :attr:`Gtk.Justification.RIGHT`, :attr:`Gtk.Justification.CENTER`,
    :attr:`Gtk.Justification.FILL`.
    This method has no effect on labels containing only a single line.

    .. method:: set_line_wrap(wrap)

    If *wrap* is ``True``, lines will be broken if text exceeds the widget's size.
    If *wrap* is ``False``, text will be cut off by the edge of the widget if it
    exceeds the widget size.

    .. method:: set_markup(markup)

    Parses *markup* which is marked up with the Pango text markup language [#pango]_,
    setting the label's text accordingly.
    The markup passed must be valid; for example literal <, >, & characters must
    be escaped as &lt; &gt; and &amp.

    .. method:: set_mnemonic_widget(widget)

    If the label has been set so that it has an mnemonic key, the label can be
    associated with a widget that is the target of the mnemonic.

    .. method:: set_selectable(selectable)

    Selectable labels allow the user to select text from the label, for copy-and-paste.

    .. method:: set_text(text)

    Sets the text within this widget. It overwrites any text that was there before.

    .. method:: set_text_with_mnemonic(text)

    See :meth:`new_with_mnemonic`.

Example
-------

.. image:: ../images/label_example.png

.. literalinclude:: ../examples/label_example.py
    :linenos:

.. [#pango] Pango Markup Syntax, http://developer.gnome.org/pango/stable/PangoMarkupFormat.html
