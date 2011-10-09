from gi.repository import Gtk

class DialogExample(Gtk.Dialog):

    def __init__(self, parent):
        Gtk.Dialog.__init__(self, "My Dialog", parent, 0,
            (Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
             Gtk.STOCK_OK, Gtk.ResponseType.OK))

        self.set_default_size(150, 100)

        label = Gtk.Label("This is a dialog to display additional information")

        box = self.get_content_area()
        box.add(label)
        self.show_all()

class DialogWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Dialog Example")

        self.set_border_width(6)

        button = Gtk.Button("Open dialog")
        button.connect("clicked", self.on_button_clicked)

        self.add(button)

    def on_button_clicked(self, widget):
        dialog = DialogExample(self)
        response = dialog.run()

        if response == Gtk.ResponseType.OK:
            print "The OK button was clicked"
        elif response == Gtk.ResponseType.CANCEL:
            print "The Cancel button was clicked"

        dialog.destroy()

win = DialogWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
