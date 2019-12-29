import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk
import time
import threading

def run_loop():
    for i in range(10):
        print(i)
        time.sleep(0.2)

def start_run_loop_thread(source):
    run_loop_thread = threading.Thread(target=run_loop)
    run_loop_thread.start()


window = Gtk.Window(title="Hello World")

button = Gtk.Button.new_with_label("Press me!")

window.add(button)
window.show_all()

window.connect("destroy", Gtk.main_quit)
button.connect("clicked", start_run_loop_thread)
Gtk.main()