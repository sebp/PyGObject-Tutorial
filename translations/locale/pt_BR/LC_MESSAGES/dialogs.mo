��          �   %   �      @  �  A  ~   �  "  q  �   �  I   s  L   �    
  9  #  �  ]	     �
  �       �  %  �       8    �   Q  �   1  V   "  �   y  �   y  �   5  `   �  W   M  �   �  �  a  �  �  �   �  9  ,  �   f  W   Y  M   �    �  U    �  s      )"  f  @"     �$  o  �$    '  [  =(  �   �)    �*  ^   �+    
,  �   -  �   �-  t   �.  Z   '/  �   �/                                                   	                                                          
                 :class:`Gtk.FileChooserDialog` inherits from :class:`Gtk.Dialog`, so buttons have response IDs such as :attr:`Gtk.ResponseType.ACCEPT` and :attr:`Gtk.ResponseType.CANCEL` which can be specified in the :class:`Gtk.FileChooserDialog` constructor. In contrast to :class:`Gtk.Dialog`, you can not use custom response codes with :class:`Gtk.FileChooserDialog`. It expects that at least one button will have of the following response IDs: :class:`Gtk.FileChooser` also supports a variety of options which make the files and folders more configurable and accessible. :class:`Gtk.MessageDialog` is a convenience class, used to create simple, standard message dialogs, with a message, an icon, and buttons for user response You can specify the type of message and the text in the :class:`Gtk.MessageDialog` constructor, as well as specifying standard buttons. :meth:`Gtk.FileChooser.set_do_overwrite_confirmation`: If the file chooser was configured in :attr:`Gtk.FileChooserAction.SAVE` mode, it will present a confirmation dialog if the user types a file name that already exists. :meth:`Gtk.FileChooser.set_local_only`: Only local files can be selected. :meth:`Gtk.FileChooser.show_hidden`: Hidden files and folders are displayed. A 'modal' dialog (that is, one which freezes the rest of the application from user input), can be created by calling :class:`Gtk.Dialog.set_modal` on the dialog or set the ``flags`` argument of the :class:`Gtk.Dialog` constructor to include the :attr:`Gtk.DialogFlags.MODAL` flag. By default, :class:`Gtk.FileChooser` only allows a single file to be selected at a time. To enable multiple files to be selected, use :meth:`Gtk.FileChooser.set_select_multiple`. Retrieving a list of selected files is possible with either :meth:`Gtk.FileChooser.get_filenames` or :meth:`Gtk.FileChooser.get_uris`. Clicking a button will emit a signal called "response". If you want to block waiting for a dialog to return before returning control flow to your code, you can call :meth:`Gtk.Dialog.run`. This method returns an int which may be a value from the :class:`Gtk.ResponseType` or it could be the custom response value that you specified in the :class:`Gtk.Dialog` constructor or :meth:`Gtk.Dialog.add_button`. Custom Dialogs Dialog windows are very similar to standard windows, and are used to provide or retrieve information from the user. They are often used to provide a preferences window, for example. The major difference a dialog has is some prepacked widgets which layout the dialog automatically. From there, we can simply add labels, buttons, check buttons, etc. Another big difference is the handling of responses to control how the application should behave after the dialog has been interacted with. Example Finally, there are two ways to remove a dialog. The :meth:`Gtk.Widget.hide` method removes the dialog from view, however keeps it stored in memory. This is useful to prevent having to construct the dialog again if it needs to be accessed at a later time. Alternatively, the :meth:`Gtk.Widget.destroy` method can be used to delete the dialog from memory once it is no longer needed. It should be noted that if the dialog needs to be accessed after it has been destroyed, it will need to be constructed again otherwise the dialog window will be empty. Furthermore, you can specify which kind of files are displayed by creating :class:`Gtk.FileFilter` objects and calling :meth:`Gtk.FileChooser.add_filter`. The user can then select one of the added filters from a combo box at the bottom of the file chooser. In some dialogs which require some further explanation of what has happened, a secondary text can be added. In this case, the primary message entered when creating the message dialog is made bigger and set to bold text. The secondary message can be set by calling :meth:`Gtk.MessageDialog.format_secondary_text`. The :class:`Gtk.FileChooserDialog` is suitable for use with "File/Open" or "File/Save" menu items. You can use all of the :class:`Gtk.FileChooser` methods on the file chooser dialog as well as those for :class:`Gtk.Dialog`. There are several derived Dialog classes which you might find useful. :class:`Gtk.MessageDialog` is used for most simple notifications. But at other times you might need to derive your own dialog class to provide more complex functionality. To choose a folder instead of a file, use :attr:`Gtk.FileChooserAction.SELECT_FOLDER`. To pack widgets into a custom dialog, you should pack them into the :class:`Gtk.Box`, available via :meth:`Gtk.Dialog.get_content_area`. To just add a :class:`Gtk.Button` to the bottom of the dialog, you could use the :meth:`Gtk.Dialog.add_button` method. To save a file for the first time, as for a File/Save command, use :attr:`Gtk.FileChooserAction.SAVE`, and suggest a name such as "Untitled" with :meth:`Gtk.FileChooser.set_current_name`. To save a file under a different name, as for a File/Save As command, use :attr:`Gtk.FileChooserAction.SAVE`, and set the existing filename with :meth:`Gtk.FileChooser.set_filename`. To select a file for opening, as for a File/Open command, use :attr:`Gtk.FileChooserAction.OPEN` When creating a :class:`Gtk.FileChooserDialog` you have to define the dialog's purpose: When the user is finished selecting files, your program can get the selected names either as filenames (:meth:`Gtk.FileChooser.get_filename`) or as URIs (:meth:`Gtk.FileChooser.get_uri`). Project-Id-Version: Python GTK+ 3 Tutorial 3.4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-04-04 14:26-0300
PO-Revision-Date: 2018-04-04 15:10-0300
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 1.8.11
Last-Translator: Tomaz Cunha <tomazmcn@gmail.com>
Plural-Forms: nplurals=2; plural=(n > 1);
Language: pt_BR
 :class:`Gtk.FileChooserDialog` herda de :class:`Gtk.Dialog`, então os botões possuem IDs de resposta como :attr:`Gtk.ResponseType.ACCEPT` e :attr:`Gtk.ResponseType.CANCEL`, que pode ser especificado no construtor :class:`Gtk.FileChooserDialog`. Em contraste com :class:`Gtk.Dialog`, você não pode usar códigos de resposta customizados com :class:`Gtk.FileChooserDialog`. Espera que pelo menos um botão tenha os seguintes IDs de resposta: :class:`Gtk.FileChooser` também suporta uma variedade de opções que tornam os arquivos e pastas mais configuráveis e acessíveis. :class:`Gtk.MessageDialog` é uma classe de conveniência, usada para criar diálogos de mensagem simples e padrão, com uma mensagem, um ícone e botões para resposta do usuário. Você pode especificar o tipo de mensagem e o texto no construtor :class:`Gtk.MessageDialog`, além de especificar botões padrão. :meth:`Gtk.FileChooser.set_do_overwrite_confirmation`: Se o seletor de arquivos foi configurado no modo :attr:`Gtk.FileChooserAction.SAVE`, ele apresentará um diálogo de confirmação se o usuário digitar um nome de arquivo que já existe. :meth:`Gtk.FileChooser.set_local_only`: Somente arquivos locais podem ser selecionados. :meth:`Gtk.FileChooser.show_hidden`: arquivos e pastas ocultos são exibidos. Um diálogo 'modal' (isto é, um que congela o resto do aplicativo da entrada do usuário), pode ser criado chamando :class:`Gtk.Dialog.set_modal` no diálogo ou setando o argumento ``flags`` do o construtor :class:`Gtk.Dialog` para incluir o sinalizador :attr:`Gtk.DialogFlags.MODAL`. Por padrão, :class:`Gtk.FileChooser` permite apenas que um único arquivo seja selecionado por vez. Para permitir que vários arquivos sejam selecionados, use :meth:`Gtk.FileChooser.set_select_multiple`. Recuperar uma lista de arquivos selecionados é possível com :meth:`Gtk.FileChooser.get_filenames` ou :meth:`Gtk.FileChooser.get_uris`. Clicar em um botão irá emitir um sinal chamado "response". Se você quiser bloquear a espera de um diálogo para retornar antes do retorno do fluxo de controle para o seu código, você pode chamar :meth:`Gtk.Dialog.run`. Este método retorna um int que pode ser um valor de :class:`Gtk.ResponseType` ou pode ser o valor de resposta customizado que você especificou no construtor :class:`Gtk.Dialog` ou :meth:`Gtk.Dialog .add_button`. Dialogs Personalizados As janelas de caixa de diálogo são muito semelhantes às janelas padrão e são usadas para fornecer ou recuperar informações do usuário. Eles são frequentemente usados para fornecer uma janela de preferências, por exemplo. A principal diferença que uma caixa de diálogo tem é alguns widgets pré-empacotados que organizam a caixa de diálogo automaticamente. A partir daí, podemos simplesmente adicionar rótulos, botões, botões de verificação, etc. Outra grande diferença é o tratamento de respostas para controlar como o aplicativo deve se comportar após a interação com a caixa de diálogo. Exemplo Finalmente, existem duas maneiras de remover um diálogo. O método :meth:`Gtk.Widget.hide` remove a caixa de diálogo da visualização, mas mantém armazenada na memória. Isso é útil para evitar a necessidade de construir a caixa de diálogo novamente se precisar ser acessada posteriormente. Alternativamente, o método :meth:`Gtk.Widget.destroy` pode ser usado para excluir o diálogo da memória, uma vez que não é mais necessário. Deve ser notado que se o diálogo precisar ser acessado depois de ter sido destruído, ele precisará ser construído novamente, caso contrário a janela de diálogo estará vazia. Além disso, você pode especificar quais tipos de arquivos são exibidos criando objetos :class:`Gtk.FileFilter` e chamando :meth:`Gtk.FileChooser.add_filter`. O usuário pode selecionar um dos filtros adicionados em uma caixa de combinação na parte inferior do seletor de arquivos. Em alguns diálogos que requerem alguma explicação adicional do que aconteceu, um texto secundário pode ser adicionado. Nesse caso, a mensagem principal inserida ao criar a caixa de diálogo da mensagem é maior e definida como texto em negrito. A mensagem secundária pode ser definida chamando :meth:`Gtk.MessageDialog.format_secondary_text`. O :class:`Gtk.FileChooserDialog` é adequado para uso com itens de menu "Arquivo/Abrir" ou "Arquivo/Salvar". Você pode usar todos os métodos :class:`Gtk.FileChooser` no diálogo do seletor de arquivos, assim como aqueles para :class:`Gtk.Dialog`. Existem várias classes de diálogo derivadas que você pode achar útil. :class:`Gtk.MessageDialog` é usado para notificações mais simples. Porém, em outras ocasiões, você pode precisar derivar sua própria classe de diálogo para fornecer uma funcionalidade mais complexa. Para escolher uma pasta em vez de um arquivo, use :attr:`Gtk.FileChooserAction.SELECT_FOLDER`. Para empacotar widgets em um diálogo customizado, você deve empacotá-los no :class:`Gtk.Box`, disponível via :meth:`Gtk.Dialog.get_content_area`. Para adicionar apenas um :class:`Gtk.Button` ao final do diálogo, você poderia usar o método :meth:`Gtk.Dialog.add_button`. Para salvar um arquivo pela primeira vez, como para um comando Arquivo/Salvar, use :attr:`Gtk.FileChooserAction.SAVE` e sugira um nome como "Untitled"com :meth:`Gtk.FileChooser.set_current_name`. Para salvar um arquivo com um nome diferente, como para um comando Arquivo/Salvar como, use :attr:`Gtk.FileChooserAction.SAVE` e defina o nome do arquivo existente como :meth:`Gtk.FileChooser.set_filename`. Para selecionar um arquivo para abertura, como para um comando Arquivo/Abrir, use :attr:`Gtk.FileChooserAction.OPEN` Ao criar um :class:`Gtk.FileChooserDialog` você precisa definir o propósito do diálogo: Quando o usuário terminar de selecionar arquivos, seu programa pode obter os nomes selecionados como nomes de arquivos (:meth:`Gtk.FileChooser.get_filename`) ou como URIs (:meth:`Gtk.FileChooser.get_uri`). 