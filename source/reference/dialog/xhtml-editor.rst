.. _xhtml-editor:

XHTML Editor
------------

The XHTML editor allows you to edit the view of a `Jakarta Faces`_ Dialog or a static XHTML page. You can view and edit the XHTML source in this text-based editor.


Creating a Faces Dialog
~~~~~~~~~~~~~~~~~~~~~~~
There are two ways to create a Faces Dialog.
The recommended way is to use the provided commands:

 - :menuselection:`Axon Ivy: New Html Dialog (JSF)`
 - :menuselection:`Axon Ivy: New Offline Dialog (JSF)`

The other option is to create a Faces Dialog via the context menu in the Explorer.
You can create a Faces Dialog from the menu item :guilabel:`Axon Ivy New...`

In the creation dialog you have to specify the following options:

 - Target Project (select from list)
 - Dialog Name
 - Dialog Namespace
 - `Layout`_
 - Base Template

After specifying all options, the XHTML editor opens for the newly created Dialog.

Accessing the Editor
~~~~~~~~~~~~~~~~~~~~
The XHTML editor opens whenever you select an :file:`.xhtml` file from the Explorer.

Preview
~~~~~~~
The Dialog Preview enables you to display the current state of your Dialog in the integrated browser.

It can be accessed via the button :guilabel:`Open Dialog Preview` in the top-right corner.
A command is also available to open the preview.

|xhtml-editor-preview|

Completions (Ctrl + Space)
~~~~~~~~~~~~~~~~~~~~~~~~~~
Completions help you work efficiently by suggesting available options for the current cursor position.
You can display available completions by pressing ``Ctrl + Space``.
Completions are available in most contexts:

 - Tags
 - Attributes
 - EL expressions

|xhtml-editor-completions|

Hover
~~~~~
To see detailed information for beans, CMS entries and Faces elements you can hover over them.
The popup will display relevant information such as return type of a method, value of a CMS entry or documentation for Faces elements.

|xhtml-editor-hover|

Code Actions (Ctrl + .)
~~~~~~~~~~~~~~~~~~~~~~~
Quickly remedy any misspellings in EL expressions, missing CMS entries, or warnings using the Code Actions provided.

These can be accessed either via the lightbulb at the start of the line or via the shortcut ``Ctrl + .``.
Code Actions are provided for the following actions:

 - Fixing misspelled bean & attribute names
 - Creating missing attributes on dialog data
 - Converting static strings into CMS entries
 - Suppressing validation of unwanted warnings

|xhtml-editor-actions|

Go to Definition (Ctrl + Click)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you need to see more information than the hover provides, you can ``Ctrl + Click`` on a CMS entry, bean, method or property to directly jump to its source.

Validation Suppression
~~~~~~~~~~~~~~~~~~~~~~
In some cases, it is useful to suppress validation for certain lines or entire files. This can be done by adding a comment in the source code:

.. code-block:: xml

    <!-- disable validator next-line: el-validator -->
    <!-- disable validator: el-validator -->

The simplest way to suppress validation is to use the Code Action "Suppress Validation" either for the affected line or the entire file. This will automatically add the comment to the source code.
Multiple validators can be suppressed by separating them with commas:

.. code-block:: xml

    <!-- disable validator: el-validator, validator-id-validator -->
    <!-- disable validator: all -->


.. |xhtml-editor-preview| image:: /_images/vscode/editor-xhtml-preview.png
.. |xhtml-editor-completions| image:: /_images/vscode/editor-xhtml-completions.png
.. |xhtml-editor-hover| image:: /_images/vscode/editor-xhtml-hover.png
.. |xhtml-editor-actions| image:: /_images/vscode/editor-xhtml-code-actions.png

.. _Jakarta Faces: https://dev.axonivy.com/doc/15.1/en/getting-productive/user-interface/user-dialogs/html-dialogs.html
.. _Layout: https://dev.axonivy.com/doc/15.1/en/getting-productive/user-interface/user-dialogs/html-dialog-view-types.html