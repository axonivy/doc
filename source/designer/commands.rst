Commands
========


.. _designer-import-project:

Importing a Project
--------------------

You can import existing Axon Ivy projects into your workspace using the
:code:`Axon Ivy: Import Axon Ivy Project Archive (.iar or .zip)` command.


.. _importing-demo-projects:

Importing demo projects
~~~~~~~~~~~~~~~~~~~~~~~

The Axon Ivy Designer can import several demo projects, which are
provided from our Market (internet connection needed). Those
demo projects are in the Axon Ivy Archive (\*.iar) format and can be imported
with the help of the :ref:`Axon Ivy Market <market>`.

The following projects are available for Axon Ivy Designer:

.. table:: Demo projects for the Designer.

   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Project name       | Demo content                                                                                                                                                      |
   +====================+===================================================================================================================================================================+
   | ConnectivityDemos  | Demonstrates the consuming and providing of :ref:`integration-rest` with ivy.                                                                                     |
   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ErrorHandlingDemos | Samples that demonstrate the :ref:`error-handling`.                                                                                                               |
   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | HTMLDialogDemos    | Demonstrates several JSF components that can be used in :ref:`html-dialogs`.                                                                                      |
   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | RuleEngineDemos    | Shows how to use the :ref:`rule-engine`.                                                                                                                          |
   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | WorkflowDemos      | Demonstrates how to handle typical Workflow use cases, makes use of features like :ref:`Signals <signal-reference>` and :ref:`business-data`                      |
   +--------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+


.. _designer-export-project:

Exporting a Project
--------------------

Axon Ivy projects can be exported from the workspace with the 
:code:`Axon Ivy: Export Axon Ivy Project Archive (.iar)` command.



.. _project-convert:

Converting Projects
-------------------

You can convert your Axon Ivy projects to the latest project format using the
:code:`Axon Ivy: Convert Project` command. When run, the command, the conversion log 
will show up in the console view.


Converting Project Version
~~~~~~~~~~~~~~~~~~~~~~~~~~

If the project format version changes with a new Axon Ivy release, then
old projects will show an error marker, describing them as *out of date*
or having an invalid version. 

If you inspect your project's properties file :file:`.ivyproject`, you will see the project version. 
You will also see a warning indicator, when the project is out of date. 

Axon Ivy can convert your old projects automatically to the newest
project format for you. During this process, all existing artifacts will
be converted (if necessary) so as to work with the new Axon Ivy version,
and any missing but required artifacts will be added.

.. warning::   

   It is absolutely recommended that you create a copy of your project
   before invoking the conversion. Alternatively you can have your
   project under version control. In this case, make sure that all your
   projects are checked in, before you invoke the conversion, so that
   you can easily roll back (revert) to the old version, if conversion
   should fail for some reason.

In the :ref:`migration-notes`, migration tasks marked with |tag-project-auto-convert| 
will run with this command.

