��                                  ,  z  K     �  !   �  �        �  I  �           (     F  �   f  �  +  �   �  �   m	  �   D
  �   $  �        �     �     �     �               *     8  �   @  �   �  +  �  _   �  �  S     �       z  "     �  !   �  �   �     v  I  �      �     �       �   =  �    �   �  �   D  �     �   �  �   �     �     �     �     �     �     �            �     �   �  +  �  _   �   :class:`Gtk.CellRendererAccel` :class:`Gtk.CellRendererCombo` :class:`Gtk.CellRendererCombo` renders text in a cell like :class:`Gtk.CellRendererText` from which it is derived. But while the latter offers a simple entry to edit the text, :class:`Gtk.CellRendererCombo` offers a :class:`Gtk.ComboBox` widget to edit the text. The values to display in the combo box are taken from the :class:`Gtk.TreeModel` specified in the "model" property. :class:`Gtk.CellRendererPixbuf` :class:`Gtk.CellRendererProgress` :class:`Gtk.CellRendererProgress` renders a numeric value as a progress bar in a cell. Additionally, it can display a text on top of the progress bar. :class:`Gtk.CellRendererSpin` :class:`Gtk.CellRendererSpin` renders text in a cell like :class:`Gtk.CellRendererText` from which it is derived. But while the latter offers a simple entry to edit the text, :class:`Gtk.CellRendererSpin` offers a :class:`Gtk.SpinButton` widget. Of course, that means that the text has to be parseable as a floating point number. :class:`Gtk.CellRendererSpinner` :class:`Gtk.CellRendererText` :class:`Gtk.CellRendererToggle` :class:`Gtk.CellRendererToggle` renders a toggle button in a cell. The button is drawn as a radio- or checkbutton, depending on the "radio" property. When activated, it emits the "toggled" signal. :class:`Gtk.CellRenderer` widgets are used to display information within widgets such as the :class:`Gtk.TreeView` or :class:`Gtk.ComboBox`. They work closely with the associated widgets and are very powerful, with lots of configuration options for displaying a large amount of data in different ways. There are seven :class:`Gtk.CellRenderer` widgets which can be used for different purposes: A :class:`Gtk.CellRendererCombo` can operate in two modes. It can be used with and without an associated :class:`Gtk.Entry` widget, depending on the value of the "has-entry" property. A :class:`Gtk.CellRendererPixbuf` can be used to render an image in a cell. It allows to render either a given :class:`Gdk.Pixbuf` (set via the "pixbuf" property) or a named icon (set via the "icon-name" property). A :class:`Gtk.CellRendererText` renders a given text in its cell, using the font, color and style information provided by its properties. The text will be ellipsized if it is too long and the "ellipsize" property allows it. As a :class:`Gtk.CellRendererToggle` can have two states, active and not active, you most likely want to bind the "active" property on the cell renderer to a boolean value in the model, thus causing the check button to reflect the state of the model. By default, text in :class:`Gtk.CellRendererText` widgets is not editable. This can be changed by setting the value of the "editable" property to ``True``: CellRendererCombo CellRendererPixbuf CellRendererProgress CellRendererSpin CellRendererText CellRendererToggle CellRenderers Example The combo cell renderer takes care of adding a text cell renderer to the combo box and sets it to display the column specified by its "text-column" property. The percentage value of the progress bar can be modified by changing the "value" property. Similar to :class:`Gtk.ProgressBar`, you can enable the *activity mode* by incrementing the "pulse" property instead of the "value" property. The range of the spinbutton is taken from the adjustment property of the cell renderer, which can be set explicitly or mapped to a column in the tree model, like all properties of cell renders. :class:`Gtk.CellRendererSpin` also has properties for the climb rate and the number of digits to display. You can then connect to the "edited" signal and update your :class:`Gtk.TreeModel` accordingly. Project-Id-Version: Python GTK+ 3 Tutorial 3.4
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
 :class:`Gtk.CellRendererAccel` :class:`Gtk.CellRendererCombo` :class:`Gtk.CellRendererCombo` renders text in a cell like :class:`Gtk.CellRendererText` from which it is derived. But while the latter offers a simple entry to edit the text, :class:`Gtk.CellRendererCombo` offers a :class:`Gtk.ComboBox` widget to edit the text. The values to display in the combo box are taken from the :class:`Gtk.TreeModel` specified in the "model" property. :class:`Gtk.CellRendererPixbuf` :class:`Gtk.CellRendererProgress` :class:`Gtk.CellRendererProgress` renders a numeric value as a progress bar in a cell. Additionally, it can display a text on top of the progress bar. :class:`Gtk.CellRendererSpin` :class:`Gtk.CellRendererSpin` renders text in a cell like :class:`Gtk.CellRendererText` from which it is derived. But while the latter offers a simple entry to edit the text, :class:`Gtk.CellRendererSpin` offers a :class:`Gtk.SpinButton` widget. Of course, that means that the text has to be parseable as a floating point number. :class:`Gtk.CellRendererSpinner` :class:`Gtk.CellRendererText` :class:`Gtk.CellRendererToggle` :class:`Gtk.CellRendererToggle` renders a toggle button in a cell. The button is drawn as a radio- or checkbutton, depending on the "radio" property. When activated, it emits the "toggled" signal. :class:`Gtk.CellRenderer` widgets are used to display information within widgets such as the :class:`Gtk.TreeView` or :class:`Gtk.ComboBox`. They work closely with the associated widgets and are very powerful, with lots of configuration options for displaying a large amount of data in different ways. There are seven :class:`Gtk.CellRenderer` widgets which can be used for different purposes: A :class:`Gtk.CellRendererCombo` can operate in two modes. It can be used with and without an associated :class:`Gtk.Entry` widget, depending on the value of the "has-entry" property. A :class:`Gtk.CellRendererPixbuf` can be used to render an image in a cell. It allows to render either a given :class:`Gdk.Pixbuf` (set via the "pixbuf" property) or a named icon (set via the "icon-name" property). A :class:`Gtk.CellRendererText` renders a given text in its cell, using the font, color and style information provided by its properties. The text will be ellipsized if it is too long and the "ellipsize" property allows it. As a :class:`Gtk.CellRendererToggle` can have two states, active and not active, you most likely want to bind the "active" property on the cell renderer to a boolean value in the model, thus causing the check button to reflect the state of the model. By default, text in :class:`Gtk.CellRendererText` widgets is not editable. This can be changed by setting the value of the "editable" property to ``True``: CellRendererCombo CellRendererPixbuf CellRendererProgress CellRendererSpin CellRendererText CellRendererToggle CellRenderers Example The combo cell renderer takes care of adding a text cell renderer to the combo box and sets it to display the column specified by its "text-column" property. The percentage value of the progress bar can be modified by changing the "value" property. Similar to :class:`Gtk.ProgressBar`, you can enable the *activity mode* by incrementing the "pulse" property instead of the "value" property. The range of the spinbutton is taken from the adjustment property of the cell renderer, which can be set explicitly or mapped to a column in the tree model, like all properties of cell renders. :class:`Gtk.CellRendererSpin` also has properties for the climb rate and the number of digits to display. You can then connect to the "edited" signal and update your :class:`Gtk.TreeModel` accordingly. 