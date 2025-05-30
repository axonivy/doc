.. _continuous-integration:

Continuous Integration
======================

Axon Ivy Projects are designed to be built on a continuous integration (CI)
server like Jenkins.


Maven build plugin
------------------

The `project-build-plugin <https://axonivy.github.io/project-build-plugin>`__
is a Maven plugin that can build Axon Ivy Projects on a developer machine or
on a continuous integration server. The plugin provides the following
main features:

-  **Compilation** of Axon Ivy Projects

-  **Testing** of unit tests against an Axon Ivy Project or the Axon Ivy core
   classes

-  **Packaging** of built Axon Ivy Projects as IAR (ivy archive) artifacts

-  **Installation** of IAR artifacts into the local Maven repository

-  **Deployment** of IAR artifacts to an Axon Ivy Engine


Runtime
~~~~~~~

The Designer has a built in Maven runtime that allows to start Maven
with zero initial configuration effort. A local maven build can be
started as follows:

1. Switch to the Java perspective

2. Expand an Axon Ivy Project in the Axon Ivy Project Tree view

3. Open the context menu of the file ``pom.xml`` by right clicking it

4. Navigate to :guilabel:`Run as` > :guilabel:`Maven install`


Configuration
~~~~~~~~~~~~~

Axon Ivy Projects declare its ids and dependencies in the
:ref:`project-deployment-descriptor`. This deployment descriptor
can be easily edited with the corresponding Axon Ivy editor and is stored as
Maven Project Object Model (``pom.xml``). Therefore each Axon Ivy Project has by
default the ``pom.xml`` which is needed by maven to build it.

However advanced Maven users can adjust this default configuration and
use additional Maven plugins or dependencies in the pom.xml. But not all
POM entries should be modified, some are required or limited in usage in
Axon Ivy Projects:

-  ``<groupId/>``\ and ``<version/>``\ Must be set in every Axon Ivy Project
   POM. It can not be inherited from a parent POM (even tough this is
   valid in plain Maven).

-  ``<packaging>iar</packaging>`` Provides the custom Axon Ivy Project
   lifecycle, must not be modified.

-  Dependencies with ``<type>iar</type>`` will be manipulated by the
   :ref:`project-deployment-descriptor`. Therefore additional
   configurations like the ``<scope>`` could get lost trough the simple
   editor usage.

-  Values that can be manipulated with the simple
   :ref:`project-deployment-descriptor` can not contain Maven
   properties. For instance ``<version>${myVersionProp}</version>`` is
   prohibited.

-  The version must be qualified like
   ``<version>5.0.0-SNAPSHOT</version>.`` A version like
   ``<version>5-SNAPSHOT</version>`` is prohibited.


Technical documentation
~~~~~~~~~~~~~~~~~~~~~~~

-  The detailed plugin goal and parameter documentation is on
   `Github.io <https://axonivy.github.io/project-build-plugin>`__

-  The source code of the Axon Ivy project build plugin is available on
   :link-url:`Github.com <build-plugin>`.


Continuous Integration Job with Jenkins
---------------------------------------

The following steps are needed to build an Axon Ivy Project on a Jenkins CI
server.

#. Install Jenkins as described in the `Jenkins
   Wiki <https://wiki.jenkins.io/display/JENKINS/Installing+Jenkins>`__

#. Install a Maven runtime in Jenkins via :guilabel:`Manage` >
   :guilabel:`Configure` > :guilabel:`Maven` >
   :guilabel:`Maven installation` > :guilabel:`Choose auto installation`

#. Create a new Jenkins Job. Select :guilabel:`Maven-Project` as job style.

#. Provide a link to the source code of the Axon Ivy Project in the
   ``Source-Code-Management`` section

#. Configure the goals ``clean verify`` in the :guilabel:`Build` section

#. :guilabel:`Save` the Job and :guilabel:`Run` it
