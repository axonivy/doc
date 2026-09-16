.. _debug:

Debugging
=========

This chapter explains how to debug your Axon Ivy processes.
There are two things you can debug

1. The Axon Ivy process itself. Inspect you process elements when simulating to understand your process.
2. The Axon Ivy engine and the Java classes that are executed during your process. This means your own Java files as well as stepping into the engine code.


.. _debug-process:

Process Debug
-------------
- In your open process, :ref:`add a breakpoint <process-editor-quick-actions-toggle-breakpoint>` on a process element
- There should pop up a notification in the bottom-left corner, telling you that you have no running debug session. Press :code:`Start Process Debug` to start a session.
- If no notification appears, start a debug session with the command :code:`Axon Ivy: Attach Process Debugger`
- After starting the session, the :ref:`designer-views-run-and-debug-view` should indicate that you have a new debug session running. You should also see the debug toolbar.
- Start your process simulation. The simulation should stop at the breakpoint and you can inspect the variables in the :ref:`designer-views-run-and-debug-view`.

.. figure:: /_images/designer/debug/debug_process.png


.. _debug-java:

Java Debug
----------
- Set a breakpoint somewhere in a Java file as described here `Setting a breakpoint <https://code.visualstudio.com/docs/debugtest/debugging#_breakpoints>`_
- Update the :ref:`designer-settings-vmargs` setting with the string :code:`-agentlib:jdwp=transport=dt_socket,server=y,address=*:8000,suspend=n`
- Restart the extension, so that the settings can take effect by running :code:`Developer: Reload Window`
- Create a new :code:`launch.json` configuration as described here: `Create a debug configuration file <https://code.visualstudio.com/docs/debugtest/debugging-configuration#_create-a-debug-configuration-file>`_
- Select `Java`
- Then add a java launch configuration to your :file:`.vscode/launch.json` file.

.. code-block:: json

    {
        "version": "0.2.0",
        "configurations": [
            {
                "type": "java",
                "name": "Debug Axon Ivy Dev Engine",
                "request": "attach",
                "hostName": "localhost",
                "port": "8000"
            }
        ]
    }

Starting your process simulation should now stop at the breakpoint and let you inspect you Java classes.
