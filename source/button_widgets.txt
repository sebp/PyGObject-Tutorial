Button Widgets
==============

Button
------

The Button widget is another commonly used widget. It is generally used to
attach a function that is called when the button is pressed.

The :class:`Gtk.Button` widget can hold any valid child widget. That is it can
hold most any other standard :class:`Gtk.Widget`. The most commonly used child
is the :class:`Gtk.Label`.

Usually, you want to connect to the button's "clicked" signal which is emitted
when the button has been pressed and released.

Button Objects
^^^^^^^^^^^^^^
.. class:: Gtk.Button([label[, stock[, use_underline]]])

    If label is not ``None``, creates a new :class:`Gtk.Button` with a
    :class:`Gtk.Label` child containing the given text.

    If *stock* is not ``None``, creates a new button containing the image and
    text from a :ref:`stock item <stock-items>`.

    If *use_underline* is set to ``True``, an underline  in the text
    indicates the next character should be used for the mnemonic accelerator key.

    .. method:: set_label(label)

    Sets the text of the label of the button to *label*.

    .. method:: set_use_underline(use_underline)

    If *True*, an underline in the text of the button label indicates the next
    character should be used for the mnemonic accelerator key.

Example
^^^^^^^

.. image:: ../images/button_example.png

.. literalinclude:: ../examples/button_example.py
    :linenos:

ToggleButton
------------

A :class:`Gtk.ToggleButton` is very similar to a normal :class:`Gtk.Button`,
but when clicked they remain activated, or pressed, until clicked again.
When the state of the button is changed, the "toggled" signal is emitted.

To retrieve the state of the :class:`Gtk.ToggleButton`, you can use the
:meth:`Gtk.ToggleButton.get_active` method. This returns ``True`` if the button
is "down". You can also set the toggle button's state, with
:meth:`Gtk.ToggleButton.set_active`. Note that, if you do this, and the state
actually changes, it causes the "toggled" signal to be emitted.

ToggleButton Objects
^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.ToggleButton([label[, stock[,use_underline]]])

    The arguments are the same as for the :class:`Gtk.Button` constructor.

    .. method:: get_active()

    Returns the buttons current state. Returns ``True`` if the toggle button
    is pressed in and ``False`` if it is raised.

    .. method:: set_active(is_active)

    Sets the status of the toggle button. Set to ``True`` if you want the button
    to be pressed in, and ``False`` to raise it. This action causes the
    "toggled" signal to be emitted.

Example
^^^^^^^

.. image:: ../images/togglebutton_example.png

.. literalinclude:: ../examples/togglebutton_example.py
    :linenos:

CheckButton
-----------
:class:`Gtk.CheckButton` inherits from :class:`Gtk.ToggleButton`. The only real
difference between the two is :class:`Gtk.CheckButton`'s appearance.
A :class:`Gtk.CheckButton` places a discrete :class:`Gtk.ToggleButton` next to
a widget, (usually a :class:`Gtk.Label`).
The "toggled" signal, :meth:`Gtk.ToggleButton.set_active` and
:meth:`Gtk.ToggleButton.get_active` are inherited.

CheckButton Objects
^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.CheckButton([label[, stock[, use_underline]]])

    Arguments are the same as for :class:`Gtk.Button`.

RadioButton
-----------
Like checkboxes, radio buttons also inherit from :class:`Gtk.ToggleButton`,
but these work in groups, and only one :class:`Gtk.RadioButton` in a group can
be selected at any one time. Therefore, a :class:`Gtk.RadioButton` is one way
of giving the user a choice from many options.

Radio buttons can be created with one of the static methods
:meth:`Gtk.RadioButton.new_from_widget`,
:meth:`Gtk.RadioButton.new_with_label_from_widget` or
:meth:`Gtk.RadioButton.new_with_mnemonic_from_widget`.
The first radio button in a group will be created passing ``None`` as the
*group* argument. In subsequent calls, the group you
wish to add this button to should be passed as an argument.

When first run, the first radio button in the group will be active.
This can be changed by calling :meth:`Gtk.ToggleButton.set_active` with ``True``
as first argument.

Changing a :class:`Gtk.RadioButton`'s widget group after its creation can be
achieved by calling :meth:`Gtk.RadioButton.join_group`.

RadioButton Objects
^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.RadioButton

    .. staticmethod:: new_from_widget(group)

        Creates a new :class:`Gtk.RadioButton`, adding it to the same group as
        the *group* widget. If *group* is ``None``, a new group is created.

    .. staticmethod:: new_with_label_from_widget(group, label)

        Creates a new :class:`Gtk.RadioButton`. The text of the label widget
        inside the button will be set to *label*. *group* is the same as for
        :meth:`new_from_widget`.

    .. staticmethod:: new_with_mnemonic_from_widget(group, label)

        Same as :meth:`new_with_label_from_widget`, but underscores in *label*
        indicate the mnemonic for the button.

    .. method:: join_group(group)

    Joins this radio button to the group of another :class:`Gtk.RadioButton` object.

Example
^^^^^^^

.. image:: ../images/radiobutton_example.png

.. literalinclude:: ../examples/radiobutton_example.py
    :linenos:

LinkButton
----------
A :class:`Gtk.LinkButton` is a :class:`Gtk.Button` with a hyperlink, similar
to the one used by web browsers, which triggers an action when clicked. It is
useful to show quick links to resources.

The URI bound to a :class:`Gtk.LinkButton` can be set specifically using
:meth:`Gtk.LinkButton.set_uri`, and retrieved using :meth:`Gtk.LinkButton.get_uri`.


LinkButton Objects
^^^^^^^^^^^^^^^^^^

.. class:: Gtk.LinkButton(uri [, label])

    *uri* is the address of the website which should be loaded. The label is set
    as the text which should be displayed. If it is set to ``None`` or omitted,
    the web address will be displayed instead.

    .. method:: get_uri()

    Retrieves the URI set using :meth:`set_uri`.

    .. method:: set_uri(uri)

    Sets *uri* as the URI where this button points to. As a side-effect this
    unsets the 'visited' state of the button. 

Example
^^^^^^^

.. image:: ../images/linkbutton_example.png

.. literalinclude:: ../examples/linkbutton_example.py
    :linenos:

SpinButton
----------
A :class:`Gtk.SpinButton` is an ideal way to allow the user to set the value of
some attribute. Rather than having to directly type a number into a
:class:`Gtk.Entry`, :class:`Gtk.SpinButton` allows the user to click on one of
two arrows to increment or decrement the displayed value. A value can still be
typed in, with the bonus that it can be checked to ensure it is in a given range. 
The main properties of a :class:`Gtk.SpinButton` are set through
:class:`Gtk.Adjustment`.

To change the value that :class:`Gtk.SpinButton` is showing, use
:meth:`Gtk.SpinButton.set_value`. The value entered can either be an integer or
float, depending on your requirements, use :meth:`Gtk.SpinButton.get_value` or
:meth:`Gtk.SpinButton.get_value_as_int`, respectively.

When you allow the displaying of float values in the spin button, you may wish
to adjust the number of decimal spaces displayed by calling
:meth:`Gtk.SpinButton.set_digits`.

By default, :class:`Gtk.SpinButton` accepts textual data. If you wish to limit
this to numerical values only, call :meth:`Gtk.SpinButton.set_numeric` with ``True``
as argument.

We can also adjust the update policy of :class:`Gtk.SpinButton`. There are two
options here; by default the spin button updates the value even if the data
entered is invalid. Alternatively, we can set the policy to only update when the
value entered is valid by calling :meth:`Gtk.SpinButton.set_update_policy`.

SpinButton Objects
^^^^^^^^^^^^^^^^^^

.. class:: Gtk.SpinButton()

    .. method:: set_adjustment(adjustment)

        Replaces the :class:`Gtk.Adjustment` associated with this spin button.

    .. method:: set_digits(digits)

        Set the precision to be displayed by this spin button. Up to 20 digit
        precision is allowed.

    .. method:: set_increments(step, page)

        Sets the step and page increments for this spin button. This affects how
        quickly the value changes when the spin button's arrows are activated.

    .. method:: set_value(value)

        Sets the value of this spin button.

    .. method:: get_value()

        Get the value of this spin button represented as an float.

    .. method:: get_value_as_int()

        Get the value of this spin button represented as an integer.

    .. method:: set_numeric(numeric)

        If *numeric* is ``False``, non-numeric text can be typed into the
        spin button, else only numbers can be typed.

    .. method:: set_update_policy(policy)

        Sets the update behavior of a spin button. This determines whether the
        spin button is always updated or only when a valid value is set.
        The *policy* argument can either be :attr:`Gtk.SpinButtonUpdatePolicy.ALWAYS`
        or :attr:`Gtk.SpinButtonUpdatePolicy.IF_VALID`.

Adjustment Objects
^^^^^^^^^^^^^^^^^^

.. class:: Gtk.Adjustment(value, lower, upper, step_increment, page_increment, page_size)

    The :class:`Gtk.Adjustment` object represents a value which has an associated
    lower and upper bound, together with step and page increments, and a page
    size. It is used within several GTK+ widgets, including :class:`Gtk.SpinButton`,
    :class:`Gtk.Viewport`, and :class:`Gtk.Range`.

    *value* is the initial value, *lower* the minimum value, *upper* the maximum
    value, *step_increment* the step increment, *page_increment* the page
    increment, and *page_size* the page size.

Example
^^^^^^^

.. image:: ../images/spinbutton_example.png

.. literalinclude:: ../examples/spinbutton_example.py
    :linenos:
