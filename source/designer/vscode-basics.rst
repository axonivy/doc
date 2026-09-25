VS Code Basics
==============

Before diving into the Axon Ivy-specific functionality provided by the Designer extension, this chapter introduces some fundamental VS Code concepts used by the Designer.

VS Code itself is very well documented.
For an in-depth introduction, refer to the `VS Code Documentation: Documentation <https://code.visualstudio.com/docs>`_
and for a UI overview specifically to `VS Code Documentation: UI <https://code.visualstudio.com/docs/editing/getting-started/userinterface>`_.


Workspace
---------

`VS Code Documentation: Workspace <https://code.visualstudio.com/docs/editing/workspaces/workspaces>`_

The VS Code workspace represents the folder or set of folders that are currently open.
The file explorer view on the left displays the folders and files in the workspace.
Extensions can use the workspace to access project files and offer functionality that is specific
to the currently open workspace.

An Axon Ivy project is simply a folder with specific files in it and the Designer organizes those projects within a workspace.


.. _designer-basics-commands:

Command and the Command Palette
-------------------------------

`VS Code Documentation: Command Palette <https://code.visualstudio.com/docs/editing/getting-started/userinterface#_command-palette>`_

A command is an action that can be executed by the user.
Virtually everything you can do within VS Code can be achieved by running the respective commands.
A rule of thumb is that everything you can click can also be accessed through a command.
For example, instead of clicking ``File > Open File...``, you can achieve the exact same action by executing the command ``File: Open File...``.
This will open the same file picker UI.

VS Code provides many built-in commands, and extensions such as the Axon Ivy Designer can contribute
additional custom commands. Commands are commonly invoked through the **Command Palette**.

You can open the Command Palette by pressing ``Ctrl+Shift+P`` or by clicking the top search bar
and typing ``>``.

In the Command Palette, you can enter a search string to find matching commands.
To see Axon Ivy-related commands, for example, type ``Axon Ivy:`` to display commands contributed by the Designer extension.

.. figure:: /_images/vscode/command-palette.png
    :alt: Command Palette

    Command Palette

As explained later in more detail in :ref:`commands`, the Designer contributes its own commands to VS Code.
These commands can be used to work with the Axon Ivy platform.



Notifications & Status Bar
--------------------------
The VS Code UI communicates progress and errors through two elements: The notifications list in the bottom-right and the status bar in the bottom-left.

.. note::
    When working in VS Code executing commands, it is helpful to always keep an eye on both UI elements, as they help you keep informed about the status of the extension and its operations.

**Notifications**

`VS Code Documentation: Notifications <https://code.visualstudio.com/api/ux-guidelines/notifications>`_

The notifications are located at the bottom-right of the screen, indicated by the bell icon. 
This is the primary UI element that helps you understand if a command was successful or if there was an error.

Apart from error and success messages, the notification often offers additional actions like jumping to a log to see more details.

By default, notifications vanish after some time if not dismissed manually. You can bring up the full list by running the command :code:`Notifications: Show Notifications`

.. figure:: /_images/vscode/notifications.png

**Status Bar**

The status bar is a UI part located at the bottom-left of the VS Code window and displays contextual information from specific extensions.

The Axon Ivy extension contributes its own status bar.

Hovering over the status bar will display information regarding the state of the extension and the engine it is connected to.
Clicking it will open a context menu with different commands and options.

.. figure:: /_images/vscode/status-bar.png
    :alt: Axon Ivy status bar at the bottom of the window

    Axon Ivy status bar at the bottom of the window






.. _designer-basics-settings:

Settings
--------

`VS Code Documentation: Settings <https://code.visualstudio.com/docs/configure/settings>`_

You can configure almost all UIs and behaviors in the VS Code settings. They are a list of key-value pairs in ``settings.json`` files. As with commands, there are many built-in settings, but also extensions can supply their own settings that steer the behavior of the extension.
The Axon Ivy Designer supplies its own small set of settings, which are explained in more depth in the :ref:`designer-settings`.

VS Code settings come in a layered system: User and Workspace settings. User settings are applied globally for each new Workspace you open, while Workspace settings only apply to your current workspace. If both are set, Workspace settings win. If only a User setting is set, it will be applied to new workspaces automatically.

.. warning::
    Unless you clean them up regularly, using the User settings could potentially lead to a messy configuration with unintended consequences. It is **safer to stick to Workspace settings only**. The downside is that you will have to replicate some settings when starting a fresh workspace.

You can open the Settings UI by pressing ``Ctrl+,`` or by opening the Command Palette (``Ctrl+Shift+P``) and executing the command ``Preferences: Open Settings (UI)``. This will open the User settings by default, as visible in the :code:`User` tab.

You can switch to the Workspace settings by clicking the :code:`Workspace` tab or directly by executing the command :code:`Preferences: Open Workspace Settings (UI)`

.. figure:: /_images/vscode/settings.png
    :alt: Switch to the **Workspace** tab.

    Switch to the **Workspace** tab.



Profiles
--------

`VS Code Documentation: Profiles <https://code.visualstudio.com/docs/configure/profiles>`_

A VS Code profile is a saved set of VS Code configurations, settings and installed extensions.
You might use VS Code not only for Axon Ivy projects, but also for, for example, Python development which is completely independent of your work with Axon Ivy.
In that example, you should have two separate profiles: One for Axon Ivy and one for Python.
The reason for this is, that you don't want to have more extensions installed than necessary, since they might interfere.

Follow the VS Code docs above on how to create a profile. A very simple Axon Ivy profile would look like this:

.. figure:: /_images/vscode/profiles.png
    :alt: A simple Axon Ivy profile with the minimum of extensions required

    A simple Axon Ivy profile with the minimum of extensions required

This profile has only the Axon Ivy Designer installed. The required Java and Maven extensions are also part of the profile, because they are installed automatically.
Note that we only configured the extensions, all the other things like `Settings` or `Keyboard Shortcuts` work identical to the default. This way you don't have to recreate all the settings for each project but only the extensions that change.

With this profile in place, when you want to work on an Axon Ivy project, you open that folder and first switch to your "Axon Ivy" profile.


.. _designer-basics-editor:

Editor
------

Editors are the main UI area where files are opened and displayed.
In addition to the standard text editor, extensions can provide custom editors for specific file types.
These custom editors are associated with certain file extensions and offer a specialized interface
for viewing or editing their content.
When an editor is linked to a file extension, opening a file with that extension automatically opens it
in the associated editor by default.

For example, the Designer provides, among others, a specialized :ref:`designer-editors-process`
for ``.p.json`` files that displays a graphical view of an Axon Ivy process.

.. figure:: /_images/vscode/editor-process.png
    :alt: Double-clicking ``BusinessProcess.p.json`` opens the graphical Process Editor.

    Double clicking ``BusinessProcess.p.json`` opens the graphical Process Editor.

VS Code offers you the option to switch the editor to the default text editor.
The button is located on the top-right corner, where it says *Axon Ivy Process Editor*.
Clicking it will offer you the option to switch to the default *Text Editor*.



.. _designer-basics-tree-view:

Tree View
---------

`VS Code Documentation: View <https://code.visualstudio.com/docs/editing/getting-started/userinterface#_views>`_

A view in VS Code is a UI container where specific information is displayed.
A tree view displays information in a hierarchical structure, typically on the left-hand side of VS Code.
For example, the file explorer is a built-in tree view that displays files and folders.
Extensions can contribute custom tree views to show their own data in the UI.
Users can interact with the entries to trigger actions or open related resources.

The Axon Ivy Designer contributes its own **Axon Ivy Projects** tree view, which displays all Axon Ivy projects
in the currently open workspace.

.. figure:: /_images/vscode/axonivy-tree-view.png
    :alt: The Axon Ivy Projects tree view

    The Axon Ivy Projects tree view
