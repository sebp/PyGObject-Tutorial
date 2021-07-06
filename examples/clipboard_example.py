import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk


class ClipboardWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="Clipboard Example")

        grid = Gtk.Grid()

        self.clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD)
        self.entry = Gtk.Entry()
        self.image = Gtk.Image.new_from_icon_name("process-stop", Gtk.IconSize.MENU)

        button_copy_text = Gtk.Button(label="Copy Text")
        button_paste_text = Gtk.Button(label="Paste Text")
        button_copy_image = Gtk.Button(label="Copy Image")
        button_paste_image = Gtk.Button(label="Paste Image")

        grid.add(self.entry)
        grid.attach(self.image, 0, 1, 1, 1)
        grid.attach(button_copy_text, 1, 0, 1, 1)
        grid.attach(button_paste_text, 2, 0, 1, 1)
        grid.attach(button_copy_image, 1, 1, 1, 1)
        grid.attach(button_paste_image, 2, 1, 1, 1)

        button_copy_text.connect("clicked", self.copy_text)
        button_paste_text.connect("clicked", self.paste_text)
        button_copy_image.connect("clicked", self.copy_image)
        button_paste_image.connect("clicked", self.paste_image)

        self.add(grid)

    def copy_text(self, widget):
        self.clipboard.set_text(self.entry.get_text(), -1)

    def paste_text(self, widget):
        text = self.clipboard.wait_for_text()
        if text is not None:
            self.entry.set_text(text)
        else:
            print("No text on the clipboard.")

    def copy_image(self, widget):
        if self.image.get_storage_type() == Gtk.ImageType.PIXBUF:
            self.clipboard.set_image(self.image.get_pixbuf())
        else:
            print("No image has been pasted yet.")

    def paste_image(self, widget):
        image = self.clipboard.wait_for_image()
        if image is not None:
            self.image.set_from_pixbuf(image)


win = ClipboardWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
