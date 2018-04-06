��    A      $  Y   ,      �  �   �  n  �  :   �  .  8  �   g	  R  8
     �     �  q   �  |  &  }   �    !  [   A  �   �  ;   O     �  =   �  <   �  =   #  �   a  ~   �  �   c  �     `   �      i    
   �  x  �  �        �     �     �  (   �     �  :        ;  �   I  K   ,  P  x  �   �  �   a  �   �  F   �  #   �  �     &   �     �        �   )   U   !  �   j!  �   "  `   �"  �   $#  ^   �#  �   $  �   %     �%     �%  �   �%  X   �&  h   �&      P'  �   q'  �  (  �   �)  �  �*  ?   ,  L  _,  �   �-  �  �.     E0     ]0  o   o0  |  �0  �   \2  =  �2  W   4  �   u4  6   5     P5  L   j5  K   �5  L   6     P6  ~   �6  �   O7  �   �7  e   �8    �8  ~  :     �;  �  �;  �   {=     >  !   >     =>  5   Q>     �>  A   �>  4  �>  �   @  X   �@  r  VA  �   �B  �   xC  �   �C  R   �D      	E  �   *E  &   �E     "F     =F  �   YF  R   QG  �   �G  �   QH  s   I  �   vI  c   J  �   {J  �   cK     @L     \L  �   qL  `   M  y   vM  )   �M  �   N        ?           -   .         /          "   3   
                    5                 &              ;          0      2       7   A   	   )           6             $         ,                 @      +                  =         (   9      '              :       >   8   %   !      <   1          4       #   *              :const:`GObject.SIGNAL_RUN_FIRST` can be replaced with :const:`GObject.SIGNAL_RUN_LAST` or :const:`GObject.SIGNAL_RUN_CLEANUP`. ``None`` is the return type of the signal. ``(int,)`` is the list of the parameters of the signal, it must end with a comma. :const:`GObject.SIGNAL_RUN_FIRST` indicates that this signal will invoke the object method handler (:meth:`do_my_signal` here) in the first emission stage. Alternatives are :const:`GObject.SIGNAL_RUN_LAST` (the method handler will be invoked in the third emission stage) and :const:`GObject.SIGNAL_RUN_CLEANUP` (invoke the method handler in the last emission stage). A dictionary where inherited class can define new signals. A native GObject is accessible via :class:`GObject.GObject`. It is rarely instantiated directly, we generally use inherited class. A :class:`Gtk.Widget` is an inherited class of a :class:`GObject.GObject`. It may be interesting to make an inherited class to create a new widget, like a settings dialog. A property is defined with a name and a type. Even if Python itself is dynamically typed, you can't change the type of a property once it is defined. A property can be created using :class:`GObject.Property`. Blocks a handler of an instance so it will not be called during any signal emissions unless :meth:`handler_unblock` is called for that *handler_id*. Thus "blocking" a signal handler means to temporarily deactivate it, a signal handler has to be unblocked exactly the same amount of times it has been blocked before to become active again. Create new properties Create new signals Each element in the dictionary is a new signal. The key is the signal name. The value is a tuple, with the form:: Each signal is registered in the type system together with the type on which it can be emitted: users of the type are said to connect to the signal on a given type instance when they register a function to be invoked upon the signal emission. Users can also emit the signal by themselves or stop the emission of the signal from within one of the functions connected to the signal. Emit signal *signal_name*. Signal arguments must follow, e.g. if your signal is of type ``(int,)``, it must be emitted with:: GObject is the fundamental type providing the common attributes and methods for all object types in GTK+, Pango and other libraries based on GObject. The :class:`GObject.GObject` class provides methods for object construction and destruction, property access methods, and signal support. If the type is ``bool`` or ``str``, the forth element is the default value of the property. If the type is ``int`` or ``float``, the forth element is the minimum accepted value, the fifth element is the maximum accepted value and the sixth element is the default value. If the type is not one of these, there is no extra element. Inherit from GObject.GObject Invoke the object method handler in the first emission stage. Invoke the object method handler in the last emission stage. Invoke the object method handler in the third emission stage. It is recommended to not call :meth:`handler_unblock` explicitly but use :meth:`handler_block` together with the *with* statement. It is recommended to not call :meth:`thaw_notify` explicitly but use :meth:`freeze_notify` together with the *with* statement. It is recommended to use :meth:`handler_block` in conjunction with the *with* statement which will call :meth:`handler_unblock` implicitly at the end of the block:: It recommended to use the *with* statement when calling :meth:`freeze_notify`, that way it is ensured that :meth:`thaw_notify` is called implicitly at the end of the block:: New signals can be created by adding them to :attr:`GObject.GObject.__gsignals__`, a dictionary: Note that you have to use the canonical property name when connecting to the notify signals, as explained in :func:`GObject.Object.signals.notify`. For instance, for a Python property `foo_bar_baz` you would connect to the signal `notify::foo-bar-baz` using One of GObject's nice features is its generic get/set mechanism for object properties. Each class inherited from :class:`GObject.GObject` can define new properties. Each property has a type which never changes (e.g. str, float, int...). For instance, they are used for :class:`Gtk.Button` where there is a "label" property which contains the text of the button. Properties Properties can also be read-only, if you want some properties to be readable but not writable. To do so, you can add some flags to the property definition, to control read/write access. Flags are :const:`GObject.ParamFlags.READABLE` (only read access for external code), :const:`GObject.ParamFlags.WRITABLE` (only write access), :const:`GObject.ParamFlags.READWRITE` (public): Properties must be defined in :attr:`GObject.GObject.__gproperties__`, a dictionary, and handled in do_get_property and do_set_property. Receive signals Retrieves a property value. See :ref:`signals` Set property *property_name* to *value*. Signals Signals can be emitted using :meth:`GObject.GObject.emit`: Signals connect arbitrary application-specific events with any number of listeners. For example, in GTK+, every user event (keystroke or mouse move) is received from the X server and generates a GTK+ event under the form of a signal emission on a given object instance. Some properties also have functions dedicated to them, called getter and setter. For the property "label" of a button, there are two functions to get and set them, :func:`Gtk.Button.get_label` and :func:`Gtk.Button.set_label`. Thaw all the "notify::" signals which were thawed by :meth:`freeze_notify`. The :attr:`__gproperties__` dictionary is a class property where you define the properties of your object. This is not the recommend way to define new properties, the method written above is much less verbose. The benefits of this method is that a property can be defined with more settings, like the minimum or the maximum for numbers. The API of :class:`GObject.Property` is similar to the builtin :py:func:`property`. You can create property setter in a way similar to Python property: The absolute length of the tuple depends on the property type (the first element of the tuple). Thus we have the following situations: The class :class:`GObject.GObject` provides several useful functions to manage existing properties, :func:`GObject.GObject.get_property` and :func:`GObject.GObject.set_property`. The first element is the property's type (e.g. ``int``, ``float``...). The key is the name of the property The last one (which is not necessarily the forth one as we will see later) is the property's flags: :const:`GObject.PARAM_READABLE`, :const:`GObject.PARAM_WRITABLE`, :const:`GObject.PARAM_READWRITE`. The property is readable and writable. The property is readable. The property is writable. The second element is the property's nick name, which is a string with a short description of the property. This is generally used by programs with strong introspection capabilities, like the graphical user interface builder `Glade`_. The second part, ``None``, indicates the return type of the signal, usually ``None``. The third one is the property's description or blurb, which is another string with a longer description of the property. Also used by `Glade`_ and similar programs. The value is a tuple which describe the property. The number of elements of this tuple depends on its first element but the tuple will always contain at least the following items: There is also a way to define minimum and maximum values for numbers, using a more verbose form: This method freezes all the "notify::" signals (which are emitted when any property is changed) until the :meth:`thaw_notify` method is called. This section will introduce some important aspects about the GObject implementation in Python. To inherit from :class:`GObject.GObject`, you must call :meth:`GObject.GObject.__init__` in your constructor (if the class inherits from :class:`Gtk.Button`, it must call :func:`Gtk.Button.__init__` for instance), like in the example below: Undoes the effect of :meth:`handler_block`. A blocked handler is skipped during signal emissions and will not be invoked until it has been unblocked exactly the amount of times it has been blocked before. Use existing properties Watch properties When a new signal is created, a method handler can also be defined, it will be called each time the signal is emitted. It is called do_signal_name. When a property is modified, a signal is emitted, whose name is "notify::property-name": You can also define new read-only properties with a new method decorated with :class:`GObject.Property`: You can get this property using: ``(int,)`` indicates the signal arguments, here, the signal will only take one argument, whose type is int. This argument type list must end with a comma. Project-Id-Version: Python GTK+ 3 Tutorial 3.4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-04-05 18:20-0300
PO-Revision-Date: 2018-04-06 05:23-0300
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 1.8.11
Last-Translator: Tomaz Cunha <tomazmcn@gmail.com>
Plural-Forms: nplurals=2; plural=(n > 1);
Language: pt_BR
 :const:`GObject.SIGNAL_RUN_FIRST` pode ser substituído por :const:`GObject.SIGNAL_RUN_LAST` ou :const:`GObject.SIGNAL_RUN_CLEANUP`. ``None`` é o tipo de retorno do sinal. ``(int,)`` é a lista dos parâmetros do sinal, deve terminar com uma vírgula. :const:`GObject.SIGNAL_RUN_FIRST` indica que este sinal invocará o manipulador do método de objeto (:meth:`do_my_signal` aqui) no primeiro estágio de emissão. As alternativas são :const:`GObject.SIGNAL_RUN_LAST` (o manipulador de método será invocado no terceiro estágio de emissão) e :const:`GObject.SIGNAL_RUN_CLEANUP` (invoca o manipulador de método no último estágio de emissão). Um dicionário onde a classe herdada pode definir novos sinais. Um GObject nativo é acessível via :class:`GObject.GObject`. É raramente instanciado diretamente, geralmente usamos classes herdadas. A :class:`Gtk.Widget` é uma classe herdada de um :class:`GObject.GObject`. Pode ser interessante criar uma classe herdada para criar um novo widget, como uma caixa de diálogo de configurações. Uma propriedade é definida com um nome e um tipo. Mesmo se o próprio Python for digitado dinamicamente, você não poderá alterar o tipo de uma propriedade depois que ela for definida. Uma propriedade pode ser criada usando :class:`GObject.Property`. Bloqueia um manipulador de uma instância para que ele não seja chamado durante qualquer emissão de sinal, a menos que :meth:`handler_unblock` seja chamado para aquele *handler_id*. Assim, "bloqueando" um manipulador de sinal significa desativá-lo temporariamente, um manipulador de sinal precisa ser desbloqueado exatamente na mesma quantidade de vezes que foi bloqueado antes de se tornar ativo novamente. Crie novas propriedades Crie novos sinais Cada elemento no dicionário é um novo sinal. A chave é o nome do sinal. O valor é uma tupla, com o formato: Cada sinal é registrado no sistema de tipos junto com o tipo no qual ele pode ser emitido: os usuários do tipo são conectados ao sinal em uma determinada instância de tipo quando registram uma função a ser invocada na emissão do sinal. Os usuários também podem emitir o sinal sozinhos ou interromper a emissão do sinal de dentro de uma das funções conectadas ao sinal. Emitir sinal *signal_name*. Argumentos de sinal devem seguir, por ex. se o seu sinal é do tipo ``(int,)``, deve ser emitido com:: O GObject é o tipo fundamental que fornece os atributos e métodos comuns para todos os tipos de objeto no GTK+, no Pango e em outras bibliotecas baseadas no GObject. A classe :class:`GObject.GObject` fornece métodos para construção e destruição de objetos, métodos de acesso a propriedades e suporte a sinais. Se o tipo for ``bool`` ou ``str``, o quarto elemento é o valor padrão da propriedade. Se o tipo for ``int`` ou ``float``, o quarto elemento é o valor mínimo aceito, o quinto elemento é o valor máximo aceito e o sexto elemento é o valor padrão. Se o tipo não for um desses, não há elemento extra. Herdar de GObject.GObject Invoque o manipulador de método de objeto no primeiro estágio de emissão. Invoque o manipulador do método de objeto no último estágio de emissão. Invoque o manipulador de método de objeto no terceiro estágio de emissão. É recomendado não chamar explicitamente :meth:`handler_unblock` mas use :meth:`handler_block` junto com a instrução *with*. Recomenda-se não chamar :meth:`thaw_notify` explicitamente mas use :meth:`freeze_notify` juntamente com a instrução *with*. Recomenda-se usar :meth:`handler_block` em conjunto com a instrução *with* que irá chamar :meth:`handler_unblock` implicitamente no final do bloco:: Recomenda-se usar a instrução *with* ao chamar :meth:`freeze_notify`, dessa forma é assegurado que :meth:`thaw_notify` é chamado implicitamente no final do bloco:: Novos sinais podem ser criados adicionando-os a :attr:`GObject.GObject.__gsignals__`, um dicionário: Note que você tem que usar o nome da propriedade canônica ao se conectar aos sinais de notificação, como explicado em :func:`GObject.Object.signals.notify`. Por exemplo, para uma propriedade Python `foo_bar_baz` você conectaria ao sinal `notify::foo-bar-baz` usando Um dos ótimos recursos do GObject é seu mecanismo get/set genérico para propriedades de objetos. Cada classe herdada de :class:`GObject.GObject` pode definir novas propriedades. Cada propriedade tem um tipo que nunca muda (por exemplo, str, float, int ...). Por exemplo, eles são usados para :class:`Gtk.Button` onde existe uma propriedade "label" que contém o texto do botão. Propriedades As propriedades também podem ser somente leitura, se você quiser que algumas propriedades sejam legíveis, mas não graváveis. Para fazer isso, você pode adicionar alguns sinalizadores à definição da propriedade, para controlar o acesso de leitura/gravação. Sinalizadores são :const:`GObject.ParamFlags.READABLE` (somente acesso de leitura para código externo), :const:`GObject.ParamFlags.WRITABLE` (somente acesso de gravação), :const:`GObject.ParamFlags.READWRITE` (publico): As propriedades devem ser definidas em :attr:`GObject.GObject.__gproperties__`, um dicionário e manipulado em do_get_property e do_set_property. Receba sinais Recupera um valor de propriedade. Veja :ref:`signals` Configure a propriedade *property_name* para *valor*. Sinais Os sinais podem ser emitidos usando :meth:`GObject.GObject.emit`: Os sinais conectam eventos específicos de aplicativos arbitrários com qualquer número de ouvintes. Por exemplo, no GTK+, cada evento de usuário (pressionamento de tecla ou mouse) é recebido do servidor X e gera um evento GTK+ sob a forma de uma emissão de sinal em uma determinada instância de objeto. Algumas propriedades também possuem funções dedicadas a elas, chamadas de getter e setter. Para a propriedade "label" de um botão, existem duas funções para obter e configurá-las, :func:`Gtk.Button.get_label` e :func:`Gtk.Button.set_label`. Descongele todos os sinais "notify::" que foram descongelados por :meth:`freeze_notify`. O dicionário :attr:`__gproperties__` é uma propriedade de classe onde você define as propriedades do seu objeto. Esta não é a maneira recomendada de definir novas propriedades, o método escrito acima é muito menos detalhado. Os benefícios desse método é que uma propriedade pode ser definida com mais configurações, como o mínimo ou o máximo para números. A API de :class:`GObject.Property` é semelhante ao construído em :py:func:`property`. Você pode criar o setter de propriedades de maneira semelhante à propriedade Python: O comprimento absoluto da tupla depende do tipo de propriedade (o primeiro elemento da tupla). Assim, temos as seguintes situações: A classe :class:`GObject.GObject` fornece várias funções úteis para gerenciar propriedades existentes, :func:`GObject.GObject.get_property` e :func:`GObject.GObject.set_property`. O primeiro elemento é o tipo da propriedade (por exemplo, ``int``, ``float``...). A chave é o nome da propriedade O último (que não é necessariamente o último, como veremos mais adiante) é o sinalizador da propriedade :const:`GObject.PARAM_READABLE`, :const:`GObject.PARAM_WRITABLE`, :const:`GObject.PARAM_READWRITE`. A propriedade é legível e gravável. A propriedade é legível. A propriedade é gravável. O segundo elemento é o apelido da propriedade, que é uma string com uma breve descrição da propriedade. Isso geralmente é usado por programas com fortes recursos de introspecção, como o construtor de interface gráfica de usuário `Glade`_. A segunda parte, ``None``, indica o tipo de retorno do sinal, geralmente ``None``. A terceira é a descrição da propriedade ou sinopse, que é outra string com uma descrição mais longa da propriedade. Também usado pelo `Glade`_ e programas similares. O valor é uma tupla que descreve a propriedade. O número de elementos dessa tupla depende de seu primeiro elemento, mas a tupla sempre conterá pelo menos os seguintes itens: Há também uma maneira de definir valores mínimos e máximos para números, usando um formulário mais detalhado: Este método congela todos os sinais "notify::" (que são emitidos quando qualquer propriedade é alterada) até que o método :meth:`thaw_notify` seja chamado. Esta seção apresentará alguns aspectos importantes sobre a implementação do GObject no Python. Para herdar de :class:`GObject.GObject`, você deve chamar :meth:`GObject.GObject.__init__` em seu construtor (se a classe herdar de :class:`Gtk.Button`, deve chamar :func:`Gtk.Button.__init__` por exemplo), como no exemplo abaixo: Desfaz o efeito de :meth:`handler_block`. Um manipulador bloqueado é ignorado durante as emissões do sinal e não será chamado até que tenha sido desbloqueado exatamente a quantidade de vezes que foi bloqueado antes. Use propriedades existentes Veja as propriedades Quando um novo sinal é criado, um manipulador de método também pode ser definido, ele será chamado toda vez que o sinal for emitido. É chamado do_signal_name. Quando uma propriedade é modificada, um sinal é emitido, cujo nome é "notify::property-name": Você também pode definir novas propriedades somente leitura com um novo método decorado com :class:`GObject.Property`: Você pode obter essa propriedade usando: ``(int,)`` indica os argumentos do sinal, aqui, o sinal só receberá um argumento, cujo tipo é int. Essa lista de tipos de argumentos deve terminar com uma vírgula. 