.. _process-extensions:

Process Extensions
===================

Axon Ivy processes have a rich set of standard elements to fulfill
frequently required needs. 

However, the available elements can be extended 
to address your custom requirements.
Here we will elaborate on the extensions possibilities, 
empowering you to build your own elements.


.. _connector-process-elements:

Connector Elements
--------------------------------

Connector elements are the simplest and most effective way to build 
your custom element, encapsulating your logic.
The best thing about it? Creating such an Element doesn't require 
special new skills apart from being familiar 
with Axon Ivy Processes and their elements.

Callable Sub Processes
^^^^^^^^^^^^^^^^^^^^^^^^^^^

So this is for you if you have implemented something, that you 
call repetitively from multiple processes. 
Normally, all you change when you reuse this logic 
is just the process data you work with.
To name a few: 

- a custom logic in Java wrapped in a Script Activity, 
- a RestClient which you use frequently, 
- or a set of process elements that you use as a pattern.

Instead of copying and pasting such logic into multiple processes, 
you can refactor them into a :ref:`Sub Process<process-kind-callable>`. 
Sub Processes wrap your logic behind a defined interface, 
declaring your input and output parameters.
This gives you the freedom to reuse its logic without 
additional maintenance efforts.

|connector-process|

The journey starts, now wrap your logic as follows:

#. Create a new Process using the :ref:`process-new-wizard`. 
   Select the type `Callable Sub Process` and finish the creation wizard.

#. Name the automatically defined start event, 
   and define your required input parameters and the results you want to provide.

#. Copy your custom logic into the Sub Process 
   and connect it with the provided start and end event.

This allows you already to reuse this encapsulated Sub Process 
logic in many Processes.
You can do it by using the :ref:`process-element-call-sub` Activity and selecting 
your just-built Sub Process as the target. Connect it, pass parameters to 
and fro and you are done. 

Custom Element feeling
^^^^^^^^^^^^^^^^^^^^^^^

Now let's go one step further and make 
the :ref:`process-element-call-sub` activity
look more like a distinct element that can easily be recognized.

Go to the :ref:`process-element-sub-process-start` event 
and add your custom icon onto it using the 
elements :ref:`process-editor-quick-actions`. 
This icon will be shown not only on this start 
but on all calling elements too. This makes your 
Sub Process way more popular and easier to identify.

To make this Sub Process even more popular for third parties,
we can make it appear in the process editor's palette.
Go to the Sub Process start event and open its :ref:`inscription<process-inscription-view>`.
In the :ref:`process-element-tab-general`, add the :ref:`tag<process-element-tab-general-tags>` `Connector` and save the Process.
Being tagged, the element now appears 
in the :ref:`Extensions<process-element-extension-item>` section, 
accessible for all Projects that depend upon yours.

|use-connector|

Community
^^^^^^^^^^^^^^

Proud of your work, you may `contribute <https://github.com/axonivy-market/market/wiki>`_ this Sub Process 
to the Axon Ivy `Market <https://market.axonivy.com/>`_. 
So the Axon Ivy community can reuse and profit from your work.
You may choose to do so, to simplify your own maintenance efforts,
as the Market offers you a rich ecosystem that manages versions,
distributions, and automated test infrastructure for free.

Limits
^^^^^^^^^^

The only limitation you may face by re-using logic in Sub Processes
is the absence of a similar construct for custom Start Events
or custom Intermediate Events.

You can invent such custom logic nevertheless, 
by using :ref:`extensible-process-elements`,
which are explained in the next chapter.

.. |use-connector| image:: /_images/process-editor/connector-user.png
.. |connector-process| image:: /_images/process-editor/connector-process.png


.. _extensible-process-elements:

Extendible Process Elements
----------------------------

Axon Ivy comes with generic process elements that can be used to
address particular execution behavior requirements none of the standard
process elements can fulfill.

All generic process elements contain a tab in which a Java class can be
selected. The Java class implements the actual execution behavior. 
Some standard implementations are shipped with the Axon Ivy core, and with
these elements developers are able to specify their own implementation
as part of the project.

These generic elements are:

:ref:`process-element-program-start`
   Triggers the start of a new process upon an (external) event.

:ref:`process-element-wait-program-intermediate-event`
   Interrupts process execution until an (external) event occurs.

:ref:`process-element-pi`
   Executes generic Java code (may interact with a remote system).
