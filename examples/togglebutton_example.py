import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class ToggleButtonWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="ToggleButton Demo")
        self.set_border_width(10)

        hbox = Gtk.Box(spacing=6)
        self.add(hbox)

        button = Gtk.ToggleButton(label="Button 1")
        button.connect("toggled", self.on_button_toggled, "1")
        hbox.pack_start(button, True, True, 0)

        button = Gtk.ToggleButton(label="B_utton 2", use_underline=True)
        button.set_active(True)
        button.connect("toggled", self.on_button_toggled, "2")
        hbox.pack_start(button, True, True, 0)

    def on_button_toggled(self, button, name):
        state = "on" if button.get_active() else "off"
        print("Button", name, "was turned", state)


win = ToggleButtonWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
