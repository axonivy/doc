.. _designer-settings:

Designer Settings
=================

This chapters covers the different VS Code settings the Axon Ivy Designer provides to configure the behavior of the extension.

For a general introduction to VS Code settings, refer to :ref:`designer-basics-settings`.

Open the settings UI to the **Workspace** settings by executing the command :code:`Preferences: Open Workspace Settings (UI)`
and then search for :code:`@ext:axonivy.vscode-designer-14`.

Alternatively, you can click the status bar and press :code:`Open Axon Ivy Settings`.

This will give you a list of all available settings of the Axon Ivy Designer.

Some of the settings are of a purely technical nature.
Only the settings relevant for your work with the extension are listed here.


.. _designer-engine-config-args:

Axon Ivy > Engine
-----------------

Run By Extension
~~~~~~~~~~~~~~~~
This setting must always be activated. Deactivating it is for extension debugging only and will break your Axon Ivy Designer.


Release Train
~~~~~~~~~~~~~~~~
Advanced use only. This setting should be empty.

Only set it, if you want to work with a specific extension or engine version, as described in :ref:`designer-advanced-setup`


Engine URL
~~~~~~~~~~
Can be ignored, not relevant.

.. _designer-settings-vmargs:

Vm Args
~~~~~~~
Here you can specify additional arguments for the engine that is run in the background by the extension.

As mentioned in the description, this is mainly used for debugging your Java classes. Refer to the :ref:`debug-java` chapter for more information about debugging.
 


Axon Ivy > Project
------------------

Exclude Patterns
~~~~~~~~~~~~~~~~
Allows you to specify patterns that should be excluded from the Axon Ivy project scanner.
This might be useful if you have many different projects in your workspace.


Maximum Number
~~~~~~~~~~~~~~
Upper limit for the number of projects that will be detected.





Axon Ivy
--------

Browser
~~~~~~~
Which browser is used to open the Axon Ivy content.
By default, this is set to the internal VS Code browser.
Change it to :code:`externalBrowser` if you want to open the content in your systems browser.

.. _designer-settings-workspace-validation:

Workspace Validation
~~~~~~~~~~~~~~~~~~~~
This setting lets you enable and disable the different validators in case you don't want to see the warnings and errors.
During development, it can be helpful to temporarily disable the validators for specific file types.




Axon Ivy > Process > Animation
------------------------------

.. _designer-animation-config:

Process Animation
~~~~~~~~~~~~~~~~~
This setting lets you enable or disable the process animation.
If enabled, whenever you simulate a process, the animation will visually guide you through the triggered processes.


.. _designer-animation-mode-config:

Mode
~~~~
Specify the process animation mode.
The following modes are available: all, currentProcess, openProcess, noDialogProcess, noEmbeddedProcess


.. _designer-animation-speed-config:

Speed
~~~~~
Adjust the speed of the process animation.


Axon Ivy > Local Mcp
--------------------
tbd
