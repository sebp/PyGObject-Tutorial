import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


@Gtk.Template(filename="template_example.ui")
class Window1(Gtk.Window):
    __gtype_name__ = "window1"

    @Gtk.Template.Callback()
    def onDestroy(self, *args):
        Gtk.main_quit()

    @Gtk.Template.Callback()
    def onButtonPressed(self, button):
        print("Hello World!")


window = Window1()
window.show()

Gtk.main()
