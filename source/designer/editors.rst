.. _designer-editors:

Editors
=======
As explained in the :ref:`VS Code Editor Basics <designer-basics-editor>`, the VS Code Designer provides custom editors for various Axon Ivy filename patterns or file types.

If a file with a matching filename or file type is opened, VS Code will open it by default in the associated editor.

.. _designer-editors-process:

Process Editor
--------------
The most important visual editor is the process editor.
It allows you to design and edit your processes.
It is linked to the filetype :code:`.p.json`.

See :ref:`process-editor`.


Form Editor
-----------
The form editor lets you build UIs with drag-and-drop.
It is linked to the filetype :code:`.f.json`.

See :ref:`form-editor`.


Data Class Editor
-----------------
The data class editor lets you edit your data objects.
It is linked to the filetype :code:`.d.json`.

See :ref:`data-class-editor`.


Case Map Editor
-----------------
The case map editor lets you edit your case maps.
It is linked to the filetype :code:`.m.json`.

See :ref:`casemap-editor`.


CMS Editor
----------
The Content Management System (CMS) editor lets you edit your CMS files in a graphical interface.
It is linked to files with the pattern :code:`cms*.yaml`.

See :ref:`cms-editor`.


Config Editors
--------------
The following editors are all linked to configuration files found by default in the :code:`config/` folder of an Axon Ivy project.

Database Editor
~~~~~~~~~~~~~~~
Lets you edit and manage your database connections.
It is linked to the file name pattern :code:`database.yaml`

See :ref:`database-configuration-editor`

Rest Client Editor
~~~~~~~~~~~~~~~~~~
Lets you edit and manage your REST clients.
It is linked to the file name pattern :code:`rest-client.yaml`

See :ref:`rest-client-configuration-editor`

Role Editor
~~~~~~~~~~~
Lets you create and edit your roles.
It is linked to the file name pattern :code:`roles.yaml`

See :ref:`role-editor`

User Editor
~~~~~~~~~~~
Lets you create and edit your users.
It is linked to the file name pattern :code:`users.yaml`

See :ref:`test-user-editor`

Variable Editor
~~~~~~~~~~~~~~~
Lets you add and edit your custom variables.
It is linked to the file name pattern :code:`variables.yaml`

See :ref:`variables-editor`


Web Service Client Editor
~~~~~~~~~~~~~~~~~~~~~~~~~
Lets you add and manage your web service clients.
It is linked to the file name pattern :code:`webservice-clients.yaml`

See :ref:`webservice-clients-configuration`
