.. _continuous-integration:

Continuous Integration
======================

Axon Ivy Projects are designed to be built on a continuous integration (CI)
server (e.g. `Jenkins <https://www.jenkins.io/>`__, `GitHub Actions <https://github.com/features/actions>`__, etc.).


.. _project-build-plugin:

Maven build plugin
------------------

The `project-build-plugin <https://axonivy.github.io/project-build-plugin>`__
is a Maven plugin that can build Axon Ivy Projects on a developer machine or
on a continuous integration server. The plugin provides the following
main features:

-  **Compilation** of Axon Ivy Projects

-  **Validation** of Axon Ivy processes and configurations

-  **Testing** of unit tests against an Axon Ivy Project or the Axon Ivy core
   classes

-  **Packaging** of built Axon Ivy Projects as IAR (ivy archive) artifacts

-  **Installation** of IAR artifacts into the local Maven repository

-  **Deployment** of IAR artifacts to an Axon Ivy Engine


Runtime
~~~~~~~

If you like to build you Axon Ivy Project with Maven, you need to have Maven installed on your system.
Now you simply run maven command beside you ``pom.xml`` file (e.g. :code:`mvn clean verify`).

The :ref:`designer-guide-vscode` has Maven capabilities built-in, if you have the
`Maven for Java <https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven>`__ extension installed 
(what should be the case if you have our extension installed).

1. Open the :ref:`designer-maven-view`

2. Open the context menu of the project by right clicking it

3. Navigate to :guilabel:`Run Maven Commands` > :guilabel:`verify`


Configuration
~~~~~~~~~~~~~

Axon Ivy Projects declare their Maven coordinates and dependencies in the
:ref:`project-descriptor`, stored as Maven Project Object Model (``pom.xml``).
Therefore each Axon Ivy Project has a ``pom.xml`` which is needed by Maven to
build it.

However advanced Maven users can adjust this default configuration and
use additional Maven plugins or dependencies in the pom.xml. But not all
POM entries should be modified, some are required or limited in usage in
Axon Ivy Projects:

-  ``<groupId/>``\ and ``<version/>``\ Must be set in every Axon Ivy Project
   POM. It can not be inherited from a parent POM (even tough this is
   valid in plain Maven).

-  ``<packaging>iar</packaging>`` Provides the custom Axon Ivy Project
   lifecycle, must not be modified.

-  The version must be qualified like
   ``<version>5.0.0-SNAPSHOT</version>.`` A version like
   ``<version>5-SNAPSHOT</version>`` is prohibited.


Technical documentation
~~~~~~~~~~~~~~~~~~~~~~~

-  The detailed plugin goal and parameter documentation is on
   `Github.io <https://axonivy.github.io/project-build-plugin>`__

-  The source code of the Axon Ivy project build plugin is available on
   :link-url:`Github.com <build-plugin>`.

