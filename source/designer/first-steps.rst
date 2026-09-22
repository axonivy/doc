First Steps
===========


Check the Installation
----------------------

After installing the Designer extension, it should be listed in your VS Code extension view.

As mentioned before, there are usually two ways to achieve something in VS Code: By clicking or by executing the command(s).

To bring up the VS Code extension view, you can either

#. Click the extension icon in the activity bar on the far left.
#. Open the Command Palette via ``Ctrl+Shift+P`` and search for the command ``View: Show Extensions``.

.. figure:: /_images/designer/first-steps/start_extension_installed.png
    :alt: Axon Ivy extension is installed in the extension view

    Axon Ivy extension is installed in the extension view


Open a Workspace
----------------

After starting VS Code, the window will probably look similar to this:

.. figure:: /_images/designer/first-steps/start_screen.png
    :alt: VS Code without an open workspace.

    VS Code without an open workspace.

- The top-left file explorer view shows you open files in the workspace. Since we have not yet opened a workspace, it says :code:`No Folder Opened`.
- The bottom-left Axon Ivy Projects view tells us that there are no projects, because we have not yet opened a folder.
- The right side welcome page of the Designer is always shown upon start of the extension.


Create an empty folder `example-workspace` and use the ``Open Folder`` button in the file explorer to open it. Alternatively, we can open the Command Palette and execute the command ``File: Open Folder...``.

This sets your VS Code workspace to that folder, which is now visible in the file explorer view in the upper-left corner.

At this point, there is still no Axon Ivy project in the workspace, but the extension will automatically download and start the Axon Ivy Engine.
This is shown in the ``Output`` tab.
You are now ready to create an Axon Ivy project.

.. figure:: /_images/designer/first-steps/start_open_workspace.png
    :alt: Open workspace without an Axon Ivy project.

    Open workspace without an Axon Ivy project.


Adding an Axon Ivy Project
--------------------------

You can now create your first Axon Ivy project within the open workspace. To do so, either click the ``Create Axon Ivy Project`` button in the bottom left Axon Ivy Projects view or execute the command ``Axon Ivy: New Project``.
This will open a dialog in the top middle. Enter a name and press enter.
For steps 2 and 3 of the dialog, accept the proposed default namespace and group ID by pressing enter twice.

.. figure:: /_images/designer/first-steps/start_first_project.png
    :alt: Creating an Axon Ivy project will add it to the workspace.

    Creating an Axon Ivy project will add it to the workspace.

This will create an Axon Ivy project called ``my-first-project``. By default, a simple process is created and the Process Editor opens and displays the new process.
The file explorer shows you this folder in the workspace with all the files that make up the project.
The Axon Ivy Projects view also displays the project.
At this point, you have successfully set up the Axon Ivy Designer and are ready to design your processes.
