import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class ExpanderExample(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Expander Demo")

        self.set_size_request(350, 100)

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.add(vbox)

        text_expander = Gtk.Expander(label="This expander displays additional information")
        text_expander.set_expanded(True)
        text_expander.connect('activate', self.on_expand)
        vbox.add(text_expander)

        msg = """
This message is quite long, complicated even:
    - It has a list with a sublist:
        - of 3 elements;
        - taking several lines;
        - with indentation.
"""
        details = Gtk.Label(label=msg)
        text_expander.add(details)

        widget_expander = Gtk.Expander(label="Expand for more controls")
        widget_expander.connect('activate', self.on_expand)
        vbox.add(widget_expander)

        expander_hbox = Gtk.HBox()
        widget_expander.add(expander_hbox)

        expander_hbox.add(Gtk.Label(label="Text message"))
        expander_hbox.add(Gtk.Button(label="Click me"))

        self.expanders = [text_expander, widget_expander]

        self.show_all()

    def on_expand(self, expander):
        text_expander, widget_expander = self.expanders
        if expander == text_expander:
            widget_expander.set_expanded(False)
        else:
            text_expander.set_expanded(False)


win = ExpanderExample()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
