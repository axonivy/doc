Projects
========

Axon Ivy Projects are development modules that encapsulate the processes
and other artifacts that form an application. An Axon Ivy project roughly
comprises processes, User Dialogs, Data Classes, a Content Management System
and various configurations.

Projects can be reused when a project depends on functionality implemented by
another project, with the providing project called the **required project**
and the using project called the **dependent project**.

In the Designer, projects are created and organized in a VS Code
*workspace*. Required projects can be present in the workspace or resolved
from a Maven repository. See the :ref:`project-descriptor` for information
about declaring these dependencies in :file:`pom.xml`.

Project dependencies
--------------------

The following graph illustrates a project dependency:

.. graphviz:: project-depencency.dot
   :alt: Project A requires Project B, showing their IDs and versions

Dependencies can form a larger graph because required projects may have
dependencies of their own. All artifacts reachable through this graph can
be reused by the dependent project. The lookup order of directly referenced
projects determines which artifact is used when multiple projects provide
the same artifact.

.. graphviz:: project-dependency-multiple.dot
   :alt: Project dependency graph with multiple required projects

Ivy Archives
------------

Normal Axon Ivy projects are used to develop artifacts that change
frequently. Once the artifacts are stable, you can export the project to an
Axon Ivy Archive, a pre-built project stored in a single ``*.iar`` file.

For information about exporting and importing project archives, see the
:ref:`designer-export-project` and :ref:`designer-import-project` commands.
Imported archives can be viewed but not edited and do not have to be built or
validated again in the workspace.
