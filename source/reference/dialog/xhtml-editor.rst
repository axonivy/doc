.. _xhtml-editor:

XHTML Editor
==========

The XHTML Dialog editor allows you to edit the view of a JSF Dialog or a static XHTML page. You can read and edit the JSF & XHTML source in this text-based editor.


Accessibility
-------------
The XHTML Dialog editor is opened whenever you select an ".xhtml" file from the explorer.

Preview
-------
The Dialog Preview enables you to display the current state of your Dialog in the integrated browser.

It can be accessed via the button "Open Dialog Preview" in the top right corner.
A command is also available to open the preview.

Completions (Ctrl + Space)
--------------------------
Development is made efficient with the provided completions. 
You can display available completions for the current cursor position by pressing ``ctrl + space``.
Completions are available for most any location:
    - Tags
    - Parameteres
    - EL-Expressions 

Code Actions (Ctrl + .)
-----------------------
Quickly remedy any misspellings in EL-Expressions, missing CMS Entries, or warnings using the Code Actions provided.

These can be accessed either via the lightbulb at the start of the line or via shortcut ``ctrl + .``.
Code Actions are provided for following fixes:
    - Misspelled Bean- & Attribute-Names
    - Creating Missing attributes on dialog data
    - Converting static strings into CMS Entries
    - Suppressing validation of unwanted warnings

Hover
-----
To see detailed information for beans, CMS Entries and JSF Elements you can hover over them.
The popup will display relevant information such as return type of a method, value of a CMS Entry or documentation for JSF Elements.

Jump (Ctrl + Click)
-------------------
If you need to see more information than the hover provides, you can ``ctrl + click`` on a CMS Entry, Bean, Method or Property to directly jump to its source.

Validation
----------
All XHTML files are validated and issues are displayed in open files as well as the problems view.
To open the problems view, use the shortcut ``ctrl + j`` and select the "Problems" tab or open it via command "Focus on Problems View".

If for any reason you do not want to see the validation for all files in your workspace it can be disabled in the settings under "Extensions > Axon Ivy > Workspace Validation".

Validation Suppression
~~~~~~~~~~~~~~~~~~~~~~
For some cases it is useful to suppress validation for certain lines or entire files. This can be done by adding a comment in the source code:

.. code-block:: xml

    <!-- disable validator next-line: el-validator -->
    <!-- disable validator: el-validator -->

The simplest way to suppress validation is to use the Code Action "Suppress Validation" either for the affected line or the entire file. This will automatically add the comment to the source code.
Multiple validators can be suppressed by separating them with a comma:

.. code-block:: xml

    <!-- disable validator: el-validator, validator-id-validator -->
    <!-- disable validator: all -->