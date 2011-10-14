.. _cellrenderers:

CellRenderers
=============

:class:`Gtk.CellRenderer` widgets are used to display information within widgets such as the
:class:`Gtk.TreeView` or :class:`Gtk.ComboBox`. They work closely with the
associated widgets and are very powerful, with lots of configuration options for
displaying a large amount of data in different ways. There are seven
:class:`Gtk.CellRenderer` widgets which can be used for different purposes:

    * :class:`Gtk.CellRendererText`
    * :class:`Gtk.CellRendererToggle`
    * :class:`Gtk.CellRendererPixbuf`
    * :class:`Gtk.CellRendererCombo`
    * :class:`Gtk.CellRendererProgress`
    * :class:`Gtk.CellRendererSpinner`
    * :class:`Gtk.CellRendererSpin`
    * :class:`Gtk.CellRendererAccel`

CellRendererText
----------------

A :class:`Gtk.CellRendererText` renders a given text in its cell, using the font,
color and style information provided by its properties. The text will be
ellipsized if it is too long and the "ellipsize" property allows it.

By default, text in :class:`Gtk.CellRendererText` widgets is not editable. This
can be changed by setting the value of the "editable" property to ``True``:

.. code-block:: python

    cell.set_property("editable", True)

You can then connect to the "edited" signal and update your :class:`Gtk.TreeModel`
accordingly.

CellRendererText Objects
^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererText()

    Creates a new :class:`Gtk.CellRendererText` instance. Adjust how text is
    drawn using object properties.
    Also, with :class:`Gtk.TreeViewColumn`, you can bind a property to a value
    in a :class:`GtkTreeModel`. For example, you can bind the "text" property on
    the cell renderer to a string value in the model, thus rendering a different
    string in each row of the :class:`Gtk.TreeView`.

Example
^^^^^^^

.. image:: ../images/cellrenderertext_example.png

.. literalinclude:: ../examples/cellrenderertext_example.py
    :linenos:

CellRendererToggle
------------------

:class:`Gtk.CellRendererToggle` renders a toggle button in a cell. The button is
drawn as a radio- or checkbutton, depending on the "radio" property. When
activated, it emits the "toggled" signal.

As a :class:`Gtk.CellRendererToggle` can have two states, active and not active,
you most likely want to bind the "active" property on the cell renderer
to a boolean value in the model, thus causing the check button to reflect the
state of the model.

CellRendererToggle Objects
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererToggle

    Creates a new :class:`Gtk.CellRendererToggle` instance.

    .. method:: set_active(setting)

        Activates or deactivates a cell renderer.

    .. method:: get_active()

        Returns whether the cell renderer is active.

    .. method:: set_radio(radio)

        If *radio* is ``True``, the cell renderer renders a radio toggle (i.e. a
        toggle in a group of mutually-exclusive toggles). If ``False``, it renders
        a check toggle (a standalone boolean option).

    .. method:: get_radio()

        Returns whether we're rendering radio toggles rather than checkboxes.

Example
^^^^^^^

.. image:: ../images/cellrenderertoggle_example.png

.. literalinclude:: ../examples/cellrenderertoggle_example.py
    :linenos:

CellRendererPixbuf
------------------

A :class:`Gtk.CellRendererPixbuf` can be used to render an image in a cell. It
allows to render either a given :class:`Gdk.Pixbuf` (set via the "pixbuf"
property) or a :ref:`stock item <stock-items>` (set via the "stock-id" property).

CellRendererPixbuf Objects
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererPixbuf

    Creates a new :class:`Gtk.CellRendererPixbuf`. Adjust rendering parameters
    using object properties. For example, you can bind the "pixbuf" or "stock-id"
    property on the cell renderer to a pixbuf value in the model, thus rendering
    a different image in each row of the :class:`Gtk.TreeView`.

Example
^^^^^^^

.. image:: ../images/cellrendererpixbuf_example.png

.. literalinclude:: ../examples/cellrendererpixbuf_example.py
    :linenos:

CellRendererCombo
-----------------

:class:`Gtk.CellRendererCombo` renders text in a cell like
:class:`Gtk.CellRendererText` from which it is derived. But while the latter
offers a simple entry to edit the text, :class:`Gtk.CellRendererCombo` offers a
:class:`Gtk.ComboBox` widget to edit the text. The values to display in the combo
box are taken from the :class:`Gtk.TreeModel` specified in the "model" property.

The combo cell renderer takes care of adding a text cell renderer to the combo
box and sets it to display the column specified by its "text-column" property.

A :class:`Gtk.CellRendererCombo` can operate in two modes. It can be used with
and without an associated :class:`Gtk.Entry` widget, depending on the value of
the "has-entry" property.

CellRendererCombo Objects
^^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererCombo

    Creates a new :class:`Gtk.CellRendererCombo`. Adjust how text is drawn using
    object properties. For example, you can bind the "text" property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the :class:`Gtk.TreeView`.

Example
^^^^^^^

.. image:: ../images/cellrenderercombo_example.png

.. literalinclude:: ../examples/cellrenderercombo_example.py
    :linenos:

CellRendererProgress
--------------------

:class:`Gtk.CellRendererProgress` renders a numeric value as a progress bar in a
cell. Additionally, it can display a text on top of the progress bar.

The percentage value of the progress bar can be modified by changing the "value"
property. Similar to :class:`Gtk.ProgressBar`, you can enable the *activity mode*
by incrementing the "pulse" property instead of the "value" property.

CellRendererProgress Objects
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererProgress

    Creates a new :class:`Gtk.CellRendererProgress`.

Example
^^^^^^^

.. image:: ../images/cellrendererprogress_example.png

.. literalinclude:: ../examples/cellrendererprogress_example.py
    :linenos:

CellRendererSpin
----------------

:class:`Gtk.CellRendererSpin` renders text in a cell like
:class:`Gtk.CellRendererText` from which it is derived. But while the latter
offers a simple entry to edit the text, :class:`Gtk.CellRendererSpin` offers a
:class:`Gtk.SpinButton` widget. Of course, that means that the text has to be
parseable as a floating point number.

The range of the spinbutton is taken from the adjustment property of the cell
renderer, which can be set explicitly or mapped to a column in the tree model,
like all properties of cell renders. :class:`Gtk.CellRendererSpin` also has
properties for the climb rate and the number of digits to display.

CellRendererSpin Objects
^^^^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CellRendererSpin

    Creates a new :class:`Gtk.CellRendererSpin`.

Example
^^^^^^^

.. image:: ../images/cellrendererspin_example.png

.. literalinclude:: ../examples/cellrendererspin_example.py
    :linenos:
