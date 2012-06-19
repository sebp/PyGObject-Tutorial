How to Deal With Strings
========================

This section explains how strings are represented in Python 2.x, Python 3.x
and GTK+ and discusses common errors that arise when working with strings.

Definitions
-----------
Conceptionally, a string is a list of characters such as
'A', 'B', 'C' or 'É'. **Characters** are abstract representations and their meaning
depends on the language and context they are used in.
The Unicode standard describes how characters are represented by **code points**.
For example the characters above are represented with the code points
U+0041, U+0042, U+0043, and U+00C9, respectively. Basically, code points are
numbers in the range from 0 to 0x10FFFF.

As mentioned earlier, the representation of a string as a list of code points
is abstract. In order to convert this abstract representation into a sequence
of bytes the Unicode string must be **encoded**. The simplest from of encoding
is ASCII and is performed as follows:

1. If the code point is < 128, each byte is the same as the value of the code
   point.

2. If the code point is 128 or greater, the Unicode string can't be represented
   in this encoding.  (Python raises a :exc:`UnicodeEncodeError` exception in this
   case.)

Although ASCII encoding is simple to apply it can only encode for 128 different
characters which is hardly enough. One of the most commonly used encodings that
addresses this problem is UTF-8 (it can handle any Unicode code point).
UTF stands for "Unicode Transformation Format", and the '8' means that 8-bit
numbers are used in the encoding.


Python 2
--------

Python 2.x’s Unicode Support
++++++++++++++++++++++++++++
Python 2 comes with two different kinds of objects that can be used to represent strings,
:class:`str` and :class:`unicode`.
Instances of the latter are used to express Unicode strings, whereas instances of
the :class:`str` type are byte representations (the encoded string).
Under the hood, Python represents Unicode strings as either 16-
or 32-bit integers, depending on how the Python interpreter was compiled.
Unicode strings can be converted to 8-bit strings
with :meth:`unicode.encode`::

	>>> unicode_string = u"Fu\u00dfb\u00e4lle"
	>>> print unicode_string
	Fußbälle
	>>> type(unicode_string)
	<type 'unicode'>
	>>> unicode_string.encode("utf-8")
	'Fu\xc3\x9fb\xc3\xa4lle'

Python’s 8-bit strings have a :meth:`str.decode` method that
interprets the string using the given encoding::

	>>> utf8_string = unicode_string.encode("utf-8")
	>>> type(utf8_string)
	<type 'str'>
	>>> u2 = utf8_string.decode("utf-8")
	>>> unicode_string == u2
	True

Unfortunately, Python 2.x allows you to mix :class:`unicode` and :class:`str`
if the 8-bit string happened to contain only 7-bit (ASCII) bytes, but would
get :exc:`UnicodeDecodeError` if it contained non-ASCII values::

	>>> utf8_string = " sind rund"
	>>> unicode_string + utf8_string
	u'Fu\xdfb\xe4lle sind rund'
	>>> utf8_string = " k\xc3\xb6nnten rund sein"
	>>> print utf8_string
	 könnten rund sein
	>>> unicode_string + utf8_string
	Traceback (most recent call last):
	  File "<stdin>", line 1, in <module>
	UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 2: ordinal not in range(128)

Unicode in GTK+
+++++++++++++++
GTK+ uses UTF-8 encoded strings for all text. This means that if you call a
method that returns a string you will always obtain an instance of the :class:`str`
type. The same applies to methods that expect one or more strings as parameter,
they must be UTF-8 encoded. However, for convenience PyGObject will automatically
convert any :class:`unicode` instance to :class:`str` if supplied as argument::

	>>> from gi.repository import Gtk
	>>> label = Gtk.Label()
	>>> unicode_string = u"Fu\u00dfb\u00e4lle"
	>>> label.set_text(unicode_string)
	>>> txt = label.get_text()
	>>> type(txt), txt
	(<type 'str'>, 'Fu\xc3\x9fb\xc3\xa4lle')
	>>> txt == unicode_string
	__main__:1: UnicodeWarning: Unicode equal comparison failed to convert both arguments to Unicode - interpreting them as being unequal
	False

Note the warning at the end. Although we called :meth:`Gtk.Label.set_text` with
a :class:`unicode` instance as argument, :meth:`Gtk.Label.get_text` will always
return a :class:`str` instance. Accordingly, ``txt`` and ``unicode_string`` are
*not* equal.

This is especially important if you want to internationalize your
program using `gettext <http://docs.python.org/library/gettext.html>`_. You
have to make sure that gettext will return UTF-8 encoded 8-bit strings for all
languages. In general it is recommended to not use :class:`unicode` objects
in GTK+ applications at all and only use UTF-8 encoded :class:`str` objects since
GTK+ does not fully integrate with :class:`unicode` objects. Otherwise, you would
have to decode the return values to Unicode strings each time you call a GTK+ method::

	>>> txt = label.get_text().decode("utf-8")
	>>> txt == unicode_string
	True

Python 3
--------

Python 3.x's Unicode support
++++++++++++++++++++++++++++
Since Python 3.0, all strings are stored as Unicode in an instance of the
:class:`str` type. *Encoded* strings on the other hand are represented as
binary data in the form of instances of the :class:`bytes` type.
Conceptionally, :class:`str` refers to *text*, whereas :class:`bytes` refers to
*data*. Use :meth:`str.encode` to go from :class:`str` to :class:`bytes`, and
:meth:`bytes.decode` to go from :class:`bytes` to :class:`str`.

In addition, it is no longer possible to mix Unicode strings with encoded strings,
because it will result in a :exc:`TypeError`::

	>>> text = "Fu\u00dfb\u00e4lle"
	>>> data = b" sind rund"
	>>> text + data
	Traceback (most recent call last):
	  File "<stdin>", line 1, in <module>
	TypeError: Can't convert 'bytes' object to str implicitly
	>>> text + data.decode("utf-8")
	'Fußbälle sind rund'
	>>> text.encode("utf-8") + data
	b'Fu\xc3\x9fb\xc3\xa4lle sind rund'

Unicode in GTK+
+++++++++++++++
As a consequence, things are much cleaner and consistent with Python 3.x, because
PyGObject will automatically encode/decode to/from UTF-8 if you pass a string to
a method or a method returns a string. Strings, or *text*, will always be represented
as instances of :class:`str` only::

	>>> from gi.repository import Gtk
	>>> label = Gtk.Label()
	>>> text = "Fu\u00dfb\u00e4lle"
	>>> label.set_text(text)
	>>> txt = label.get_text()
	>>> type(txt), txt
	(<class 'str'>, 'Fußbälle')
	>>> txt == text
	True

References
----------
`What's new in Python 3.0 <http://docs.python.org/py3k/whatsnew/3.0.html#text-vs-data-instead-of-unicode-vs-8-bit>`_
describes the new concepts that clearly distinguish between text and data.

The `Unicode HOWTO <http://docs.python.org/howto/unicode.html>`_ discusses Python 2.x’s
support for Unicode, and explains various problems that people commonly encounter
when trying to work with Unicode.

The `Unicode HOWTO for Python 3.x <http://docs.python.org/dev/howto/unicode.html>`_
discusses Unicode support in Python 3.x.

`UTF-8 encoding table and Unicode characters <http://www.utf8-chartable.de>`_ contains
a list of Unicode code points and their respective UTF-8 encoding.
