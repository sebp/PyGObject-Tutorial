from gi.repository import Gtk

class AccelWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Accelerator Demo")
        self.set_border_width(10)

        vbox = Gtk.Box(spacing=6, orientation=Gtk.Orientation.VERTICAL)
        self.add(vbox)

        hbox = Gtk.Box(spacing=6)
        vbox.pack_start(hbox, True, True, 0)

        self.accel_group = Gtk.AccelGroup()
        self.add_accel_group(self.accel_group)

        button = Gtk.Button("Open")
        button.connect("clicked", self.on_open_clicked)
        self.bind_accelerator(button, '<Control>o')
        hbox.pack_start(button, True, True, 0)

        button = Gtk.Button("Close")
        button.connect("clicked", self.on_close_clicked)
        self.bind_accelerator(button, '<Control>w')
        hbox.pack_start(button, True, True, 0)

        button = Gtk.Button("New")
        button.connect("clicked", self.on_new_clicked)
        self.bind_accelerator(button, '<Control>n')
        hbox.pack_start(button, True, True, 0)

        desc = Gtk.Label((
            'The following accelerators have been added:\n\n'
            '<Control>o: Open:\n'
            '<Control>w: Close:\n'
            '<Control>n: New:'
        ))
        vbox.pack_start(desc, True, True, 0)

    def bind_accelerator(self, widget, accelerator, signal='clicked'):
        key, mod = Gtk.accelerator_parse(accelerator)
        widget.add_accelerator(signal, self.accel_group, key, mod, Gtk.AccelFlags.VISIBLE)

    def on_open_clicked(self, button):
        print("\"Open\" button was clicked")

    def on_close_clicked(self, button):
        print("\"Close\" button was clicked")

    def on_new_clicked(self, button):
        print("\"New\" button was clicked")

win = AccelWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
