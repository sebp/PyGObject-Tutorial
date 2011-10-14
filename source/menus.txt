Menus
=====

GTK+ comes with two different types of menus, :class:`Gtk.MenuBar` and
:class:`Gtk.Toolbar`. :class:`Gtk.MenuBar` is a standard menu bar which contains
one or more :class:`Gtk.MenuItem` instances or one of its subclasses.
:class:`Gtk.Toolbar` widgets are used for quick accessibility to commonly used
functions of an application. Examples include creating a new document, printing
a page or undoing an operation. It contains one or more instances of
:class:`Gtk.ToolItem` or one of its subclasses.

Actions
-------

Although, there are specific APIs to create menus and toolbars, you should
use :class:`Gtk.UIManager` and create :class:`Gtk.Action` instances.
Actions are organised into groups. A :class:`Gtk.ActionGroup` is essentially a
map from names to :class:`Gtk.Action` objects.
All actions that would make sense to use in a particular context should be in a
single group. Multiple action groups may be used for a particular user interface.
In fact, it is expected that most non-trivial applications will make use of
multiple groups. For example, in an application that can edit multiple documents,
one group holding global actions (e.g. quit, about, new), and one group per
document holding actions that act on that document (eg. save, cut/copy/paste, etc).
Each window's menus would be constructed from a combination of two action groups.

Different classes representing different types of actions exist:

* :class:`Gtk.Action`: An action which can be triggered by a menu or toolbar
  item
* :class:`Gtk.ToggleAction`: An action which can be toggled between two states
* :class:`Gtk.RadioAction`: An action of which only one in a group can be
  active
* :class:`Gtk.RecentAction`: An action of which represents a list of recently
  used files

Actions represent operations that the user can be perform, along with some
information how it should be presented in the interface, including its name
(not for display), its label (for display), an accelerator, whether a label
indicates a :ref:`stock item <stock-items>`, a tooltip, as well as the callback
that is called when the action gets activated.

You can create actions by either calling one of the constructors directly and
adding them to a :class:`Gtk.ActionGroup` by calling
:meth:`Gtk.ActionGroup.add_action` or :meth:`Gtk.ActionGroup.add_action_with_accel`,
or by calling one of the convenience functions:

* :meth:`Gtk.ActionGroup.add_actions`,
* :meth:`Gtk.ActionGroup.add_toggle_actions`
* :meth:`Gtk.ActionGroup.add_radio_actions`.

Note that you must specify actions for sub menus as well as menu items.

Action Objects
^^^^^^^^^^^^^^

.. class:: Gtk.Action(name, label, tooltip, stock_id)

    *name* must be a unique name of the action.

    If *label* is not ``None``, it is displayed in menu items and on buttons.

    If *tooltip* is not ``None``, it is used as tooltip for the action.

    If *stock_id* is not ``None``, it is used to lookup the
    :ref:`stock item <stock-items>` to display
    in widgets representing the action.

.. class:: Gtk.ToggleAction(name, label, tooltip, stock_id)

    The arguments are the same as for the :class:`Gtk.Action` constructor.

.. class:: Gtk.RadioAction(name, label, tooltip, stock_id, value)

    The first four arguments are the same as for the :class:`Gtk.Action` constructor.

    *value* indicates the value which :meth:`get_current_value` should return if
    this action is selected.

    .. method:: get_current_value()

        Obtains the "value" property of the currently active member of the group
        to which this action belongs.

    .. method:: join_group(group_source)

        Joins this radio action object to the group of the *group_source* radio
        action object.

        *group_source* must be a radio action object whose group we are joining,
        or ``None`` to remove the radio action from its group.

.. class:: Gtk.ActionGroup(name)

    Creates a new :class:`Gtk.ActionGroup` instance. The name of the action group
    is used when associating keybindings with the actions.

    .. method:: add_action(action)

        Adds an :class:`Gtk.Action` object to the action group.

        Note that this method does not set up the accelerator path of the action,
        use :meth:`add_action_with_accel` instead.

    .. method:: add_action_with_accel(action, accelerator)

        Adds an :class:`Gtk.Action` object to the action group and sets up the
        accelerator.

        *accelerator* must be in the format understood by :func:`Gtk.accelerator_parse`,
        or ``""`` for no accelerator, or ``None`` to use the stock accelerator.

    .. method:: add_actions(entries[, user_data])

        This is a convenience function to create a number of :class:`Gtk.Action`
        objects and add them to this action group.

        *entries* is a list of tuples which can vary in size from one to six
        items with the following information:

        * The name of the action (mandatory)
        * The :ref:`stock item <stock-items>` of the action (default: ``None``)
        * The label for the action (default: ``None``)
        * The accelerator for the action, in the format understood by the
          :func:`Gtk.accelerator_parse` function (default: ``None``)
        * The tooltip of the action (default: ``None``)
        * The callback function invoked when the action is activated
          (default: ``None``)

        The "activate" signals of the actions are connected to the callbacks.

        If *user_data* is not ``None``, it is passed to the callback function
        (if specified).

    .. method:: add_toggle_actions(entries[, user_data])

        This is a convenience function to create a number of
        :class:`Gtk.ToggleAction` objects and add them to this action group.

        *entries* is a list of tuples which can vary in size from one to seven
        items with the following information:

        * The name of the action (mandatory)
        * The :ref:`stock item <stock-items>` of the action (default: ``None``)
        * The label for the action (default: ``None``)
        * The accelerator for the action, in the format understood by the
          :func:`Gtk.accelerator_parse` function (default: ``None``)
        * The tooltip of the action (default: ``None``)
        * The callback function invoked when the action is activated
          (default: ``None``)
        * A Boolean indicating whether the toggle action is active
          (default: ``False``)

        The "activate" signals of the actions are connected to the callbacks.

        If *user_data* is not ``None``, it is passed to the callback function
        (if specified).

    .. method:: add_radio_actions(entries[, value[, on_change[, user_data]]])

        This is a convenience routine to create a group of :class:`Gtk.RadioAction`
        objects and add them to this action group.

        *entries* is a list of tuples which can vary in size from one to six
        items with the following information:

        * The name of the action (mandatory)
        * The :ref:`stock item <stock-items>` of the action (default: ``None``)
        * The label for the action (default: ``None``)
        * The accelerator for the action, in the format understood by the
          :func:`Gtk.accelerator_parse` function (default: ``None``)
        * The tooltip of the action (default: ``None``)
        * The value to set on the radio action (default: 0)

        *value* specifies the radio action that should be set active.

        The "changed" signal of the first radio action is connected to
        the *on_change* callback  (if specified).

        If *user_data* is not ``None``, it is passed to the callback function
        (if specified).

.. function:: Gtk.accelerator_parse(accelerator)

    Parses a string representing an accelerator. The format looks like
    "<Control>a" or "<Shift><Alt>F1" or "<Release>z" (the last one is for key release).
    The parser is fairly liberal and allows lower or upper case, and also
    abbreviations such as "<Ctl>" and "<Ctrl>".
    For character keys the name is not the symbol, but the lowercase name, e.g.
    one would use "<Ctrl>minus" instead of "<Ctrl>-".

    Returns a tuple ``(accelerator_key, accelerator_mods)``, where the latter
    represents the accelerator modifier mask and the first the accelerator keyval.
    Both values will be set to 0 (zero) if parsing failed.

UI Manager
----------

:class:`Gtk.UIManager` provides an easy way of creating menus and toolbars using
an `XML-like description <http://developer.gnome.org/gtk3/stable/GtkUIManager.html#XML-UI>`_.

First of all, you should add the :class:`Gtk.ActionGroup` to the UI Manager with
:meth:`Gtk.UIManager.insert_action_group`. At this point is also a good idea to
tell the parent window to respond to the specified keyboard shortcuts, by using
:meth:`Gtk.UIManager.get_accel_group` and :meth:`Gtk.Window.add_accel_group`.

Then, you can define the actual visible layout of the menus and toolbars, and
add the UI layout. This "ui string" uses an XML format, in which you should
mention the names of the actions that you have already created.
Remember that these names are just the identifiers that we used when creating
the actions. They are not the text that the user will see in the menus and
toolbars. We provided those human-readable names when we created the actions.

Finally, you retrieve the root widget with :meth:`Gtk.UIManager.get_widget`
and add the widget to a container such as :class:`Gtk.Box`.

UIManager Objects
^^^^^^^^^^^^^^^^^

.. class:: Gtk.UIManager

    .. method:: insert_action_group(action_group[, pos])

        Inserts an action group into the list of action groups associated with
        this manager. Actions in earlier groups hide actions with the same name
        in later groups.

        *pos* is the position at which the group will be inserted. If omitted,
        it will be appended.

    .. method:: get_accel_group()

        Returns the group of global keyboard accelerators associated with this
        manager.

    .. method:: get_widget(path)

        Looks up a widget by following a path. The path consists of the names
        specified in the XML description of the UI. separated by '/'. Elements
        which don't have a name or action attribute in the XML (e.g. <popup>)
        can be addressed by their XML element name (e.g. "popup"). The root
        element ("/ui") can be omitted in the path.

        Returns the widget found by following the *path*, or ``None`` if no
        widget was found.

    .. method:: add_ui_from_string(text)

        Parses *text* containing a `UI definition <http://developer.gnome.org/gtk3/stable/GtkUIManager.html#XML-UI>`_
        and merges it with the current contents of manager. An enclosing <ui>
        element is added if it is missing.

        Returns the merge id for the merged UI.

        Throws an exception if an error occurred.

Example
-------

.. image:: ../images/menu_example.png

.. literalinclude:: ../examples/menu_example.py
    :linenos:
