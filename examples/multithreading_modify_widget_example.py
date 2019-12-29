import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, GLib
import time
import threading

def run_loop(source):
    for i in range(10):
        GLib.idle_add(source.set_text, str(i))
        time.sleep(0.2)
    GLib.idle_add(source.set_text,"Press me!")

def start_run_loop_thread(source):
    run_loop_thread = threading.Thread(target=run_loop, args=(source))
    run_loop_thread.start()


window = Gtk.Window(title="Hello World")

button = Gtk.Button.new_with_label("Press me!")

window.add(button)
window.show_all()

window.connect("destroy", Gtk.main_quit)
button.connect("clicked", start_run_loop_thread)
Gtk.main()