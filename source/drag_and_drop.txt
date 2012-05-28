Drag and Drop
=============
.. note::
    Versions of PyGObject < 3.0.3 contain a bug which does not allow drag
    and drop to function correctly. Therefore a version of PyGObject >= 3.0.3 is
    required for the following examples to work.

Setting up drag and drop between widgets consists of selecting a drag source
(the widget which the user starts the drag from) with the
:meth:`Gtk.Widget.drag_source_set` method, selecting a drag destination (the
widget which the user drops onto) with the :meth:`Gtk.Widget.drag_dest_set`
method and then handling the relevant signals on both widgets.

Instead of using :meth:`Gtk.Widget.drag_source_set` and
:meth:`Gtk.Widget.drag_dest_set` some specialised widgets require the use of
specific functions (such as :class:`Gtk.TreeView` and :class:`Gtk.IconView`).

A basic drag and drop only requires the source to connect to the "drag-data-get"
signal and the destination to connect to the "drag-data-received" signal. More
complex things such as specific drop areas and custom drag icons will require
you to connect to :ref:`additional signals <drag-signals>` and interact with
the :class:`Gdk.DragContext` object it supplies.

In order to transfer data between the source and destination, you must interact
with the :class:`Gtk.SelectionData` variable supplied in the
:ref:`"drag-data-get" <drag-signals>` and :ref:`"drag-data-received" <drag-signals>`
signals using the :class:`Gtk.SelectionData` get and set methods.

Target Entries
--------------
To allow the drag source and destination to know what data they are receiving and
sending, a common list of :class:`Gtk.TargetEntry's <Gtk.TargetEntry>` are required.
A :class:`Gtk.TargetEntry` describes a piece of data that will be sent by the drag
source and received by the drag destination.

There are two ways of adding :class:`Gtk.TargetEntry's <Gtk.TargetEntry>` to a
source and destination. If the drag and drop is simple and each target entry is
of a different type, you can use the group of methods :meth:`mentioned here
<Gtk.Widget.drag_source_add_text_targets>`.

If you require more than one type of data or wish to do more complex things with
the data, you will need to create the :class:`Gtk.TargetEntry's <Gtk.TargetEntry>`
using the :meth:`Gtk.TargetEntry.new` method.

Drag and Drop Methods and Objects
---------------------------------
.. class:: Gtk.Widget

    .. method:: drag_source_set(start_button_mask, targets, actions)

    Sets the widget to be a drag source.

    *start_button_mask* are a combination of :attr:`Gdk.ModifierType` masks which
    sets which buttons must be pressed for a drag to occur.
    *targets* is a list of :class:`Gtk.TargetEntry's <Gtk.TargetEntry>` which
    describe the data to be passed between source and destination.
    *actions* are a combination :attr:`Gdk.DragAction` masks to show possible
    drag actions.

    .. method:: drag_dest_set(flags, targets, actions)

    Sets the widget to be a drag destination.

    *flags* are a combination of :attr:`Gtk.DestDefaults` masks which configures
    the processes which occur on a drag site.
    *targets* is a list of :class:`Gtk.TargetEntry's <Gtk.TargetEntry>` which
    describe the data to be passed between source and destination.
    *actions* are a combination :attr:`Gdk.DragAction` masks to show possible
    drag actions.

    .. method:: drag_source_add_text_targets()
                drag_dest_add_text_targets()

    Add a :class:`Gtk.TargetEntry` to the drag source/destination which contains
    a piece of text.

    .. method:: drag_source_add_image_targets()
                drag_dest_add_image_targets()

    Add a :class:`Gtk.TargetEntry` to the drag source/destination which contains
    a :class:`GdkPixbuf.Pixbuf`.

    .. method:: drag_source_add_uri_targets()
                drag_dest_add_uri_targets()

    Add a :class:`Gtk.TargetEntry` to the drag source/destination which contains
    a list of URIs.

.. class:: Gtk.TargetEntry

    .. staticmethod:: new(target, flags, info)

    Creates a new target entry.

    *target* is a string describing the type of data the target entry describes.

    *flags* controls under which conditions will the data be transferred in a
    drag and drop and is a combination of the :attr:`Gtk.TargetFlags` values:

    * :attr:`Gtk.TargetFlags.SAME_APP` - Only transferred in the same application
    * :attr:`Gtk.TargetFlags.SAME_WIDGET` - Only transferred within the same widget
    * :attr:`Gtk.TargetFlags.OTHER_APP` - Only transferred in a different application
    * :attr:`Gtk.TargetFlags.OTHER_WIDGET` - Only transferred within a different widget

    *info* is an ID which the application can use to determine between different
    pieces of data contained in a drag and drop operation.

.. class:: Gtk.SelectionData

    .. method:: get_text()

    Returns the contents of the text contained in selection data

    .. method:: set_text(text)

    Sets the contents of the text contained in selection data to *text*

    .. method:: get_pixbuf()

    Returns the pixbuf contained in selection data

    .. method:: set_pixbuf(pixbuf)

    Sets the pixbuf contained in selection data to *pixbuf*

.. _drag-signals:

Drag Source Signals
-------------------
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| Name               | When it is emitted                                           | Common Purpose                                     |
+====================+==============================================================+====================================================+
| drag-begin         | User starts a drag                                           | Set-up drag icon                                   |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| drag-data-get      | When drag data is requested by the destination               | Transfer drag data from source to destination      |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| drag-data-delete   | When a drag with the action Gdk.DragAction.MOVE is completed | Delete data from the source to complete the 'move' |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| drag-data-end      | When the drag is complete                                    | Undo anything done in drag-begin                   |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+

Drag Destination Signals
------------------------
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| Name               | When it is emitted                                           | Common Purpose                                     |
+====================+==============================================================+====================================================+
| drag-motion        | Drag icon moves over a drop area                             | Allow only certain areas to be dropped onto        |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| drag-drop          | Icon is dropped onto a drag area                             | Allow only certain areas to be dropped onto        |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+
| drag-data-received | When drag data is received by the destination                | Transfer drag data from source to destination      |
+--------------------+--------------------------------------------------------------+----------------------------------------------------+

Example
-------

.. image:: ../images/drag_and_drop_example.png
.. literalinclude:: ../examples/drag_and_drop_example.py
    :linenos:
