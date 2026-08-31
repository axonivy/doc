Views
=====

.. _debugger-debug-view:

Debug View
----------

.. _debugger-debug-process:

Process Debug
~~~~~~~~~~~~~

tbd

.. _debugger-debug-java:

Java Debug
~~~~~~~~~~

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


.. _problems-view:

Problems View
-------------

tbd


.. _runtimelog-view:

Runtime Log View
----------------

The Runtime Log view displays a list of events. This events occur during
the simulation. 

-> tbd: add screenshot of view

Accessibility
~~~~~~~~~~~~~

Command: :code:`Axon Ivy: Open Axon Ivy Runtime Log`


How to log
~~~~~~~~~~

Besides the log events of some process elements, you can also log your own events.
Open any process elements that contain IvyScript (like: Step, Web
Service, etc.) and type a script like the one you find in the figure
below:

.. literalinclude:: includes/log.txt
    :language: java

Find out more about Axon Ivy scripting language :ref:`ivyscript`.
