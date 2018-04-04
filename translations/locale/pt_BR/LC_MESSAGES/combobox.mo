��          T               �   �  �     _     ~     �     �  �  �  �    �  �    �	     �
     �
     �
  �  �   :class:`Gtk.ComboBox` is very similar to :class:`Gtk.TreeView`, as both use the model-view pattern; the list of valid choices is specified in the form of a tree model, and the display of the choices can be adapted to the data in the model by using :ref:`cell renderers <cellrenderers>`. If the combo box contains a large number of items, it may be better to display them in a grid rather than a list. This can be done by calling :meth:`Gtk.ComboBox.set_wrap_width`. A :class:`Gtk.ComboBox` allows for the selection of an item from a dropdown menu. They are preferable to having many radio buttons on screen as they take up less room. If appropriate, it can show extra information about each item, such as text, a picture, a checkbox, or a progress bar. ComboBox Example For a simple list of textual choices, the model-view API of :class:`Gtk.ComboBox` can be a bit overwhelming. In this case, :class:`Gtk.ComboBoxText` offers a simple alternative. Both :class:`Gtk.ComboBox` and :class:`Gtk.ComboBoxText` can contain an entry. The :class:`Gtk.ComboBox` widget usually restricts the user to the available choices, but it can optionally have an :class:`Gtk.Entry`, allowing the user to enter arbitrary text if none of the available choices are suitable. To do this, use one of the static methods :meth:`Gtk.ComboBox.new_with_entry` or :meth:`Gtk.ComboBox.new_with_model_and_entry` to create an :class:`Gtk.ComboBox` instance. Project-Id-Version: Python GTK+ 3 Tutorial 3.4
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
 :class:`Gtk.ComboBox` is very similar to :class:`Gtk.TreeView`, as both use the model-view pattern; the list of valid choices is specified in the form of a tree model, and the display of the choices can be adapted to the data in the model by using :ref:`cell renderers <cellrenderers>`. If the combo box contains a large number of items, it may be better to display them in a grid rather than a list. This can be done by calling :meth:`Gtk.ComboBox.set_wrap_width`. A :class:`Gtk.ComboBox` allows for the selection of an item from a dropdown menu. They are preferable to having many radio buttons on screen as they take up less room. If appropriate, it can show extra information about each item, such as text, a picture, a checkbox, or a progress bar. ComboBox Example For a simple list of textual choices, the model-view API of :class:`Gtk.ComboBox` can be a bit overwhelming. In this case, :class:`Gtk.ComboBoxText` offers a simple alternative. Both :class:`Gtk.ComboBox` and :class:`Gtk.ComboBoxText` can contain an entry. The :class:`Gtk.ComboBox` widget usually restricts the user to the available choices, but it can optionally have an :class:`Gtk.Entry`, allowing the user to enter arbitrary text if none of the available choices are suitable. To do this, use one of the static methods :meth:`Gtk.ComboBox.new_with_entry` or :meth:`Gtk.ComboBox.new_with_model_and_entry` to create an :class:`Gtk.ComboBox` instance. 