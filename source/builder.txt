Glade and Gtk.Builder
=====================
The :class:`Gtk.Builder` class offers you the opportunity to design user interfaces without writing a single line of code.
This is possible through describing the interface by a XML file and then loading the XML description at runtime and create the objects automatically, which the Builder class does for you.
For the purpose of not needing to write the XML manually the `Glade <http://glade.gnome.org/>`_ application  lets you create the user interface in a WYSIWYG (what you see is what you get) manner

This method has several advantages:

* Less code needs to be written.
* UI changes can be seen more quickly, so UIs are able to improve.
* Designers without programming skills can create and edit UIs.
* The description of the user interface is independent from the programming language being used.

There is still code required for handling interface changes triggered by the user, but :class:`Gtk.Builder` allows you to focus on implementing that functionality.

Creating and loading the .glade file
------------------------------------
First of all you have to download and install Glade. There are `several tutorials <https://live.gnome.org/Glade/Tutorials>`_ about Glade, so this is not explained here in detail.
Let's start by creating a window with a button in it and saving it to a file named *example.glade*.
The resulting XML file should look like this.

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <interface>
      <!-- interface-requires gtk+ 3.0 -->
      <object class="GtkWindow" id="window1">
        <property name="can_focus">False</property>
        <child>
          <object class="GtkButton" id="button1">
            <property name="label" translatable="yes">button</property>
            <property name="use_action_appearance">False</property>
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="receives_default">True</property>
            <property name="use_action_appearance">False</property>
          </object>
        </child>
      </object>
    </interface>

To load this file in Python we need a :class:`Gtk.Builder` object.

.. code-block:: python

    builder = Gtk.Builder()
    builder.add_from_file("example.glade")

The second line loads all objects defined in *example.glade* into the Builder object.

It is also possible to load only some of the objects. The following line would add only the objects (and their child objects) given in the tuple.

.. code-block:: python

    # we don't really have two buttons here, this is just an example
    builder.add_objects_from_file("example.glade", ("button1", "button2"))

These two methods exist also for loading from a string rather than a file.
Their corresponding names are :meth:`Gtk.Builder.add_from_string` and :meth:`Gtk.Builder.add_objects_from_string` and they simply take a XML string instead of a file name.

Accessing widgets
-----------------
Now that the window and the button are loaded we also want to show them.
Therefore the :meth:`Gtk.Window.show_all` method has to be called on the window.
But how do we access the associated object?

.. code-block:: python

    window = builder.get_object("window1")
    window.show_all()

Every widget can be retrieved from the builder by the :meth:`Gtk.Builder.get_object` method and the widget's *id*.
It is really *that* simple.

It is also possible to get a list of all objects with

.. code-block:: python

    builder.get_objects()

Connecting Signals
------------------
Glade also makes it possible to define signals which you can connect to handlers in your code without extracting every object from the builder and connecting to the signals manually.
The first thing to do is to declare the signal names in Glade.
For this example we will act when the window should be closed and when the button was pressed, so we give the name "onDeleteWindow" to the "delete-event" signal of the window and "onButtonPressed" to the "pressed" signal of the button.
Now the XML file should look like this.

.. literalinclude:: ../examples/builder_example.glade
	:language: xml

Now we have to define the handler functions in our code.
The *onDeleteWindow* should simply result in a call to :meth:`Gtk.main_quit`.
When the button is pressed we would like to print the string "Hello World!", so we define the handler as follows

.. code-block:: python

    def hello(button):
        print "Hello World!"

Next, we have to connect the signals and the handler functions.
The easiest way to do this is to define a *dict* with a mapping from the names to the handlers and then pass it to the :meth:`Gtk.Builder.connect_signals` method.

.. code-block:: python

    handlers = {
        "onDeleteWindow": Gtk.main_quit,
        "onButtonPressed": hello
    }
    builder.connect_signals(handlers)

An alternative approach is to create a class which has methods that are called like the signals.
In our example the last code snippet could be rewritten as:

.. literalinclude:: ../examples/builder_example.py
    :linenos:
    :lines: 3-12

Builder Objects
---------------
.. class:: Gtk.Builder

    .. method:: add_from_file(filename)

        Loads and parses the given file and merges it with the current contents of builder.

    .. method:: add_from_string(string)

        Parses the given string and merges it with the current contents of builder..

    .. method:: add_objects_from_file(filename, object_ids)

        Same as :meth:`Gtk.Builder.add_from_file`, but loads only the objects with the ids given in the *object_ids* list.

    .. method:: add_objects_from_string(filename, object_ids)

        Same as :meth:`Gtk.Builder.add_from_string`, but loads only the objects with the ids given in the *object_ids* list.

    .. method:: get_object(object_id)

        Retrieves the widget with the id *object_id* from the loaded objects in the builder.

    .. method:: get_objects()

        Returns all loaded objects.

    .. method:: connect_signals(handler_object)

        Connects the signals to the methods given in the *handler_object*.
        The *handler_object* can be any object which contains keys or attributes that are called like the signal handler names given in the interface description, e.g. a class or a dict.

Example
-------
The final code of the example

.. literalinclude:: ../examples/builder_example.py
    :linenos:
