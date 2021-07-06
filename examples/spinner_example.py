import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class SpinnerAnimation(Gtk.Window):
    def __init__(self):

        super().__init__(title="Spinner")
        self.set_border_width(3)
        self.connect("destroy", Gtk.main_quit)

        self.button = Gtk.ToggleButton(label="Start Spinning")
        self.button.connect("toggled", self.on_button_toggled)
        self.button.set_active(False)

        self.spinner = Gtk.Spinner()

        self.grid = Gtk.Grid()
        self.grid.add(self.button)
        self.grid.attach_next_to(
            self.spinner, self.button, Gtk.PositionType.BOTTOM, 1, 2
        )
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
