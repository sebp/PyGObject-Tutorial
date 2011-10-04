ProgressBar
===========

The :class:`Gtk.ProgressBar` is typically used to display the progress of a
long running operation. It provides a visual clue that processing is underway.
The :class:`Gtk.ProgressBar` can be used in two different modes: *percentage
mode* and *activity mode*.

When an application can determine how much work needs to take place (e.g. read
a fixed number of bytes from a file) and can monitor its progress, it can use
the :class:`Gtk.ProgressBar` in *percentage mode* and the user sees a growing
bar indicating the percentage of the work that has been completed.
In this mode, the application is required to call :meth:`Gtk.ProgressBar.set_fraction`
periodically to update the progress bar, passing a float between 0 and 1 to provide
the new percentage value.

When an application has no accurate way of knowing the amount of work to do, it
can use *activity mode*, which shows activity by a block moving back and forth
within the progress area. In this mode, the application is required to call
:meth:`Gtk.ProgressBar.pulse` periodically to update the progress bar.
You can also choose the step size, with the :meth:`Gtk.ProgressBar.set_pulse_step`
method. 

By default, :class:`Gtk.ProgressBar` is horizontal and left-to-right, but you
can change it to a vertical progress bar by using the
:meth:`Gtk.ProgressBar.set_orientation` method. Changing the direction the
progress bar grows can be done using :meth:`Gtk.ProgressBar.set_inverted`.
:class:`Gtk.ProgressBar` can also contain text which can be set by calling
:meth:`Gtk.ProgressBar.set_text` and :meth:`Gtk.ProgressBar.set_show_text`.

ProgressBar Objects
-------------------

.. class:: Gtk.ProgressBar()

    .. method:: set_fraction(fraction)

        Causes the progress bar to "fill in" the given fraction of the bar.
        *fraction* should be between 0.0 and 1.0, inclusive.

    .. method:: set_pulse_step(fraction)

        Sets the fraction of total progress bar length to move the bouncing
        block for each call to :meth:`pulse`.

    .. method:: pulse()

        Indicates that some progress is made, but you don't know how much.
        Causes the progress bar to enter *activity mode*, where a block
        bounces back and forth. Each call to :meth:`pulse` causes the block
        to move by a little bit (the amount of movement per pulse is determined
        by :meth:`set_pulse_step`). 

    .. method:: set_orientation(orientation)

        Sets the orientation. *orientation* can be one of

        * :attr:`Gtk.Orientation.HORIZONTAL`
        * :attr:`Gtk.Orientation.VERTICAL`

    .. method:: set_show_text(show_text)

        Sets whether the progressbar will show text superimposed over the bar.
        The shown text is either the value of the "text" property or, if that
        is ``None``, the "fraction" value, as a percentage.

    .. method:: set_text(text)

        Causes the given *text* to appear superimposed on the progress bar.

    .. method:: set_inverted(inverted)

        Progress bars normally grow from top to bottom or left to right.
        Inverted progress bars grow in the opposite direction.

Example
-------

.. image:: ../images/progressbar_example.png

.. literalinclude:: ../examples/progressbar_example.py
    :linenos:
