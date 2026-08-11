.. _process-element-pi:

PI (Programming Interface) Activity
===================================

|element| The *Program Interface Activity* element is located in the
*Activity* drawer of the process editor palette.

.. _ivy.processmodels.elements.pi.element:

Element Details
---------------

The Program Interface Activity integrates custom-made software, 
legacy systems, proprietary applications or any other external system through a
Java interface into the process workflow.

Scope
~~~~~~~~~
If you just need to call some Java code within your workflow, 
it's normally preferable to do this via the :ref:`process-element-script-activity`.

If not only Java code must be called, but process logic, too, 
you are better off with calling a re-usable :ref:`Callable SubProcesses <process-kind-callable>`
that wraps your complex logic.

Furthermore, :ref:`Callable SubProcess Start <process-element-tab-start>` elements
contain an expressive input/output parameter descriptor. This infrastructure
often makes the need for a hand-crafted configuration Editor obsolete.
In addition, these starts can be enriched with an illustrative logo and 
will appear prominently as connectors in the palette if tagged as such.

Still, there might be edge cases where you prefer the programmable element infrastructure.
For instance as you like the style, and already built up knowledge on it while
implementing a :ref:`process-element-program-start` or a :ref:`process-element-wait-program-intermediate-event` bean.



Inscription
---------------

Java Bean Tab
~~~~~~~~~~~~~

On this tab you define the Java class to be executed.

.. figure:: /_images/process-inscription/program-interface-tab-start.png
   :alt: Start tab

   Start tab

Java Class
   Fully qualified name of the Java class that implements the
   :public-api:`IUserProcessExtension </ch/ivyteam/ivy/process/extension/IUserProcessExtension.html>`
   interface. 

Program
   Defines the :ref:`process-element-error-start` element which can handle execution errors.

Timeout
   Defines a timeout for the return call to the Java PI class.
   A timeout error can be handled by a catching :ref:`process-element-error-start`.


Configuration Tab
~~~~~~~~~~~~~~~~~

The custom editor UI provided by the implementation of 
:public-api:`IUserProcessExtension </ch/ivyteam/ivy/process/extension/IUserProcessExtension.html>`
allows to configure its execution.

.. figure:: /_images/process-inscription/program-interface-tab-configuration.png
   :alt: Editor Tab

   A custom editor example


Implementation
---------------

.. include:: _programMaven.rst

API reference
~~~~~~~~~~~~~~~~~~~~

The Program Interface Activity consumes a Java class that implements the
:code:`ch.ivyteam.ivy.process.program.activity.ProgramExecutor` interface.

By implementing the :code:`newExecution()` method, you can define 
the execution behavior of the Program Interface Activity.

.. include:: _programEditor.rst


Access configuration
~~~~~~~~~~~~~~~~~~~~~

If your program implements an editor with widgets,    
you can access the configured values of a process element in your program 
implementation from the :code:`ch.ivyteam.ivy.process.program.exec.ProgramContext`
through the :code:`config()` method.

The context also provides :code:`script()` as entry point to
evaluate dynamic expressions configured on Script or Text widgets.

If you change the configuration format at some point in time,
you can migrate existing element configurations by implementing
the :code:`ch.ivyteam.ivy.process.program.migrate.ProgramConfigMigrator` interface.

 
Example implementation
~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: includes/process-samples/src/com/axonivy/wf/custom/ErpLoader.java
      :language: java
      :linenos:


.. |element| image:: /_images/process-editor/elements/program-interface.png
.. |add-button| image:: /_images/ui-icons/plus.svg
  :width: 2em
