.. _commands:

Commands
========
This chapter covers the most common commands of the Axon Ivy Designer.


Invoking Commands
-----------------

As mentioned before in the :ref:`VS Code Basics <designer-basics-commands>`, every command can be executed in different ways.

- **Command Palette** - This is the most robust and secure way, since very existing command can be executed via the :ref:`Command Palette <designer-basics-commands>`.
- **Tree view context menu** - For convenience, many commands can also be invoked in the context menu via right-click in a tree view. The advantage is that commands are logically grouped and presented.

There are two tree views where you can right-click: The built-in file explorer and the :ref:`Axon Ivy Projects tree view <designer-basics-tree-view>`.

The file explorer shows a broad collection of commands you most commonly use across your projects. It groups commands by logical sets.

.. figure:: /_images/designer/commands/context_file_explorer.png
    :alt: Right-click in the file explorer displays the Axon Ivy context menu with the most useful commands

    Right-click in the file explorer display the Axon Ivy context menu with the most useful commands

The Axon Ivy Projects menu only shows commands you execute on that specific project (e.g. deploy, export, etc.)

.. figure:: /_images/designer/commands/context_axon_ivy_projects.png
    :alt: Right-click in the Axon Ivy Projects view displays the project context menu

    Right-click in the Axon Ivy Projects view displays the project context menu

The difference between the two context menus is the selection of commands.



Project Selection
~~~~~~~~~~~~~~~~~

Many commands need input from the user.
For example, when creating a new process, the dialog first asks you in which project you want to create this new process.

When you invoke that command via the context menu, the command will intelligently prefill the project for you if possible.

.. figure:: /_images/designer/commands/tree_selection1.png
    :alt: Select "my-first-project" and invoke New Business Process via context menu.

    Select "my-first-project" and invoke New Business Process via context menu.

.. figure:: /_images/designer/commands/tree_selection2.png
    :alt: The dialog will directly start at step 2/3, prefilling the project input with your tree selection.

    The dialog will directly start at step 2/3, prefilling the project input with your tree selection.

.. figure:: /_images/designer/commands/tree_selection3.png
    :alt: When you press the back button, you see the prefilled project selection and can change it if desired.

    When you press the back button, you see the prefilled project selection and can change it if desired.

On the other hand, if you invoke a command via the Command Palette with :code:`Axon Ivy: New Business Process` there will never be any prefilling

.. figure:: /_images/designer/commands/tree_no_selection.png
    :alt: Invoking via the Command Palette takes you to the first step of the dialog.

    Invoking via the Command Palette takes you to the first step of the dialog.

.. note::
    If there is only one Axon Ivy project in your workspace, this project will often automatically be preselected.
    This means that commands that have only one input, namely project selection, will execute without asking for input.

    Example: :code:`Axon Ivy: Reveal Project in File Explorer` consists of one step only: Selecting the project.
    If there is only one project, the command will select it and reveal the project in the file explorer without asking for input.


Command Feedback
~~~~~~~~~~~~~~~~

Not all commands ask you for your input. Some commands simply execute in the background.

After invoking a command, you can inspect the status bar in the bottom-left and the notifications list in the bottom-right corners.
They usually provide feedback about ongoing operations.

For more detailed feedback, you can check the :ref:`log views <designer-views-axonivy-views>`.




List of all Commands
--------------------

New
~~~
All commands that create new Axon Ivy resources, except for :code:`New Project`, will first ask you for a project in which to create the new resource in.

New Project
^^^^^^^^^^^
:code:`Axon Ivy: New Project`

Creates a new Axon Ivy project.

New Business Process
^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Business Process`

Creates a new Axon Ivy business process. Refer to the :ref:`process-modeling` for more information.

New Callable Sub Process
^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Callable Sub Process`

Creates a new Axon Ivy callable subprocess. Refer to the :ref:`process-modeling` for more information.

New Web Service Process
^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Web Service Process`

Creates a new Axon Ivy web service process. Refer to the :ref:`process-modeling` for more information.

New Html Dialog (JSF)
^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Html Dialog (JSF)`

Creates a new Axon Ivy HTML dialog based on JSF. Refer to the :ref:`user-dialogs` for more information.

New Dialog Form
^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Dialog Form`

Creates a new Axon Ivy dialog form. Refer to the :ref:`user-dialogs` for more information.

New Offline Dialog (JSF)
^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Offline Dialog (JSF)`

Creates a new Axon Ivy offline dialog based on JSF. Refer to the :ref:`user-dialogs` for more information.

New Data Class
^^^^^^^^^^^^^^
:code:`Axon Ivy: New Data Class`

Creates a new Axon Ivy data class. Refer to the :ref:`data-classes` for more information.

New Entity Class
^^^^^^^^^^^^^^^^
:code:`Axon Ivy: New Entity Class`

Creates a new Axon Ivy entity class. Refer to the :ref:`data-classes` for more information.

New Case Map
^^^^^^^^^^^^
:code:`Axon Ivy: New Case Map`

Creates a new Axon Ivy case map. Refer to the :ref:`casemap` for more information.



Open Config Editors
~~~~~~~~~~~~~~~~~~~
The config editors will prompt you for a project on which to open the respective config editor.

Except for the :code:`Custom Field` editor, all those editors are Axon Ivy specific editors as described in the :ref:`editor introduction <designer-basics-editor>`. Those editors are therefore linked to specific file types or names.

For example, invoking :code:`Axon Ivy: Open Database Editor` in the project :code:`X` will open the database editor of that project. The same could be achieved by double-clicking the :code:`config/databases.yaml` file in the project.

Open CMS Editor
^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open CMS Editor`

Opens the Axon Ivy CMS editor.

Open Custom Field Editor
^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Custom Field Editor`

Opens the Axon Ivy custom field editor.

Open Database Editor
^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Database Editor`

Opens the Axon Ivy database editor.

Open Persistence Editor
^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Persistence Editor`

Opens the Axon Ivy persistence editor.

Open Rest Client Editor
^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Rest Client Editor`

Opens the Axon Ivy REST client editor.

Open Role Editor
^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Role Editor`

Opens the Axon Ivy role editor.

Open User Editor
^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open User Editor`

Opens the Axon Ivy user editor.

Open Variable Editor
^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Variable Editor`

Opens the Axon Ivy variable editor.

Open Web Service Client Editor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Web Service Client Editor`

Opens the Axon Ivy web service client editor.



Logs
~~~~
Refer to the :ref:`designer-views-axonivy-views` for more information.

Open Axon Ivy Runtime Log
^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Axon Ivy Runtime Log`

Opens the Axon Ivy runtime log.

Open Axon Ivy Extension Log
^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Axon Ivy Extension Log`

Opens the Axon Ivy extension log.

Open Axon Ivy Engine Log
^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Axon Ivy Engine Log`

Opens the Axon Ivy Engine log.



Import / Export
~~~~~~~~~~~~~~~

Import Project Archive (.iar or .zip)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Import Project Archive (.iar or .zip)`

Lets you import and unpack an archived Axon Ivy project (``.iar``) or a collection of multiple projects (``.zip``).
If the import is successful, the project(s) will be **unpacked** and added to your workspace.

Export Project Archive (.iar)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Export Project Archive (.iar)`

Similar to the import, this command lets you export an Axon Ivy project from your workspace as an ``.iar`` archive.

Import BPMN Process
^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Import BPMN Process`

Import a BPMN process either as :code:`.xml` or :code:`.bpmn`.



Process Editor
~~~~~~~~~~~~~~
The following commands are only active if you have an open :code:`p.pjson` file in the Process Editor.

Fit to Screen
^^^^^^^^^^^^^
:code:`Axon Ivy: Fit to Screen`

Fits the active workflow diagram to the available screen space.

Center selection
^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Center selection`

Centers the selected elements in the active workflow diagram.

Layout diagram
^^^^^^^^^^^^^^
:code:`Axon Ivy: Layout diagram`

Automatically arranges the active workflow diagram.

Export as SVG
^^^^^^^^^^^^^
:code:`Axon Ivy: Export as SVG`

Exports the active workflow diagram as an SVG file.



Form Editor
~~~~~~~~~~~
The following commands are only active if you have an open :code:`f.json` file in the Form Editor.

Open Dialog Preview
^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Dialog Preview`

Opens a preview of the selected dialog.


.. _project-convert:

Project Conversion
~~~~~~~~~~~~~~~~~~
When you update your Axon Ivy engine, projects can become outdated.
In that case, the :ref:`problem view <problems-view>` will show a problem marker, indicating that the projects need to be **converted**.
Clicking on the problem or will let you inspect your project's properties file :file:`.ivyproject`, you will see the project version. 
You will also see a warning indicator, when the project is out of date. 

Axon Ivy can convert your old projects automatically to the newest project format for you.
During this process, all existing artifacts will be converted (if necessary) so as to work with the new Axon Ivy version,
and any missing but required artifacts will be added.

The conversion can be triggered via the :code:`Axon Ivy: Convert Project` command.
After the execution, you can check the :ref:`conversion log <designer-views-project-conversion>` for details.

.. warning::   

   It is absolutely recommended that you create a copy of your project
   before invoking the conversion. Alternatively you can have your
   project under version control. In this case, make sure that all your
   projects are checked in, before you invoke the conversion, so that
   you can easily roll back (revert) to the old version, if conversion
   should fail for some reason.

In the :ref:`migration-notes`, migration tasks marked with |tag-project-auto-convert| 
will run with this command.

Convert Project
^^^^^^^^^^^^^^^
:code:`Axon Ivy: Convert Project`

Opens a selection with all the outdated projects in your workspace. Lets you choose projects to convert.
If there are no outdated projects in your workspace, the selection will be empty and nothing can be selected.


Convert All Projects
^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Convert All Projects`

Shortcut for Convert Project which preselects all available projects ready for conversion




Project Management
~~~~~~~~~~~~~~~~~~

Those projects pertain the management and setup of your Axon Ivy projects.

Deploy Project
^^^^^^^^^^^^^^
:code:`Axon Ivy: Deploy Project`

Deploys the selected Axon Ivy project, which synchronizes your workspace with the Axon Ivy backend.
When working in the Designer, this command is usually executed behind the scenes and is not needed to be executed manually
unless you encounter problems in your workspace.

Deploy all Projects
^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Deploy all Projects`

Shortcut to execute the deploy on all all Axon Ivy projects in the workspace.

Stop BPM Engine of Project
^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Stop BPM Engine of Project`

Stops the BPM Engine associated with the selected project.
This will terminate all running simulations.


Add Project Dependency
^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Add Project Dependency`

Adds a dependency to an Axon Ivy project.



Market
~~~~~~
Our :ref:`Axon Ivy Market <market>` has many already built connectors to 3rd-party systems, utilities or demos 
that you can easily integrate into your Axon Ivy projects.

Install Market Product
^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Install Market Product`

Installs an Axon Ivy Market product from the Axon Ivy market.

Install Local Market Product
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Install Local Market Product`

Installs an Axon Ivy Market product from a local source file.




Miscellaneous
~~~~~~~~~~~~~

Activate Process Animation
^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Activate Process Animation`

Activates process animation in the Axon Ivy Engine.

Deactivate Process Animation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Deactivate Process Animation`

Deactivates process animation in the Axon Ivy Engine.

Attach Process Debugger
^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Attach Process Debugger`

Attaches the process debugger, which allows you to debug your processes. Refer to the :ref:`debug-process` for more information about debugging.

Open Developer Workflow UI
^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Developer Workflow UI`

Opens the Axon Ivy Developer Workflow UI.

Open Engine Cockpit
^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Engine Cockpit`

Opens the Axon Ivy Engine Cockpit.

Open Welcome Page
^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Open Welcome Page`

Opens the Axon Ivy welcome page.

Refresh Project Explorer
^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Refresh Project Explorer`

Refreshes the :ref:`Axon Ivy Projects view <designer-basics-tree-view>`.

Switch Engine release train
^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Switch Engine release train`

Switches the Axon Ivy Engine release train. For advanced use only, refer to :ref:`designer-advanced-project-setup` for more information.

Reveal Project in File System
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:code:`Axon Ivy: Reveal Project in File System`

Reveals the selected Axon Ivy project or resource in the operating system's file system.
