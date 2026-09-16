.. _debug:

Debugging
=========

This chapter covers the two setups in the Designer on how to debug: Process and Java code itself

.. _debug-process:

Process Debug
-------------

- Add breakpoint in the process editor
- VS Code will ask you to attach a debug session
- If later, show where to click (Axon Ivy Projects View or Command)
- Run Process, see how you focus on Run and Debug automatically



.. _debug-java:

Java Debug
~~~~~~~~~~

- Refer to config vmArgs
- Where to click to add launch.json
- Where to click to actually start the launch.json

You can debug java classes in the Axon Ivy Designer, by 
add :code:`-agentlib:jdwp=transport=dt_socket,server=y,address=*:8000,suspend=n` to the 
VM arguments of the engine, e.g. via :ref:`designer-engine-config-args`. 
If you do this change, you have to restart your engine, e.g. by run the :code:`Reload Window` command in Vs Code.

Then add a java launch configuration to your :file:`.vscode/launch.json` file.

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

