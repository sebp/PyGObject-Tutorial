Entry
=====

Entry widgets allow the user to enter text. You can change the contents with the
:meth:`Gtk.Entry.set_text` method, and read the current contents with the
:meth:`Gtk.Entry.get_text` method. You can also limit the number of characters
the Entry can take by calling :meth:`Gtk.Entry.set_max_length`.

Occasionally you might want to make an Entry widget read-only. This can be done
by passing ``False`` to the :meth:`Gtk.Entry.set_editable` method.

Entry widgets can also be used to retrieve passwords from the user. It is common
practice to hide the characters typed into the entry to prevent revealing the
password to a third party. Calling :meth:`Gtk.Entry.set_visibility` with
``False`` will cause the text to be hidden.

:class:`Gtk.Entry` has the ability to display progress or activity information
behind the text. This is similar to :class:`Gtk.ProgressBar` widget and is
commonly found in web browsers to indicate how much of a page download has been
completed. To make an entry display such information, use
:meth:`Gtk.Entry.set_progress_fraction`, :meth:`Gtk.Entry.set_progress_pulse_step`,
or :meth:`Gtk.Entry.progress_pulse`.

Additionally, an Entry can show icons at either side of the entry. These icons
can be activatable by clicking, can be set up as drag source and can have tooltips.
To add an icon, use :meth:`Gtk.Entry.set_icon_from_stock`
or one of the various other functions that set an icon from an icon name, a pixbuf,
or icon theme. To set a tooltip on an icon, use
:meth:`Gtk.Entry.set_icon_tooltip_text` or the corresponding function for markup. 

Entry Objects
-------------

.. class:: Gtk.Entry()

    .. method:: get_text()

        Retrieves the contents of the entry widget.

    .. method:: set_text(text)

        Sets the text in the widget to the given value, replacing the current contents.

    .. method:: set_visibility(visible)

        Sets whether the contents of the entry are visible or not. When *visible* is set
        to ``False``, characters are displayed as the invisible char, and will also appear
        that way when the text in the entry widget is copied elsewhere.

    .. method:: set_max_length(max)

        Sets the maximum allowed length of the contents of the widget. If the current
        contents are longer than the given length, then they will be truncated to fit. 

    .. method:: set_editable(is_editable)

        Determines if the user can edit the text in the editable widget or not.
        If *is_editable* is ``True``, the user is allowed to edit the text in the widget.

    .. method:: set_progress_fraction(fraction)

        Causes the entry's progress indicator to "fill in" the given fraction of the bar.
        The fraction should be between 0.0 and 1.0, inclusive. 

    .. method:: set_progress_pulse_step(fraction)

        Sets the fraction of total entry width to move the progress bouncing block for
        each call to :meth:`progress_pulse`.

    .. method:: progress_pulse()

        Indicates that some progress is made, but you don't know how much. Causes the
        entry's progress indicator to enter "activity mode," where a block bounces
        back and forth. Each call to :meth:`progress_pulse` causes the block to move
        by a little bit (the amount of movement per pulse is determined by
        :meth:`set_progress_pulse_step`).

    .. method:: set_icon_from_stock(icon_pos, stock_id)

        Sets the icon shown in the entry at the specified position from a
        :ref:`stock item <stock-items>`.
        If *stock_id* is ``None``, no icon will be shown in the specified position. 

        *icon_pos* specifies the side of the entry at which an icon is placed and
        can be one of

        * :attr:`Gtk.EntryIconPosition.PRIMARY`:
          At the beginning of the entry (depending on the text direction).
        * :attr:`Gtk.EntryIconPosition.SECONDARY`:
          At the end of the entry (depending on the text direction). 

    .. method:: set_icon_tooltip_text(icon_pos, tooltip)

        Sets *tooltip* as the contents of the tooltip for the icon at the
        specified position. If *tooltip* is ``None``, an existing tooltip is removed.

        For allowed values for *icon_pos* see :meth:`set_icon_from_stock`.

Example
-------

.. image:: ../images/entry_example.png

.. literalinclude:: ../examples/entry_example.py
    :linenos:
