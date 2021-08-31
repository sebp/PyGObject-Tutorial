import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, GLib


class SpinnerWindow(Gtk.Window):
    def __init__(self, *args, **kwargs):
        super().__init__(title="Spinner Demo")
        self.set_border_width(10)

        mainBox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.add(mainBox)

        self.spinner = Gtk.Spinner()
        mainBox.pack_start(self.spinner, True, True, 0)

        self.label = Gtk.Label()
        mainBox.pack_start(self.label, True, True, 0)

        self.entry = Gtk.Entry()
        self.entry.set_text("10")
        mainBox.pack_start(self.entry, True, True, 0)

        self.buttonStart = Gtk.Button(label="Start timer")
        self.buttonStart.connect("clicked", self.on_buttonStart_clicked)
        mainBox.pack_start(self.buttonStart, True, True, 0)

        self.buttonStop = Gtk.Button(label="Stop timer")
        self.buttonStop.set_sensitive(False)
        self.buttonStop.connect("clicked", self.on_buttonStop_clicked)
        mainBox.pack_start(self.buttonStop, True, True, 0)

        self.timeout_id = None
        self.connect("destroy", self.on_SpinnerWindow_destroy)

    def on_buttonStart_clicked(self, widget, *args):
        """ Handles "clicked" event of buttonStart. """
        self.start_timer()

    def on_buttonStop_clicked(self, widget, *args):
        """ Handles "clicked" event of buttonStop. """
        self.stop_timer("Stopped from button")

    def on_SpinnerWindow_destroy(self, widget, *args):
        """ Handles destroy event of main window. """
        # ensure the timeout function is stopped
        if self.timeout_id:
            GLib.source_remove(self.timeout_id)
            self.timeout_id = None
        Gtk.main_quit()

    def on_timeout(self, *args, **kwargs):
        """ A timeout function.

        Return True to stop it.
        This is not a precise timer since next timeout
        is recalculated based on the current time."""
        self.counter -= 1
        if self.counter <= 0:
            self.stop_timer("Reached time out")
            return False
        self.label.set_label("Remaining: " + str(int(self.counter / 4)))
        return True

    def start_timer(self):
        """ Start the timer. """
        self.buttonStart.set_sensitive(False)
        self.buttonStop.set_sensitive(True)
        # time out will check every 250 milliseconds (1/4 of a second)
        self.counter = 4 * int(self.entry.get_text())
        self.label.set_label("Remaining: " + str(int(self.counter / 4)))
        self.spinner.start()
        self.timeout_id = GLib.timeout_add(250, self.on_timeout, None)

    def stop_timer(self, alabeltext):
        """ Stop the timer. """
        if self.timeout_id:
            GLib.source_remove(self.timeout_id)
            self.timeout_id = None
        self.spinner.stop()
        self.buttonStart.set_sensitive(True)
        self.buttonStop.set_sensitive(False)
        self.label.set_label(alabeltext)


win = SpinnerWindow()
win.show_all()
Gtk.main()
