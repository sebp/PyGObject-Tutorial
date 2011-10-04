ComboBox
========
A :class:`Gtk.ComboBox` allows for the selection of an item from a dropdown menu.
They are preferable to having many radio buttons on screen as they take up less
room. If appropriate, it can show extra information about each item, such as text,
a picture, a checkbox, or a progress bar.

:class:`Gtk.ComboBox` is very similar to :class:`Gtk.TreeView`, as both use the
model-view pattern; the list of valid choices is specified in the form of a tree
model, and the display of the choices can be adapted to the data in the model by
using :ref:`cell renderers <cellrenderers>`.
If the combo box contains a large number of items, it may be better to display
them in a grid rather than a list. This can be done by calling
:meth:`Gtk.ComboBox.set_wrap_width`.

The :class:`Gtk.ComboBox` widget usually
restricts the user to the available choices, but it can optionally have an
:class:`Gtk.Entry`, allowing the user to enter arbitrary text if none of the
available choices are suitable. To do this, use one of the static methods
:meth:`Gtk.ComboBox.new_with_entry` or :meth:`Gtk.ComboBox.new_with_model_and_entry`
to create an :class:`Gtk.ComboBox` instance.

For a simple list of textual choices, the model-view API of :class:`Gtk.ComboBox`
can be a bit overwhelming. In this case, :class:`Gtk.ComboBoxText` offers a simple
alternative. Both :class:`Gtk.ComboBox` and :class:`Gtk.ComboBoxText` can contain
an entry.

ComboBox objects
----------------

.. class:: Gtk.ComboBox

    .. staticmethod:: new_with_entry()

        Creates a new empty :class:`Gtk.ComboBox` with an entry.

    .. staticmethod:: new_with_model(model)

        Creates a new :class:`Gtk.ComboBox` with the model initialized to *model*.

    .. staticmethod:: new_with_model_and_entry(model)

        Creates a new :class:`Gtk.ComboBox` with an entry and the model
        initialized to *model*.

    .. method:: get_active_iter()

        Returns a :class:`Gtk.TreeIter` pointing to the current active item.
        If no active item exists, ``None`` is returned.

    .. method:: set_model(model)

        Sets the model used by this combo box to be *model*. Will unset a
        previously set model (if applicable). If model is ``None``, then it will
        unset the model. Note that this function does not clear the cell renderers.

    .. method:: get_model()

        Returns the :class:`Gtk.TreeModel` which is acting as data source for
        this combo box.

    .. method:: set_entry_text_column(text_column)

        Sets the model column which this combo box should use to get strings from
        to be *text_column*. The column *text_column* in the model of this combo
        box must be of type ``str``.

        This is only relevant if this combo box has been created with the
        "has-entry" property set to ``True``. 

    .. method:: set_wrap_width(width)

        Sets the wrap width of this combo box to be *width*. The wrap width is
        basically the preferred number of columns when you want the popup to be
        layed out in a grid.

ComboBoxText objects
--------------------

.. class:: Gtk.ComboBoxText

    .. staticmethod:: new_with_entry()

        Creates a new empty :class:`Gtk.ComboBoxText` with an entry.

    .. method:: append_text(text)

        Appends *text* to the list of strings stored in this combo box.

    .. method:: get_active_text()

        Returns the currently active string in this combo box, or ``None`` if
        none is selected. If this combo box contains an entry, this function will
        return its contents (which will not necessarily be an item from the list).

Example
-------

.. image:: ../images/combobox_example.png

.. literalinclude:: ../examples/combobox_example.py
    :linenos:
