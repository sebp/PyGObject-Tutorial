.. _layout:

Layout Containers
=================
While many GUI toolkits require you to precisely place widgets in a window,
using absolute positioning, GTK+ uses a different approach.
Rather than specifying the position and size of each widget in the window,
you can arrange your widgets in rows, columns, and/or tables.
The size of your window can be determined automatically, based on the sizes
of the widgets it contains.
And the sizes of the widgets are, in turn, determined by the amount of text
they contain, or the minimum and maximum sizes that you specify, and/or how
you have requested that the available space should be shared between sets of
widgets. You can perfect your layout by specifying padding distance and
centering values for each of your widgets. GTK+ then uses all this information
to resize and reposition everything sensibly and smoothly when the user
manipulates the window.

GTK+ arranges widgets hierarchically, using *containers*.
They are invisible to the end user and are inserted into a window, or placed
within each other to layout components.
There are two flavours of containers: single-child
containers, which are all descendants of :class:`Gtk.Bin`, and multiple-child
containers, which are descendants of :class:`Gtk.Container`.
The most commonly used are vertical or horizontal boxes
(:class:`Gtk.Box`), tables (:class:`Gtk.Table`) and grids (:class:`Gtk.Grid`).

Boxes
-----

Boxes are invisible containers into which we can pack our widgets.
When packing widgets into a horizontal box, the objects are inserted
horizontally from left to right or right to left depending on whether
:meth:`Gtk.Box.pack_start` or :meth:`Gtk.Box.pack_end` is used.
In a vertical box, widgets are packed from top to bottom or vice versa.
You may use any combination of boxes inside or beside other boxes to create
the desired effect.

Box Objects
^^^^^^^^^^^

.. class:: Gtk.Box([homogenous[, spacing]])

    The rectangular area of a :class:`Gtk.Box` is organized into either a
    single row or a single column of child widgets depending upon whether
    the "orientation" property is set to :attr:`Gtk.Orientation.HORIZONTAL` or
    :attr:`Gtk.Orientation.VERTICAL`.

    If *homogeneous* is ``True``, all widgets in the box will
    be the same size, of which the size is determined by the largest
    child widget. If it is omitted, *homogeneous* defaults to ``False``.

    *spacing* is the number of pixels to place by default between children.
    If omitted, no spacing is used, i.e. *spacing* is set to 0.

    By default, child widgets are organized into a single row, i.e. the
    "orientation" property is set to :attr:`Gtk.Orientation.HORIZONTAL`.

    :class:`Gtk.Box` uses a notion of *packing*. Packing refers to adding
    widgets with reference to a particular position in a :class:`Gtk.Container`.
    For a :class:`Gtk.Box`, there are two reference positions: the start
    and the end of the box.
    If "orientation" is :attr:`Gtk.Orientation.VERTICAL`, the start is defined
    as the top of the box and the end is defined as the bottom.
    If "orientation" is :attr:`Gtk.Orientation.HORIZONTAL`, the start is defined
    as the left side and the end is defined as the right side.

    .. method:: pack_start(child, expand, fill, padding)

        Adds *child* to box, packed with reference to the start of box.
        The *child* is packed after any other child packed with reference
        to the start of box.

        *child* should be a :class:`Gtk.Widget` to be added to this box.
        The *expand* argument when set to ``True`` allows the *child* widget
        to take all available space it can. Alternately, if the value is set
        to ``False``, the box will be shrunken to the same size as the child widget.

        If the *fill* argument is set to ``True``, the *child* widget takes all
        available space and is equal to the size of the box. This only has an
        effect when *expand* is set to ``True``.
        A child is always allocated the full height of a horizontally oriented
        and the full width of a vertically oriented box.
        This option affects the other dimension.

        *padding* defines extra space in pixels to put between this child and
        its neighbours, over and above the global amount specified by "spacing"
        property. If *child* is a widget at one of the reference ends of box,
        then padding pixels are also put between *child* and the reference edge
        of this box.

    .. method:: pack_end(child, expand, fill, padding)

        Adds *child* to box, packed with reference to the end of box.
        The *child* is packed after (away from end of) any other child
        packed with reference to the end of box.

        Arguments are the same as for :meth:`pack_start`.

    .. method:: set_homogeneous(homogeneous)

        If *homogeneous* is ``True``, all widgets in the box will
        be the same size, of which the size is determined by the largest
        child widget.

Example
^^^^^^^

Let's take a look at a slightly modified version of the extended example with two
buttons.

.. image:: ../images/layout_box_example.png

.. literalinclude:: ../examples/layout_box_example.py
    :linenos:

First, we create a horizontally orientated box container where 6 pixels are
placed between children. This box becomes the child of the top-level window.

.. literalinclude:: ../examples/layout_box_example.py
    :lines: 8-9

Subsequently, we add two different buttons to the box container.

.. literalinclude:: ../examples/layout_box_example.py
    :lines: 11-17

While with :meth:`Gtk.Box.pack_start` widgets are positioned from left to right,
:meth:`Gtk.Box.pack_end` positions them from right to left.

Grid
----
:class:`Gtk.Grid` is a container which arranges its child widgets in rows and
columns, but you do not need to specify the dimensions in the constructor.
Children are added using :meth:`Gtk.Grid.attach`. They can span multiple rows or
columns. It is also possible to add a child next to an existing child, using
:meth:`Gtk.Grid.attach_next_to`.

:class:`Gtk.Grid` can be used like a :class:`Gtk.Box` by just using
:meth:`Gtk.Grid.add`, which will place children next to each other in the
direction determined by the "orientation" property (defaults to
:attr:`Gtk.Orientation.HORIZONTAL`).

Grid Objects
^^^^^^^^^^^^
.. class:: Gtk.Grid

    Creates a new grid widget.

    .. method:: attach(child, left, top, width, height)

        Adds *child* to this grid.

        The position of *child* is determined by the index of the cell left to
        it (*left*) and above of it (*top*). The number of 'cells' that *child*
        will occupy is determined by *width* and *height*.

    .. method:: attach_next_to(child, sibling, side, width, height)

        Adds *child* to this grid, next to *sibling*. *side* is the side of
        *sibling* that *child* is positioned next to. It can be one of

        * :attr:`Gtk.PositionType.LEFT`
        * :attr:`Gtk.PositionType.RIGHT`
        * :attr:`Gtk.PositionType.TOP`
        * :attr:`Gtk.PositionType.BOTTOM`

        *width* and *height* determine the number of 'cells' that *child* will
        occupy.

    .. method:: add(widget)

        Adds *widget* to this grid in the direction determined by the
        "orientation" property.

Example
^^^^^^^

.. image:: ../images/layout_grid_example.png

.. literalinclude:: ../examples/layout_grid_example.py
    :linenos:

Table
-----

Tables allows us to place widgets in a grid similar to :class:`Gtk.Grid`.

The grid's dimensions need to be specified in the :class:`Gtk.Table` constructor.
To place a widget into a box, use :meth:`Gtk.Table.attach`.

:meth:`Gtk.Table.set_row_spacing` and
:meth:`Gtk.Table.set_col_spacing` set the spacing between the rows at the
specified row or column. Note that for columns, the space goes to the right
of the column, and for rows, the space goes below the row.

You can also set a consistent spacing for all rows and/or columns with
:meth:`Gtk.Table.set_row_spacings` and :meth:`Gtk.Table.set_col_spacings`.
Note that with these calls, the last row and last column do not get any spacing.

Table Objects
^^^^^^^^^^^^^

.. deprecated:: 3.4
    Use :class:`Gtk.Grid` instead.

.. class:: Gtk.Table(rows, columns, homogeneous)

    The first argument is the number of rows to make in the table, while the
    second, obviously, is the number of columns. If *homogeneous* is ``True``,
    the table cells will all be the same size (the size of the largest widget
    in the table).

    .. method:: attach(child, left_attach, right_attach, top_attach, bottom_attach, [xoptions, [yoptions, [xpadding, [ypadding]]]])

        Adds a widget to a table.

        *child* is the widget that should be added to the table.
        The number of 'cells' that a widget will occupy is specified by
        *left_attach*, *right_attach*, *top_attach* and *bottom_attach*.
        These each represent the leftmost, rightmost, uppermost and
        lowest column and row numbers of the table.
        (Columns and rows are indexed from zero).

        For example, if you want a button in the lower-right cell of a
        2 x 2 table, and want it to occupy that cell only, then the code
        looks like the following.

        .. code-block:: python

            button = Gtk.Button()
            table = Gtk.Table(2, 2, True)
            table.attach(button, 1, 2, 1, 2)

        If, on the other hand, you wanted a widget to take up the entire
        top row of our 2 x 2 table, you'd use

        .. code-block:: python

            table.attach(button, 0, 2, 0, 1)

        *xoptions* and *yoptions* are used to specify packing options and may be
        bitwise ORed together to allow multiple options. These options are:

        * :attr:`Gtk.AttachOptions.EXPAND`: The widget should expand to take up
          any extra space in its container that has been allocated.
        * :attr:`Gtk.AttachOptions.FILL`: The widget will expand to use all the
          room available.
        * :attr:`Gtk.AttachOptions.SHRINK`: Reduce size allocated to the widget
          to prevent it from moving off screen.

        If omitted, *xoptions* and *yoptions* defaults to
        ``Gtk.AttachOptions.EXPAND | Gtk.AttachOptions.FILL``.

        Finally, the padding arguments work just as they do for
        :meth:`Gtk.Box.pack_start`.
        If omitted, *xpadding* and *ypadding* defaults to ``0``.

    .. method:: set_row_spacing(row, spacing)

        Changes the space between a given table row and the subsequent row.

    .. method:: set_col_spacing(col, spacing)

        Alters the amount of space between a given table column and the
        following column.

    .. method:: set_row_spacings(spacing)

        Sets the space between every row in this table equal to *spacing*.

    .. method:: set_col_spacings(spacing)

        Sets the space between every column in this table equal to *spacing*.

Example
^^^^^^^

.. image:: ../images/layout_table_example.png

.. literalinclude:: ../examples/layout_table_example.py
    :linenos:
