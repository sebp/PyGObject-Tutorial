import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gio

MENU_XML="""
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <menu id="app-menu">
    <section>
      <item>
        <attribute name="label">Keyboard Shortcuts</attribute>
        <attribute name="action">app.show-help-overlay</attribute>
      </item>
      <item>
        <attribute name="label">Help</attribute>
        <attribute name="action">app.help</attribute>
      </item>
      <item>
        <attribute name="label">About</attribute>
        <attribute name="action">app.about</attribute>
      </item>
    </section>
  </menu>
</interface>
"""

class PopoverExample(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Popover Demo")
        self.set_border_width(10)

        outerbox = Gtk.Box(spacing=6, orientation = Gtk.Orientation.VERTICAL)
        self.add(outerbox)

        button = Gtk.Button.new_with_label("Click Me")
        button.connect("clicked", self.on_click_me_clicked)
        outerbox.pack_start(button, False, True, 0)

        builder = Gtk.Builder.new_from_string(MENU_XML, -1)
        menu = builder.get_object("app-menu")

        self.popover = Gtk.Popover.new_from_model(button, menu)
        self.popover.set_position(Gtk.PositionType.BOTTOM)

        cut_action = Gio.SimpleAction.new("app.cut", None)
        cut_action.connect("activate", self.on_cut_action)

    def on_click_me_clicked(self, button):
        self.popover.popup()

    def on_cut_action(self, action, param):
        print("hi there!")

win = PopoverExample()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
