.. _basics:

Basics
======
This section will introduce some of the most important aspects of GTK+.



.. _signals:

Main loop and Signals
---------------------
Like most GUI toolkits, GTK+ uses an event-driven programming model.
When the user is doing nothing, GTK+ sits in the main loop and waits for input.
If the user performs some action - say, a mouse click - then the main loop
"wakes up" and delivers an event to GTK+.

When widgets receive an event, they frequently emit one or more signals.
Signals notify your program that "something interesting happened" by invoking
functions you've connected to the signal. Such functions are commonly known
as *callbacks*. 
When your callbacks are invoked, you would typically take some action - for
example, when an Open button is clicked you might display a file chooser
dialog. After a callback finishes, GTK+ will return to the main loop and await
more user input. 


A generic example is:

.. code-block:: python

    handler_id = widget.connect("event", callback, data)

Firstly, *widget* is an instance of a widget we created earlier. Next, the
event we are interested in. Each widget has its own particular events which
can occur.
For instance, if you have a button you usually want to connect to the "clicked"
event.
This means that when the button is clicked, the signal is issued.
Thirdly, the *callback* argument is the name of the callback function.
It contains the code which runs when signals of the specified type are issued.
Finally, the *data* argument includes any data which should be passed when the
signal is issued. However, this argument is completely optional and can be left
out if not required.

The function returns a number that identifies this particular signal-callback
pair.
It is required to disconnect from a signal such that the callback function will
not be called during any future or currently ongoing emissions of the signal it
has been connected to.

.. code-block:: python

    widget.disconnect(handler_id)

Almost all applications will connect to the "delete-event" signal of the
top-level window. It is emitted if a user requests that a toplevel window is
closed. The default handler for this signal destroys the window, but does
not terminate the application. Connecting the "delete-event" signal
to the function :func:`Gtk.main_quit` will result in the desired behaviour.

.. code-block:: python

    window.connect("delete-event", Gtk.main_quit)

Calling :func:`Gtk.main_quit` makes the main loop inside of :func:`Gtk.main` return.

Properties
----------
Properties describe the configuration and state of widgets. As for signals, each
widget has its own particular set of properties. For example, a button has the
property "label" which contains the text of the label widget inside the button.
You can specify the name and value of any number of properties as keyword
arguments when creating an instance of a widget. To create a label aligned to
the right with the text "Hello World" and an angle of 25 degrees, use:

.. code-block:: python

    label = Gtk.Label(label="Hello World", angle=25, halign=Gtk.Align.END)

which is equivalent to

.. code-block:: python

    label = Gtk.Label()
    label.set_label("Hello World")
    label.set_angle(25)
    label.set_halign(Gtk.Align.END)

Instead of using getters and setters you can also get and set the properties
with ``widget.get_property("prop-name")`` and ``widget.set_property("prop-name",
value)``, respectively.
