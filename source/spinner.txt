Spinner
=======

The :class:`Gtk.Spinner` displays an icon-size spinning animation.
It is often used as an alternative to a :class:`GtkProgressBar`
for displaying indefinite activity, instead of actual progress.

To start the animation, use :meth:`Gtk.Spinner.start`,
to stop it use :meth:`Gtk.Spinner.stop`.

Spinner Objects
----------------

.. class:: Gtk.Spinner()

    .. method:: start()

        Starts the animation of the spinner.

    .. method:: stop()

        Stops the animation of the spinner.

Example
-------

.. image:: ../images/spinner_example.png

.. literalinclude:: ../examples/spinner_example.py
    :linenos:
