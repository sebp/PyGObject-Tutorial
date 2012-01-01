Clipboard
=========

:class:`Gtk.Clipboard` provides a storage area for a variety of data, including
text and images. Using a clipboard allows this data to be shared between
applications through actions such as copying, cutting, and pasting.
These actions are usually done in three ways: using keyboard shortcuts,
using a :class:`Gtk.MenuItem`, and connecting the functions to
:class:`Gtk.Button` widgets.

There are multiple clipboard selections for different purposes.
In most circumstances, the selection named ``CLIPBOARD`` is used for everyday
copying and pasting. ``PRIMARY`` is another common selection which stores text
selected by the user with the cursor.

Clipboard Objects
-----------------
.. class:: Gtk.Clipboard

    .. method:: get(selection)

        Obtains the :class:`Gtk.Clipboard` for the given selection.

        *selection* is a :class:`Gdk.Atom` describing which clipboard to use.
        Predefined values include:

        * ``Gdk.SELECTION_CLIPBOARD``
        * ``Gdk.SELECTION_PRIMARY``

    .. method:: set_text(text, length)

        Sets the contents of the clipboard to the given text.

        *text* is the string to put in the clipboard.

        *length* is the number of characters to store.
        It may be omitted to store the entire string.

    .. method:: set_image(image)

        Sets the contents of the clipboard to the given image.

        *image* must be a :class:`Gdk.Pixbuf`.
        To retrieve one from a :class:`Gdk.Image`, use ``image.get_pixbuf()``.

    .. method:: wait_for_text()

        Returns the clipboard's content as a string, or returns ``None``
        if the clipboard is empty or not currently holding text.

    .. method:: wait_for_image()

        Returns the clipboard's content as a :class:`Gtk.Pixbuf`,
        or returns ``None`` if the clipboard is empty or not currently holding
        an image.

    .. method:: store()

        Stores the clipboard's data outside the application.
        Otherwise, data copied to the clipboard may be lost when the application exits.

    .. method:: clear()

        Clears the contents of the clipboard.
        Use with caution; this may clear data from another application.

Example
-------

.. image:: ../images/clipboard_example.png

.. literalinclude:: ../examples/clipboard_example.py
    :linenos:
