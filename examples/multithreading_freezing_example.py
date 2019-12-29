import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk
import time

def run_loop(source):
    for i in range(10):
        print(i)
        time.sleep(0.2)


window = Gtk.Window(title="Hello World")

button = Gtk.Button.new_with_label("Press me!")

window.add(button)
window.show_all()

window.connect("destroy", Gtk.main_quit)
button.connect("clicked", run_loop)
Gtk.main()