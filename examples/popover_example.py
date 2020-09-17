import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class PopoverWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Popover Demo")
        self.set_border_width(10)
        self.set_default_size(300, 200)

        outerbox = Gtk.Box(spacing=6, orientation=Gtk.Orientation.VERTICAL)
        self.add(outerbox)

        button = Gtk.Button.new_with_label("Click Me")
        button.connect("clicked", self.on_click_me_clicked)
        outerbox.pack_start(button, False, True, 0)

        self.popover = Gtk.Popover()
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        vbox.pack_start(Gtk.ModelButton(label="Item 1"), False, True, 10)
        vbox.pack_start(Gtk.Label(label="Item 2"), False, True, 10)
        self.popover.add(vbox)
        self.popover.set_position(Gtk.PositionType.BOTTOM)

    def on_click_me_clicked(self, button):
        self.popover.set_relative_to(button)
        self.popover.show_all()
        self.popover.popup()


win = PopoverWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
