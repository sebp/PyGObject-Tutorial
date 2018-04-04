��                                   =     \     x  �  �  ~   F  "  �  �   �  I   �  L       ^  9  w  �  �	     F  �  U     =     E     M  %  _     �  8  �     �  �   �  �   �  V   �  �   �  �   �  �   �  `   h  W   �  �   !  �  �     n     �     �     �  �  �  ~   �  "    �   9  I     L   b    �  9  �  �  !     �"  �  �"     �$     �$     �$  %  �$     �&  8  �'     )  �   )  �   �)  V   �*  �   F+  �   F,  �   -  `   �-  W   .  �   r.   :attr:`Gtk.ResponseType.ACCEPT` :attr:`Gtk.ResponseType.APPLY` :attr:`Gtk.ResponseType.OK` :attr:`Gtk.ResponseType.YES` :class:`Gtk.FileChooserDialog` inherits from :class:`Gtk.Dialog`, so buttons have response IDs such as :attr:`Gtk.ResponseType.ACCEPT` and :attr:`Gtk.ResponseType.CANCEL` which can be specified in the :class:`Gtk.FileChooserDialog` constructor. In contrast to :class:`Gtk.Dialog`, you can not use custom response codes with :class:`Gtk.FileChooserDialog`. It expects that at least one button will have of the following response IDs: :class:`Gtk.FileChooser` also supports a variety of options which make the files and folders more configurable and accessible. :class:`Gtk.MessageDialog` is a convenience class, used to create simple, standard message dialogs, with a message, an icon, and buttons for user response You can specify the type of message and the text in the :class:`Gtk.MessageDialog` constructor, as well as specifying standard buttons. :meth:`Gtk.FileChooser.set_do_overwrite_confirmation`: If the file chooser was configured in :attr:`Gtk.FileChooserAction.SAVE` mode, it will present a confirmation dialog if the user types a file name that already exists. :meth:`Gtk.FileChooser.set_local_only`: Only local files can be selected. :meth:`Gtk.FileChooser.show_hidden`: Hidden files and folders are displayed. A 'modal' dialog (that is, one which freezes the rest of the application from user input), can be created by calling :class:`Gtk.Dialog.set_modal` on the dialog or set the ``flags`` argument of the :class:`Gtk.Dialog` constructor to include the :attr:`Gtk.DialogFlags.MODAL` flag. By default, :class:`Gtk.FileChooser` only allows a single file to be selected at a time. To enable multiple files to be selected, use :meth:`Gtk.FileChooser.set_select_multiple`. Retrieving a list of selected files is possible with either :meth:`Gtk.FileChooser.get_filenames` or :meth:`Gtk.FileChooser.get_uris`. Clicking a button will emit a signal called "response". If you want to block waiting for a dialog to return before returning control flow to your code, you can call :meth:`Gtk.Dialog.run`. This method returns an int which may be a value from the :class:`Gtk.ResponseType` or it could be the custom response value that you specified in the :class:`Gtk.Dialog` constructor or :meth:`Gtk.Dialog.add_button`. Custom Dialogs Dialog windows are very similar to standard windows, and are used to provide or retrieve information from the user. They are often used to provide a preferences window, for example. The major difference a dialog has is some prepacked widgets which layout the dialog automatically. From there, we can simply add labels, buttons, check buttons, etc. Another big difference is the handling of responses to control how the application should behave after the dialog has been interacted with. Dialogs Example FileChooserDialog Finally, there are two ways to remove a dialog. The :meth:`Gtk.Widget.hide` method removes the dialog from view, however keeps it stored in memory. This is useful to prevent having to construct the dialog again if it needs to be accessed at a later time. Alternatively, the :meth:`Gtk.Widget.destroy` method can be used to delete the dialog from memory once it is no longer needed. It should be noted that if the dialog needs to be accessed after it has been destroyed, it will need to be constructed again otherwise the dialog window will be empty. Furthermore, you can specify which kind of files are displayed by creating :class:`Gtk.FileFilter` objects and calling :meth:`Gtk.FileChooser.add_filter`. The user can then select one of the added filters from a combo box at the bottom of the file chooser. In some dialogs which require some further explanation of what has happened, a secondary text can be added. In this case, the primary message entered when creating the message dialog is made bigger and set to bold text. The secondary message can be set by calling :meth:`Gtk.MessageDialog.format_secondary_text`. MessageDialog The :class:`Gtk.FileChooserDialog` is suitable for use with "File/Open" or "File/Save" menu items. You can use all of the :class:`Gtk.FileChooser` methods on the file chooser dialog as well as those for :class:`Gtk.Dialog`. There are several derived Dialog classes which you might find useful. :class:`Gtk.MessageDialog` is used for most simple notifications. But at other times you might need to derive your own dialog class to provide more complex functionality. To choose a folder instead of a file, use :attr:`Gtk.FileChooserAction.SELECT_FOLDER`. To pack widgets into a custom dialog, you should pack them into the :class:`Gtk.Box`, available via :meth:`Gtk.Dialog.get_content_area`. To just add a :class:`Gtk.Button` to the bottom of the dialog, you could use the :meth:`Gtk.Dialog.add_button` method. To save a file for the first time, as for a File/Save command, use :attr:`Gtk.FileChooserAction.SAVE`, and suggest a name such as "Untitled" with :meth:`Gtk.FileChooser.set_current_name`. To save a file under a different name, as for a File/Save As command, use :attr:`Gtk.FileChooserAction.SAVE`, and set the existing filename with :meth:`Gtk.FileChooser.set_filename`. To select a file for opening, as for a File/Open command, use :attr:`Gtk.FileChooserAction.OPEN` When creating a :class:`Gtk.FileChooserDialog` you have to define the dialog's purpose: When the user is finished selecting files, your program can get the selected names either as filenames (:meth:`Gtk.FileChooser.get_filename`) or as URIs (:meth:`Gtk.FileChooser.get_uri`). Project-Id-Version: Python GTK+ 3 Tutorial 3.4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-03-27 18:45-0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: pt_BR
Language-Team: pt_BR <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 :attr:`Gtk.ResponseType.ACCEPT` :attr:`Gtk.ResponseType.APPLY` :attr:`Gtk.ResponseType.OK` :attr:`Gtk.ResponseType.YES` :class:`Gtk.FileChooserDialog` inherits from :class:`Gtk.Dialog`, so buttons have response IDs such as :attr:`Gtk.ResponseType.ACCEPT` and :attr:`Gtk.ResponseType.CANCEL` which can be specified in the :class:`Gtk.FileChooserDialog` constructor. In contrast to :class:`Gtk.Dialog`, you can not use custom response codes with :class:`Gtk.FileChooserDialog`. It expects that at least one button will have of the following response IDs: :class:`Gtk.FileChooser` also supports a variety of options which make the files and folders more configurable and accessible. :class:`Gtk.MessageDialog` is a convenience class, used to create simple, standard message dialogs, with a message, an icon, and buttons for user response You can specify the type of message and the text in the :class:`Gtk.MessageDialog` constructor, as well as specifying standard buttons. :meth:`Gtk.FileChooser.set_do_overwrite_confirmation`: If the file chooser was configured in :attr:`Gtk.FileChooserAction.SAVE` mode, it will present a confirmation dialog if the user types a file name that already exists. :meth:`Gtk.FileChooser.set_local_only`: Only local files can be selected. :meth:`Gtk.FileChooser.show_hidden`: Hidden files and folders are displayed. A 'modal' dialog (that is, one which freezes the rest of the application from user input), can be created by calling :class:`Gtk.Dialog.set_modal` on the dialog or set the ``flags`` argument of the :class:`Gtk.Dialog` constructor to include the :attr:`Gtk.DialogFlags.MODAL` flag. By default, :class:`Gtk.FileChooser` only allows a single file to be selected at a time. To enable multiple files to be selected, use :meth:`Gtk.FileChooser.set_select_multiple`. Retrieving a list of selected files is possible with either :meth:`Gtk.FileChooser.get_filenames` or :meth:`Gtk.FileChooser.get_uris`. Clicking a button will emit a signal called "response". If you want to block waiting for a dialog to return before returning control flow to your code, you can call :meth:`Gtk.Dialog.run`. This method returns an int which may be a value from the :class:`Gtk.ResponseType` or it could be the custom response value that you specified in the :class:`Gtk.Dialog` constructor or :meth:`Gtk.Dialog.add_button`. Custom Dialogs Dialog windows are very similar to standard windows, and are used to provide or retrieve information from the user. They are often used to provide a preferences window, for example. The major difference a dialog has is some prepacked widgets which layout the dialog automatically. From there, we can simply add labels, buttons, check buttons, etc. Another big difference is the handling of responses to control how the application should behave after the dialog has been interacted with. Dialogs Example FileChooserDialog Finally, there are two ways to remove a dialog. The :meth:`Gtk.Widget.hide` method removes the dialog from view, however keeps it stored in memory. This is useful to prevent having to construct the dialog again if it needs to be accessed at a later time. Alternatively, the :meth:`Gtk.Widget.destroy` method can be used to delete the dialog from memory once it is no longer needed. It should be noted that if the dialog needs to be accessed after it has been destroyed, it will need to be constructed again otherwise the dialog window will be empty. Furthermore, you can specify which kind of files are displayed by creating :class:`Gtk.FileFilter` objects and calling :meth:`Gtk.FileChooser.add_filter`. The user can then select one of the added filters from a combo box at the bottom of the file chooser. In some dialogs which require some further explanation of what has happened, a secondary text can be added. In this case, the primary message entered when creating the message dialog is made bigger and set to bold text. The secondary message can be set by calling :meth:`Gtk.MessageDialog.format_secondary_text`. MessageDialog The :class:`Gtk.FileChooserDialog` is suitable for use with "File/Open" or "File/Save" menu items. You can use all of the :class:`Gtk.FileChooser` methods on the file chooser dialog as well as those for :class:`Gtk.Dialog`. There are several derived Dialog classes which you might find useful. :class:`Gtk.MessageDialog` is used for most simple notifications. But at other times you might need to derive your own dialog class to provide more complex functionality. To choose a folder instead of a file, use :attr:`Gtk.FileChooserAction.SELECT_FOLDER`. To pack widgets into a custom dialog, you should pack them into the :class:`Gtk.Box`, available via :meth:`Gtk.Dialog.get_content_area`. To just add a :class:`Gtk.Button` to the bottom of the dialog, you could use the :meth:`Gtk.Dialog.add_button` method. To save a file for the first time, as for a File/Save command, use :attr:`Gtk.FileChooserAction.SAVE`, and suggest a name such as "Untitled" with :meth:`Gtk.FileChooser.set_current_name`. To save a file under a different name, as for a File/Save As command, use :attr:`Gtk.FileChooserAction.SAVE`, and set the existing filename with :meth:`Gtk.FileChooser.set_filename`. To select a file for opening, as for a File/Open command, use :attr:`Gtk.FileChooserAction.OPEN` When creating a :class:`Gtk.FileChooserDialog` you have to define the dialog's purpose: When the user is finished selecting files, your program can get the selected names either as filenames (:meth:`Gtk.FileChooser.get_filename`) or as URIs (:meth:`Gtk.FileChooser.get_uri`). 