.. _simulate-process-models:

Simulating processes
====================

This chapter deals with Axon Ivy debugging and simulation features.
Processes, workflows, User Dialogs and changes on these should be tested
before being deployed on an Axon Ivy production Engine. Therefore the
Designer allows to simulate processes on your local computer, to debug
it in depth and to inspect the execution history of all variable values.
Hereby the process flow can be animated to visually observe the actual
process execution sequence.


Start a simulation
------------------

A simulation can be started directly on the :ref:`Start Element
<process-editor-quick-actions-start-process>` or on the :ref:`dev-workflow-ui`.


Preferences
~~~~~~~~~~~

You are able to control the simulation flow and speed in the :ref:`preferences <designer-animation-config>`.


.. _language-settings:

Language Settings
~~~~~~~~~~~~~~~~~

You can configure the language and formatting settings for a specific user in the :ref:`dev-workflow-ui`.
:ref:`Workflow languages <workflow-languages>` can be added in the :ref:`engine-cockpit-security-system-detail`, 
so the case and task name and descriptions are stored multilingual.



.. _simulate-process-models-breakpoints:

Breakpoints
~~~~~~~~~~~

A breakpoint is a marker that tells the simulation engine to pause the
execution. It is then possible to inspect the execution history, to view
the values of internal variables and evaluate user defined expressions
without being interfered by the running execution. The execution has to be
resumed by the user explicitly using the functionality of the
:ref:`Debug View <debugger-debug-view>`.

.. _process-element-breakpoints:

Process Element Breakpoints
^^^^^^^^^^^^^^^^^^^^^^^^^^^

A process element breakpoint is a breakpoint that can be set on a
process element. The execution of the process will be interrupted before
the process element is executed.

**Add / Remove a breakpoint**

You can add process element breakpoints in a :ref:`process-editor` by using the :ref:`Quick Action Menu
<process-editor-quick-actions-toggle-breakpoint>`. Select the process step on
which you intend to set the breakpoint and click on the bug.

**Disable a breakpoint**

You can disable a specific breakpoint in the :ref:`debugger-debug-view` or by clicking
on the breakpoint in the :ref:`process-editor`. It is also possible to disable all
breakpoints in the :ref:`debugger-debug-view`. 
