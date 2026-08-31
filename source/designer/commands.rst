Commands
========


.. _designer-import-project:

Importing a Project
--------------------

You can import existing Axon Ivy projects into your workspace using the
:code:`Axon Ivy: Import Axon Ivy Project Archive (.iar or .zip)` command.


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


.. _designer-market-install:

Install Market Products
-----------------------

Our :ref:`Axon Ivy Market <market>` has many already built connectors to 3rd-party systems, utilites or demos 
that you can easily integrate into your Axon Ivy projects.
Run the :code:`Axon Ivy: Install Market Product` command to integrate these market products 
or run the command :code:`Axon Ivy: Install Local Market Product` to integrate market products 
from a local source into your project.

.. _importing-demo-projects:

Importing demo projects
~~~~~~~~~~~~~~~~~~~~~~~

We have several demo projects which explain some typical use cases, e.g.:

**Connectivity Features**
    Demonstrates the consuming and providing of :ref:`integration-rest` with ivy.
   
**Error Handling Demos**
    Samples that demonstrate the :ref:`error-handling`.

**Html Dialog Demos**
    Demonstrates several JSF components that can be used in :ref:`html-dialogs`.
   
**Workflow Demos**
    Demonstrates how to handle typical Workflow use cases, makes use of features like :ref:`Signals <signal-reference>` and :ref:`business-data`


