.. _process-element-wait-program-intermediate-event:

Wait Program Intermediate Event
===============================

|element| The *Wait Program Intermediate Event* element is located in the
*Event & Gateway* drawer of the process editor palette.


Element Details
---------------

This element is one of Axon Ivy facilities to integrate custom-made
software, legacy systems, proprietary applications or any other external
system through an Axon Ivy Java interface. At an Intermediate Event
element the process execution is interrupted and waits for an external
event to occur. Technically spoken the current task will be ended and a
new system task is created that waits for the intermediate event. If the
intermediate event is fired the new task and therefore the process after
the intermediate event will be executed.


Inscription
-----------

.. include:: _tab-name.rst

Event Tab
~~~~~~~~~

On this tab you define the Java class that the IntermediateEvent should
instantiate, the identifier of the event, and the timeout behavior.

|image2|

Java Class
   Fully qualified name of the Java class that implements the
   :public-api:`IProcessIntermediateEventBean </ch/ivyteam/ivy/process/intermediateevent/IProcessIntermediateEventBean.html>`
   interface.

Event ID
   Because multiple cases (process instances) can wait on the same
   intermediate event you must specify which event belongs to which
   waiting case. Here, you specify the identifier of the event the
   current case should wait for.

   .. warning::

      The event identifier as a String must be unique. Do not use a
      static string like ``"myID"``. A good practice is to integrate the
      case identifier (``ivy.case.getId()``) into the event id.

Timeout
   You can specify how long the current case should wait for an intermediate 
   event, and what will happen if no event has been received after this time. 
   You may optionally start an exception process, delete the waiting task,
   or continue the waiting task without receiving an intermediate event.


Configuration Tab
~~~~~~~~~~~~~~~~~

The custom editor UI provided by the implementation of 
:public-api:`IProcessIntermediateEventBean </ch/ivyteam/ivy/process/extension/IProcessIntermediateEventBean.html>`
allows to configure its execution.

.. figure:: /_images/process-inscription/wait-intermediate-event-tab-configuration.png
   :alt: Editor Tab

   A custom editor example


.. include:: _tab-task-call-wait.rst

.. include:: _tab-output.rst



Implementation
---------------

.. include:: _programMaven.rst

API reference
~~~~~~~~~~~~~~~~~~~~

The Program Intermediate Event consumes a Java class that implements the
:code:`ch.ivyteam.ivy.process.intermediateevent.IProcessIntermediateEventBean`
interface. 

The common way to implement a Program Intermediate Event is:

1. Implement the :code:`initialize()` method:
   
   - fetch the :code:`IProcessIntermediateEventBeanRuntime` and keep it in a member variable for later use
   - define the polling interval to check for new runs
   - (optional) read configuration parameters from custom widgets
  
2. Implement the :code:`poll()` method:
   
   - check for new runs and call the method :code:`fireProcessIntermediateEventEx()` of
     :code:`IProcessIntermediateEventBeanRuntime` to continue the process

If you use an Axon Ivy Cluster, you may mark your implementation with the
:public-api:`IMultiNodeCapable </ch/ivyteam/ivy/process/beans/IMultiNodeCapable.html>` interface. 
This will enable your Intermediate Event to be processed not only on the master node, 
but on all available nodes.


Custom configuration
~~~~~~~~~~~~~~~~~~~~

Very likely your Intermediate Event implementation will accept configuration parameters
defining the local environment. For instance, a system specific file path to look for files
being produced by a legacy system. 

We help you with these configurations by providing an accessor for static 
element configuration via :public-api:`getConfig() </ch/ivyteam/ivy/process/intermediateevent/AbstractProcessIntermediateEventBean.html#getConfig()>`.


.. include:: _programEditor.rst


Example implementation
~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: includes/process-samples/src/com/axonivy/wf/custom/ErpPrintJob.java
      :language: java
      :linenos:



.. |element| image:: /_images/process-editor/elements/intermediate-wait.png
.. |image2| image:: /_images/process-inscription/wait-intermediate-event-tab-event.png
.. |add-button| image:: /_images/ui-icons/plus.svg
  :width: 2em
