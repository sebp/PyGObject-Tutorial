import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class SpinnerAnimation(Gtk.Window):
    def __init__(self):

        Gtk.Window.__init__(self, title="Spinner")
        self.set_border_width(3)
        self.connect("destroy", Gtk.main_quit)

        self.button = Gtk.ToggleButton(label="Start Spinning")
        self.button.connect("toggled", self.on_button_toggled)
        self.button.set_active(False)

        self.spinner = Gtk.Spinner()

        self.grid = Gtk.Grid()
        self.grid.attach(self.button, 0, 0, 2, 1)
        self.grid.attach(self.spinner, 0, 1, 2, 1)
        self.grid.set_row_homogeneous(True)

        self.add(self.grid)
        self.show_all()

    def on_button_toggled(self, button):

        if button.get_active():
            self.spinner.start()
            self.button.set_label("Stop Spinning")

        else:
            self.spinner.stop()
            self.button.set_label("Start Spinning")


myspinner = SpinnerAnimation()

Gtk.main()
