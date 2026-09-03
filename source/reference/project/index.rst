.. _project-descriptor:

Project Descriptor
------------------

Each Axon Ivy project has a Maven project descriptor, :file:`pom.xml`. The
POM defines the project's Maven coordinates and its dependencies to other
projects and libraries.

Project coordinates
~~~~~~~~~~~~~~~~~~~

The project's ``groupId``, ``artifactId`` and ``version`` identify it in
Maven. Define all three values in the project's own POM so that other
projects can reference it. The ``artifactId`` is the project name and the
version should follow Maven's version format.

Adding a dependency
~~~~~~~~~~~~~~~~~~~

Add dependencies to the ``<dependencies>`` section of the POM. Every
dependency is identified by its Maven coordinates: ``groupId``,
``artifactId`` and ``version``. The version can be omitted when it is
provided by the project's parent POM or dependency management.

For example, the following dependency references another Axon Ivy project.
It can be in the same workspace or in a Maven repository:

.. code-block:: xml

   <dependencies>
     <dependency>
       <groupId>com.example</groupId>
       <artifactId>customer-project</artifactId>
       <version>1.0.0-SNAPSHOT</version>
       <type>iar</type>
     </dependency>
   </dependencies>

Axon Ivy projects are IAR artifacts. Always set ``<type>iar</type>`` when
adding an Axon Ivy project dependency. The ``groupId``, ``artifactId`` and
``version`` must match the referenced project's POM. Projects outside the
workspace are resolved from the configured Maven repositories.

The Designer displays projects resolved from Maven repositories in the
:ref:`designer-maven-view`. The :ref:`project-build-plugin` handles these
dependencies automatically during a Maven build.

Maven libraries
~~~~~~~~~~~~~~~

Libraries published to a Maven repository use the same coordinates. JAR
dependencies normally use Maven's default type, so no ``<type>`` is needed:

.. code-block:: xml

   <dependency>
     <groupId>org.apache.commons</groupId>
     <artifactId>commons-lang3</artifactId>
     <version>3.17.0</version>
   </dependency>

Maven resolves these dependencies from the repositories configured in the
POM or inherited from its parent. The dependency's classes and resources are
then available to the project according to its Maven scope.


.. _ivy-project-properties:

Ivy Project Properties
~~~~~~~~~~~~~~~~~~~~~~

The :file:`.ivyproject` file contains the current project version and the project name.
The project name is used to match the project during redeployment.

