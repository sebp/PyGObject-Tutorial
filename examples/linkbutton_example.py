import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class LinkButtonWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="LinkButton Demo")
        self.set_border_width(10)

        button = Gtk.LinkButton.new_with_label(
            uri="https://www.gtk.org",
            label="Visit GTK+ Homepage"
        )
        self.add(button)


win = LinkButtonWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
