from gi.repository import Gtk

class CellRendererAccelWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="CellRendererAccel Example")

        self.set_default_size(200, 200)

        self.liststore = Gtk.ListStore(str, str)
        self.liststore.append(["Up", "Up"])
        self.liststore.append(["Down", "Down"])
        self.liststore.append(["Left", "Left"])
        self.liststore.append(["Right", "Right"])
        self.liststore.append(["Fire", "Return"])
        self.liststore.append(["Menu", "Escape"])

        treeview = Gtk.TreeView(model=self.liststore)

        renderer_text = Gtk.CellRendererText()
        column_text = Gtk.TreeViewColumn("Text", renderer_text, text=0)
        treeview.append_column(column_text)

        renderer_accel = Gtk.CellRendererAccel()
        renderer_accel.set_property("editable", True)
        renderer_accel.connect("accel-edited", self.on_accel_edited)
        renderer_accel.connect("accel-cleared", self.on_accel_cleared)

        column_accel = Gtk.TreeViewColumn("Accelerator", renderer_accel, text=1)
        treeview.append_column(column_accel)

        self.add(treeview)

    def on_accel_edited(self, widget, path, key, mods, hwcod):
        accel = Gtk.accelerator_name(key, mods)
        self.liststore[path][1] = accel

    def on_accel_cleared(self, widget, path):
        self.liststore[path][1] = None

win = CellRendererAccelWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
