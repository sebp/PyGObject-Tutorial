��          �               �  V  �    4    Q  �  b     2  �  >     �  �   �  Q   �	  �   �	  �   a
     ^  �  g     U     t     }  o   �  
   
  �    �   �  }   �  $    �   8  �   �     �  �   �  �   T  �    {  �  I    5  b  �  �     �  �  �  (   \  �   �  V   6   �   �     !     "    "     ($     F$     O$  |   m$     �$  �  �$  �   �&  }   �'  h  (  �   |*  �   %+     ,  �   ,  �   �,   Although ASCII encoding is simple to apply it can only encode for 128 different characters which is hardly enough. One of the most commonly used encodings that addresses this problem is UTF-8 (it can handle any Unicode code point). UTF stands for "Unicode Transformation Format", and the '8' means that 8-bit numbers are used in the encoding. As a consequence, things are much cleaner and consistent with Python 3.x, because PyGObject will automatically encode/decode to/from UTF-8 if you pass a string to a method or a method returns a string. Strings, or *text*, will always be represented as instances of :class:`str` only:: As mentioned earlier, the representation of a string as a list of code points is abstract. In order to convert this abstract representation into a sequence of bytes the Unicode string must be **encoded**. The simplest form of encoding is ASCII and is performed as follows: Conceptional, a string is a list of characters such as 'A', 'B', 'C' or 'É'. **Characters** are abstract representations and their meaning depends on the language and context they are used in. The Unicode standard describes how characters are represented by **code points**. For example the characters above are represented with the code points U+0041, U+0042, U+0043, and U+00C9, respectively. Basically, code points are numbers in the range from 0 to 0x10FFFF. Definitions GTK+ uses UTF-8 encoded strings for all text. This means that if you call a method that returns a string you will always obtain an instance of the :class:`str` type. The same applies to methods that expect one or more strings as parameter, they must be UTF-8 encoded. However, for convenience PyGObject will automatically convert any :class:`unicode` instance to :class:`str` if supplied as argument:: How to Deal With Strings If the code point is 128 or greater, the Unicode string can't be represented in this encoding.  (Python raises a :exc:`UnicodeEncodeError` exception in this case.) If the code point is < 128, each byte is the same as the value of the code point. In addition, it is no longer possible to mix Unicode strings with encoded strings, because it will result in a :exc:`TypeError`:: Note the warning at the end. Although we called :meth:`Gtk.Label.set_text` with a :class:`unicode` instance as argument, :meth:`Gtk.Label.get_text` will always return a :class:`str` instance. Accordingly, ``txt`` and ``unicode_string`` are *not* equal. Python 2 Python 2 comes with two different kinds of objects that can be used to represent strings, :class:`str` and :class:`unicode`. Instances of the latter are used to express Unicode strings, whereas instances of the :class:`str` type are byte representations (the encoded string). Under the hood, Python represents Unicode strings as either 16- or 32-bit integers, depending on how the Python interpreter was compiled. Unicode strings can be converted to 8-bit strings with :meth:`unicode.encode`:: Python 2.x’s Unicode Support Python 3 Python 3.x's Unicode support Python’s 8-bit strings have a :meth:`str.decode` method that interprets the string using the given encoding:: References Since Python 3.0, all strings are stored as Unicode in an instance of the :class:`str` type. *Encoded* strings on the other hand are represented as binary data in the form of instances of the :class:`bytes` type. Conceptional, :class:`str` refers to *text*, whereas :class:`bytes` refers to *data*. Use :meth:`str.encode` to go from :class:`str` to :class:`bytes`, and :meth:`bytes.decode` to go from :class:`bytes` to :class:`str`. The `Unicode HOWTO <https://docs.python.org/howto/unicode.html>`_ discusses Python 2.x’s support for Unicode, and explains various problems that people commonly encounter when trying to work with Unicode. The `Unicode HOWTO for Python 3.x <https://docs.python.org/dev/howto/unicode.html>`_ discusses Unicode support in Python 3.x. This is especially important if you want to internationalize your program using `gettext <https://docs.python.org/library/gettext.html>`_. You have to make sure that gettext will return UTF-8 encoded 8-bit strings for all languages. In general it is recommended to not use :class:`unicode` objects in GTK+ applications at all and only use UTF-8 encoded :class:`str` objects since GTK+ does not fully integrate with :class:`unicode` objects. Otherwise, you would have to decode the return values to Unicode strings each time you call a GTK+ method:: This section explains how strings are represented in Python 2.x, Python 3.x and GTK+ and discusses common errors that arise when working with strings. Unfortunately, Python 2.x allows you to mix :class:`unicode` and :class:`str` if the 8-bit string happened to contain only 7-bit (ASCII) bytes, but would get :exc:`UnicodeDecodeError` if it contained non-ASCII values:: Unicode in GTK+ `UTF-8 encoding table and Unicode characters <http://www.utf8-chartable.de>`_ contains a list of Unicode code points and their respective UTF-8 encoding. `What's new in Python 3.0 <https://docs.python.org/py3k/whatsnew/3.0.html#text-vs-data-instead-of-unicode-vs-8-bit>`_ describes the new concepts that clearly distinguish between text and data. Project-Id-Version: Python GTK+ 3 Tutorial 3.4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-03-30 01:06-0300
PO-Revision-Date: 2018-03-30 02:28-0300
Last-Translator: Tomaz Cunha <tomazmcn@gmail.com>
Language: pt_BR
Language-Team: 
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 Embora a codificação ASCII seja simples de aplicar, ela só pode codificar 128 caracteres diferentes, o que não é suficiente. Uma das codificações mais usadas para resolver esse problema é o UTF-8 (ele pode manipular qualquer ponto de código Unicode). UTF significa "Formato de Transformação Unicode" e "8" significa que números de 8 bits são usados na codificação. Como consequência, as coisas são muito mais limpas e consistentes com o Python 3.x, porque o PyGObject irá automaticamente codificar/decodificar para/de UTF-8 se você passar uma string para um método ou um método retornar uma string. Strings, ou *text*, sempre serão representados como instâncias de :class:`str` apenas:: Como mencionado anteriormente, a representação de uma string como uma lista de pontos de código é abstrata. Para converter essa representação abstrata em uma sequência de bytes, a cadeia Unicode deve ser **codificada**. A forma mais simples de codificação é ASCII e é executada da seguinte maneira: Conceitual, uma string é uma lista de caracteres como 'A', 'B', 'C' ou 'É'. **Caracteres** são representações abstratas e seu significado depende do idioma e do contexto em que são usados. O padrão Unicode descreve como os caracteres são representados por **pontos de código**. Por exemplo, os caracteres acima são representados com os pontos de código U+0041, U+0042, U+0043 e U+00C9, respectivamente. Basicamente, os pontos de código são números no intervalo de 0 a 0x10FFFF. Definições O GTK+ usa strings codificadas em UTF-8 para todo o texto. Isto significa que se você chamar um método que retorna uma string, você sempre obterá uma instância do tipo :class:`str`. O mesmo se aplica aos métodos que esperam um ou mais strings como parâmetro, eles devem ser codificados em UTF-8. No entanto, por conveniência, o PyGObject converterá automaticamente qualquer instância :class:`unicode` para :class:`str` se fornecido como argumento:: Como Lidar com Sequências de Caracteres Se o ponto de código for 128 ou maior, a string Unicode não poderá ser representada nessa codificação. (Python dispara uma exceção :exc:`UnicodeEncodeError` neste caso.) Se o ponto de código for < 128, cada byte é o mesmo que o valor do ponto de código. Além disso, não é mais possível misturar strings Unicode com strings codificadas, porque resultará em um :exc:`TypeError`:: Observe o aviso no final. Apesar de chamarmos :meth:`Gtk.Label.set_text` com uma instância de :class:`unicode` como argumento, :meth:`Gtk.Label.get_text` sempre retornará uma instância :class:`str`. Assim, ``txt`` e ``unicode_string`` *não* são  iguais. Python 2 O Python 2 vem com dois tipos diferentes de objetos que podem ser usados para representar strings :class:`str` e :class:`unicode`. Instâncias do último são usadas para expressar cadeias Unicode, enquanto instâncias do tipo :class:`str` são representações de byte (a string codificada). Sob o capô, Python representa strings Unicode como números inteiros de 16 ou 32 bits, dependendo de como o interpretador Python foi compilado. Strings Unicode podem ser convertidas em strings de 8 bits com :meth:`unicode.encode`:: Suporte Unicode do Python 2.x Python 3 Suporte Unicode do Python 3.x As strings de 8 bits do Python têm um método :meth:`str.decode` que interpreta a string usando a codificação fornecida:: Referências Desde o Python 3.0, todas as strings são armazenadas como Unicode em uma instância do tipo :class:`str`. *Codificado* strings, por outro lado, são representados como dados binários na forma de instâncias do tipo :class:`bytes`. Conceitualmente, :class:`str` refere-se a *texto*, enquanto :class:`bytes` refere-se a *dados*. Use :meth:`str.encode` para ir de :class:`str` para :class:`bytes` e :meth:`bytes.decode` para ir de :class:`bytes` para :class:`str`. O `Unicode HOWTO <https://docs.python.org/howto/unicode.html>`_ aborda o suporte do Python 2.x para Unicode e explica vários problemas que as pessoas comumente encontram ao tentar trabalhar com o Unicode. O `Unicode HOWTO for Python 3.x <https://docs.python.org/dev/howto/unicode.html>`_ discute o suporte a Unicode no Python 3.x. Isto é especialmente importante se você quiser internacionalizar seu programa usando `gettext <https://docs.python.org/library/gettext.html>`_. Você precisa ter certeza de que gettext retornará sequências de 8 bits codificadas em UTF-8 para todos os idiomas. Em geral, recomenda-se não usar objetos :class:`unicode` em aplicações GTK+ e usar somente objetos codificados em UTF-8 :class:`str`, já que o GTK+ não se integra totalmente a objetos :class:`unicode`. Caso contrário, você teria que decodificar os valores de retorno para cadeias de caracteres Unicode cada vez que você chamar um método GTK+:: Esta seção explica como as cadeias de caracteres são representadas no Python 2.x, no Python 3.x e no GTK+ e discute erros comuns que surgem ao trabalhar com strings. Infelizmente, o Python 2.x permite que você misture :class:`unicode` e :class:`str` se a string de 8 bits contivesse apenas bytes de 7 bits (ASCII), mas obteria :exc:`UnicodeDecodeError` se contivesse valores não-ASCII: Unicode no GTK+ `A tabela de codificação UTF-8 e os caracteres Unicode <http://www.utf8-chartable.de>`_ contém uma lista de pontos de código Unicode e sua respectiva codificação UTF-8. `O que há de novo no Python 3.0 <https://docs.python.org/py3k/whatsnew/3.0.html#text-vs-data-instead-of-unicode-vs-8-bit>`_ descreve os novos conceitos que distinguir claramente entre texto e dados. 