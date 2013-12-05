from gi.repository import Gtk
from os.path import join, exists
import re
import urllib
import sys

download_base_url = "http://developer.gnome.org/gtk3/stable/"
image_base_dir = join("images", "stock")

img_p = re.compile("fileref=\"(.+?)\"")
define_p = re.compile("\\s+")

def print_item(item, imgs):
    print "* :obj:`" + item + "`"
    print
    for img in imgs:
        if "-ltr" in img:
            print "    LTR variant:"
            print
        elif "-rtl" in img:
            print "    RTL variant:"
            print

        img_file = join(image_base_dir, img)
        if not exists(img_file):
            dl_url = download_base_url + img
            url = urllib.urlopen(dl_url)
            if url.getcode() == 200:
                urllib.urlretrieve(dl_url, img_file)
            else:
                print >> sys.stderr, "ERROR downloading file %s: %d" % (dl_url, url.getcode())

        print "    .. image:: ../" + img_file
        print

fp = file("/usr/include/gtk-3.0/gtk/gtkstock.h")
imgs = []
item = None
for line in fp:
    if "inlinegraphic" in line:
        if item != None:
            print_item(item, imgs)
            imgs = []
            item = None

        m = img_p.search(line)
        if m != None:
            imgs.append(m.group(1))
        else:
            print >> sys.stderr, "NO MATCH in line:", line

    if line.startswith("#define GTK_"):
        item = define_p.split(line)[1].replace("GTK_", "Gtk.")

fp.close()
