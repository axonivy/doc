.. _designer-views:

Views
=====

This chapter goes into more detail about the different views in the VS Code UI.
It covers built-in views, views supplied by the Java and Maven extension as well as the Axon Ivy specific log views.

In general, to focus on a view, you can try to search the Command Palette for ``Focus xxx View`` where ``xxx`` is the view you want, e.g. ``Maven`` or ``Axon Ivy``.

If you want to hide a view, you can right click on the view title and look for the ``Hide`` option.



.. _problems-view:

Problems View
-------------

Command: ``> User View Container: Focus on Problems View``

The Problems view is normally located in the bottom-center panel.
It is a built-in view.

It shows diagnostic messages in your open files and even across your workspace, indicating problems within your files.
It reports Axon Ivy specific problems (e.g. an outdated project) coming from the extension, as well as general problems (for example if one of your Java files contains an error).

Clicking the error will open the file where the error is located.
If available, the small lightbulb to the left of the error in the Problems view offers a fix for the problem.

.. figure:: /_images/designer/views/problem_view.png
    :alt: Problem view with one Axon Ivy error (project outdated) and one Java error (missing ;)

    Problem view with one Axon Ivy error (project outdated) and one Java error (missing ;)



.. _designer-views-run-and-debug-view:

Run and Debug View
------------------

`VS Code Debugging <https://code.visualstudio.com/docs/debugtest/debugging>`_

Command: ``> View: Show Run and Debug``

The built-int Run and Debug view container is located on the far left side in the activity bar and is a collection of views used to debug your code.
This container contains multiple views revolving around debugging, setting breakpoints and stepping thorough your code.


.. _designer-views-breakpoints-view:

Breakpoints View
~~~~~~~~~~~~~~~~

Command: ``> Run and Debug: Focus on Breakpoints View``

One very useful view within the Run and Debug view container is the Breakpoints view where you can see your currently set breakpoints and enable/disable or remove them.

Debug Toolbar
~~~~~~~~~~~~~

The toolbar helps you navigate an ongoing debug session.
You can resume the execution or step into/out of functions.
It is automatically shown as soon as a debug session is ongoing.




.. _designer-views-maven-view:

Maven View
----------

Command: ``> Explorer: Focus on Maven View``

The Maven view displays the Maven projects and dependencies available in the current workspace.
It is supplied by the Maven extension and is normally shown in the left bar.

Axon Ivy projects resolved from a Maven repository are shown here as well, even when their source projects are not part of the workspace.


.. _designer-views-java-view:

Java Projects View
------------------

Command: ``> Explorer: Focus on Java Projects View``

The Java Projects view displays the Java projects found in your workspace.
It is supplied by the Java extension and is normally shown in the left bar.

This view will not only show Axon Ivy projects (which are Java projects) but also any other Java projects you have in your workspace.





.. _designer-views-axonivy-views:

Axon Ivy Output Views
---------------------

Apart from the :ref:`Axon Ivy Projects tree view <designer-basics-tree-view>`, the Designer also provides different logs in the Output view.

Command: ``> Output: Focus on OUtput View``

The Output view is by default located in the bottom-middle panel.
Use the dropdown on the right to switch between different channels.
All the ``Axon Ivy`` channels provide logs for different operations and allow you to trace and understand the operations by the extension.

.. figure:: /_images/designer/views/output_view.png


Codegen Log
~~~~~~~~~~~
The Codegen log contains logs when creating REST or WebService clients.

Engine Log
~~~~~~~~~~~
The Engine log contains the logs of the running engine itself, e.g. the Engine instance that is launched by the Designer upon start.
There you will find any logs and errors that happened in the backend.

Extension Log
~~~~~~~~~~~~~
The Extension log contains information about warnings and errors that pertain the extension itself.

Runtime Log
~~~~~~~~~~~
The Runtime log displays a list of events which occur during the simulation.
Here, you will also find your IvyScript logs.

.. _designer-views-project-conversion:

Project Conversion Log
~~~~~~~~~~~~~~~~~~~~~~
This log displays progress, success and errors specifically from the project conversion commands.




How to log in Axon Ivy
----------------------

Besides the log events of some process elements, you can also log your own events.
Open any process elements that contain IvyScript (like: Step, Web
Service, etc.) and type a script like the one you find in the figure
below:

.. literalinclude:: includes/log.txt
    :language: java

Find out more about Axon Ivy scripting language :ref:`ivyscript`.
