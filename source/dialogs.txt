Dialogs
=======

Dialog windows are very similar to standard windows, and are used to provide or
retrieve information from the user. They are often used to provide a preferences
window, for example. The major difference a dialog has is some prepacked widgets
which layout the dialog automatically. From there, we can simply add labels,
buttons, check buttons, etc. Another big difference is the handling of responses
to control how the application should behave after the dialog has been interacted
with.

There are several derived Dialog classes which you might find useful.
:class:`Gtk.MessageDialog` is used for most simple notifications. But at other
times you might need to derive your own dialog class to provide more complex
functionality.

Custom Dialogs
--------------

To pack widgets into a custom dialog, you should pack them into the
:class:`Gtk.Box`, available via :meth:`Gtk.Dialog.get_content_area`. To just add
a :class:`Gtk.Button` to the bottom of the dialog, you could use the
:meth:`Gtk.Dialog.add_button` method.

A 'modal' dialog (that is, one which freezes the rest of the application from user
input), can be created by calling :class:`Gtk.Dialog.set_modal` on the dialog or
set the ``flags`` argument of the :class:`Gtk.Dialog` constructor to include
the :attr:`Gtk.DialogFlags.MODAL` flag.

Clicking a button will emit a signal called "response". If you want to block
waiting for a dialog to return before returning control flow to your code, you
can call :meth:`Gtk.Dialog.run`. This method returns an int which may be a value
from the :class:`Gtk.ResponseType` or it could be the custom response value that
you specified in the :class:`Gtk.Dialog` constructor or :meth:`Gtk.Dialog.add_button`.

Finally, there are two ways to remove a dialog.
The :meth:`Gtk.Widget.hide` method removes the dialog from view, however keeps
it stored in memory. This is useful to prevent having to construct the dialog
again if it needs to be accessed at a later time. Alternatively, the
:meth:`Gtk.Widget.destroy` method can be used to delete the dialog from memory
once it is no longer needed. It should be noted that if the dialog needs to be
accessed after it has been destroyed, it will need to be constructed again
otherwise the dialog window will be empty.

Dialog Objects
^^^^^^^^^^^^^^

.. class:: Gtk.Dialog([title[, parent[, flags[, buttons]]])

    Creates a new :class:`Gtk.Dialog` with title *title* and transient parent
    *parent*. The *flags* argument can be used to make the dialog model
    (:attr:`Gtk.DialogFlags.MODAL`) and/or to have it destroyed along with its
    transient parent (:attr:`Gtk.DialogFlags.DESTROY_WITH_PARENT`).

    *buttons* is a tuple of buttons which can be set to provide a range
    of different buttons and responses. See the :meth:`add_button` method for
    details.

    All arguments are optional and can be referred to as key-word arguments as
    well.

    .. method:: get_content_area()

        Return the content area of of this dialog.

    .. method:: add_button(button_text, response_id)

        Adds a button with the given text (or a stock button, if *button_text*
        is a :ref:`stock item <stock-items>`) and sets things up so that clicking
        the button will emit the "response" signal with the given *response_id*.
        The button is appended to the end of the dialog's action area.

        *response_id* can be any positive integer or one of the predefined
        :class:`Gtk.ResponseType` values:

        * :attr:`Gtk.ResponseType.NONE`
        * :attr:`Gtk.ResponseType.REJECT`
        * :attr:`Gtk.ResponseType.ACCEPT`
        * :attr:`Gtk.ResponseType.DELETE_EVENT`
        * :attr:`Gtk.ResponseType.OK`
        * :attr:`Gtk.ResponseType.CANCEL`
        * :attr:`Gtk.ResponseType.CLOSE`
        * :attr:`Gtk.ResponseType.YES`
        * :attr:`Gtk.ResponseType.NO`
        * :attr:`Gtk.ResponseType.APPLY`
        * :attr:`Gtk.ResponseType.HELP`

        The button widget is returned, but usually you don't need it.

    .. method:: add_buttons(button_text, response_id[, ...])

        Adds several buttons to this dialog using the button data passed as
        arguments to the method. This method is the same as calling
        :meth:`add_button` repeatedly. The button data pairs - button text (or
        :ref:`stock item <stock-items>`) and a response ID integer are passed
        individually. For example::

            dialog.add_buttons(Gtk.STOCK_OPEN, 42, "Close", Gtk.ResponseType.CLOSE)

    .. method:: set_modal(is_modal)

        Sets a dialog modal or non-modal. Modal dialogs prevent interaction with
        other windows in the same application.

    .. method:: run()

        Blocks in a recursive main loop until the dialog either emits the
        "response" signal, or is destroyed. If the dialog is destroyed during the
        call to :meth:`run`, :meth:`run` returns :attr:`Gtk.ResponseType.NONE`.
        Otherwise, it returns the response ID from the "response" signal emission.

Example
^^^^^^^
.. image:: ../images/dialog_example.png

.. literalinclude:: ../examples/dialog_example.py
    :linenos:

MessageDialog
-------------

:class:`Gtk.MessageDialog` is a convenience class, used to create simple,
standard message dialogs, with a message, an icon, and buttons for user response
You can specify the type of message and the text in the :class:`Gtk.MessageDialog`
constructor, as well as specifying standard buttons.

In some dialogs which require some further explanation of what has happened,
a secondary text can be added. In this case, the primary message entered when
creating the message dialog is made bigger and set to bold text. The secondary
message can be set by calling :meth:`Gtk.MessageDialog.format_secondary_text`.

MessageDialog Objects
^^^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.MessageDialog([parent[, flags[, message_type[, buttons, [message_format]]]])

    Creates a new :class:`Gtk.MessageDialog` with transient parent
    *parent*. The *flags* argument can be used to make the dialog model
    (:attr:`Gtk.DialogFlags.MODAL`) and/or to have it destroyed along with its
    transient parent (:attr:`Gtk.DialogFlags.DESTROY_WITH_PARENT`).

    *message_type* can be set to one of the following values:

    * :attr:`Gtk.MessageType.INFO`: Informational message
    * :attr:`Gtk.MessageType.WARNING`: Non-fatal warning message
    * :attr:`Gtk.MessageType.QUESTION`: Question requiring a choice
    * :attr:`Gtk.MessageType.ERROR`: Fatal error message
    * :attr:`Gtk.MessageType.OTHER`: None of the above, doesn't get an icon

    It is also possible to set a variety of buttons on the message dialog, to
    retrieve different responses from the user. One of the following values can
    be used:

    * :attr:`Gtk.ButtonsType.NONE`: no buttons at all
    * :attr:`Gtk.ButtonsType.OK`: an OK button
    * :attr:`Gtk.ButtonsType.CLOSE`: a Close button
    * :attr:`Gtk.ButtonsType.CANCEL`: a Cancel button
    * :attr:`Gtk.ButtonsType.YES_NO`: Yes and No buttons
    * :attr:`Gtk.ButtonsType.OK_CANCEL`: OK and Cancel buttons

    Finally, *message_format* is some text that the user may want to see.

    All arguments are optional and can be referred to as key-word arguments as
    well.

    .. method:: format_secondary_text(message_format)

        Sets the secondary text of the message dialog to be *message_format*.

        Note that setting a secondary text makes the primary text (*message_format*
        argument of :class:`Gtk.MessageDialog` constructor) become bold, unless
        you have provided explicit markup.

Example
^^^^^^^

.. image:: ../images/messagedialog_example.png

.. literalinclude:: ../examples/messagedialog_example.py
    :linenos:

FileChooserDialog
-----------------

The :class:`Gtk.FileChooserDialog` is suitable for use with "File/Open" or
"File/Save" menu items. You can use all of the :class:`Gtk.FileChooser` methods
on the file chooser dialog as well as those for :class:`Gtk.Dialog`.

When creating a :class:`Gtk.FileChooserDialog` you have to define the dialog's
purpose:

    * To select a file for opening, as for a File/Open command, use
      :attr:`Gtk.FileChooserAction.OPEN`
    * To save a file for the first time, as for a File/Save command, use
      :attr:`Gtk.FileChooserAction.SAVE`, and suggest a name such as "Untitled"
      with :meth:`Gtk.FileChooser.set_current_name`.
    * To save a file under a different name, as for a File/Save As command, use
      :attr:`Gtk.FileChooserAction.SAVE`, and set the existing filename with
      :meth:`Gtk.FileChooser.set_filename`.
    * To choose a folder instead of a file, use :attr:`Gtk.FileChooserAction.SELECT_FOLDER`.

:class:`Gtk.FileChooserDialog` inherits from :class:`Gtk.Dialog`, so buttons have
response IDs such as :attr:`Gtk.ResponseType.ACCEPT` and :attr:`Gtk.ResponseType.CANCEL`
which can be specified in the :class:`Gtk.FileChooserDialog` constructor.
In contrast to :class:`Gtk.Dialog`, you can not use custom response codes with
:class:`Gtk.FileChooserDialog`. It expects that at least one button will have
of the following response IDs:

    * :attr:`Gtk.ResponseType.ACCEPT`
    * :attr:`Gtk.ResponseType.OK`
    * :attr:`Gtk.ResponseType.YES`
    * :attr:`Gtk.ResponseType.APPLY`

When the user is finished selecting files, your program can get the selected
names either as filenames (:meth:`Gtk.FileChooser.get_filename`) or as URIs
(:meth:`Gtk.FileChooser.get_uri`).

By default, :class:`Gtk.FileChooser` only allows a single file to be selected at
a time. To enable multiple files to be selected, use
:meth:`Gtk.FileChooser.set_select_multiple`. Retrieving a list of selected files
is possible with either :meth:`Gtk.FileChooser.get_filenames` or
:meth:`Gtk.FileChooser.get_uris`.

:class:`Gtk.FileChooser` also supports a variety of options which make the files
and folders more configurable and accessible.

    * :meth:`Gtk.FileChooser.set_local_only`: Only local files can be selected.
    * :meth:`Gtk.FileChooser.show_hidden`: Hidden files and folders are displayed.
    * :meth:`Gtk.FileChooser.set_do_overwrite_confirmation`: If the file chooser
      was configured in :attr:`Gtk.FileChooserAction.SAVE` mode, it will present
      a confirmation dialog if the user types a file name that already exists.

Furthermore, you can specify which kind of files are displayed by creating
:class:`Gtk.FileFilter` objects and calling :meth:`Gtk.FileChooser.add_filter`.
The user can then select one of the added filters from a combo box at the bottom
of the file chooser.

FileChooser Objects
^^^^^^^^^^^^^^^^^^^

.. class:: Gtk.FileChooserDialog([title[, parent[, action[, buttons]]])

    Creates a new :class:`Gtk.FileChooserDialog` with title *title and transient
    parent *parent*.

    *action* can be one of the following:

    * :attr:`Gtk.FileChooserAction.OPEN`: The file chooser will only let the user
      pick an existing file.
    * :attr:`Gtk.FileChooserAction.SAVE`: The file chooser will let the user pick
      an existing file, or type in a new filename.
    * :attr:`Gtk.FileChooserAction.SELECT_FOLDER`: The file chooser will let the
      user pick an existing folder.
    * :attr:`Gtk.FileChooserAction.CREATE_FOLDER`:
      The file chooser will let the user name an existing or new folder.

    The *buttons* argument has the same format as for the :class:`Gtk.Dialog`
    constructor.

.. class:: Gtk.FileChooser

    .. method:: set_current_name(name)

        Sets the current name in the file selector, as if entered by the user.

    .. method:: set_filename(filename)

        Sets *filename* as the current filename for the file chooser, by changing
        to the file's parent folder and actually selecting the file in list; all
        other files will be unselected. If the chooser is in
        :attr:`Gtk.FileChooserAction.SAVE` mode, the file's base name will also
        appear in the dialog's file name entry.

        Note that the file must exist, or nothing will be done except for the
        directory change.

    .. method:: set_select_multiple(select_multiple)

        Sets whether multiple files can be selected. This is only relevant if
        the mode is :attr:`Gtk.FileChooserAction.OPEN` or
        :attr:`Gtk.FileChooserAction.SELECT_FOLDER`.

    .. method:: set_local_only(local_only)

        Sets whether only local files can be selected.

    .. method:: set_show_hidden(show_hidden)

        Sets whether to display hidden files and folders.

    .. method:: set_do_overwrite_confirmation(do_overwrite_confirmation)

        Sets whether to confirm overwriting in save mode.

    .. method:: get_filename()

        Returns the filename for the currently selected file in the file selector.
        If multiple files are selected, use :meth:`get_filenames` instead.

    .. method:: get_filenames()

        Returns a list of all the selected files and subfolders in the current
        folder. The returned names are full absolute paths. If files in the
        current folder cannot be represented as local filenames they will be ignored.
        Use :meth:`get_uris` instead.

    .. method:: get_uri()

        Returns the URI for the currently selected file in the file selector.
        If multiple files are selected, use :meth:`get_uris` instead.

    .. method:: get_uris()

        Returns a list of all the selected files and subfolders in the current
        folder. The returned names are full absolute URIs.

    .. method:: add_filter(filter)

        Adds the :class:`Gtk.FileFilter` instance *filter* to the list of filters
        that the user can choose from. When a filter is selected, only files that
        are passed by that filter are displayed.

.. class:: Gtk.FileFilter

    .. method:: set_name(name)

        Sets the human-readable name of the filter; this is the string that will
        be displayed in the file selector user interface if there is a selectable
        list of filters.

    .. method:: add_mime_type(mime_type)

        Adds a rule allowing a given mime type to filter.

    .. method:: add_pattern(pattern)

        Adds a rule allowing a shell style glob to a filter.

Example
^^^^^^^

.. image:: ../images/filechooserdialog_example.png

.. literalinclude:: ../examples/filechooserdialog_example.py
    :linenos:
