import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class PopoverWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="Popover Demo")
        self.set_border_width(10)
        self.set_default_size(300, 200)

        outerbox = Gtk.Box(spacing=6, orientation=Gtk.Orientation.VERTICAL)
        self.add(outerbox)

        self.popover = Gtk.Popover()
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        vbox.pack_start(Gtk.ModelButton(label="Item 1"), False, True, 10)
        vbox.pack_start(Gtk.Label(label="Item 2"), False, True, 10)
        vbox.show_all()
        self.popover.add(vbox)
        self.popover.set_position(Gtk.PositionType.BOTTOM)

        button = Gtk.MenuButton(label="Click Me", popover=self.popover)
        outerbox.pack_start(button, False, True, 0)


win = PopoverWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
