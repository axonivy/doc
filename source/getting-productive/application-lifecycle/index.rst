.. _application-lifecycle:

Application Lifecycle
*********************

Axon Ivy projects can be deployed to an Axon Ivy Engine to bring business
processes to life. Multiple projects can be installed and managed on a single
Axon Ivy Engine. This section explains how to manage individual Axon Ivy
projects on the engine.

Security System
---------------

Users, roles, and permissions are managed within a security system. :ref:`Users
<configuration-security-system>` can be managed manually or provided through an
identity provider. Role definitions are read from the project during deployment,
and the corresponding role structures in the Axon Ivy Engine are updated
accordingly. Roles can also be added or deleted at runtime.

By default, every Axon Ivy Engine includes the :code:`default` security system,
which is sufficient for most use cases. An additional security system is only
required if you want to set up a test environment on the same engine or operate
:ref:`multi-tenancy <multi-tenancy>`. Security systems are fully isolated from
one another and can contain multiple applications.

::

    Security System "default"
    │
    Security System "test"

.. _application:

Application
-----------

An application is part of a security system and contains one or more Axon Ivy
projects. Ideally, applications are organized around features and have their own
release cycles. In our example, the HR processes are independent of the
financial processes and can therefore be managed as separate applications.
Applications also have ownership of their configuration, including variables,
REST clients, web service clients, and databases.

::

    Security System "default"
    ├── Application "Finance"
    ├── Application "HR"
    Security System "test"
    └── Application "Finance"


.. _application-version:

Application Version
-------------------

An application is always versioned. When an application is deployed for the
first time, it is assigned version 1. Projects are part of an application
version. This means that different versions of the same project can run
simultaneously on the same Axon Ivy Engine, as long as they belong to different
application versions.

::

    Security System "default"
    ├── Application "Finance"
    │   └── Application Version 1
    ├── Application "HR"
    │   └── Application Version 1
    │   └── Application Version 2
    Security System "test"
    └── Application "Finance"
        └── Application Version 1

Application versions allow you to make breaking changes to projects without
affecting cases that are already running in an older version. The disadvantage
of maintaining multiple application versions is that each version must be
maintained separately. For example, a bug fix may need to be applied to multiple
versions. Tasks and cases are always assigned to a specific application version.

An application version has a release state. The release state of a application
version is responsible how the version is used by the Axon Ivy engine. The most
important release state is the state :code:`RELEASED`. Within an application
only one version can be in this state. All projects that are started in an
application are started in the released application version. A complete list of
release state can be found in the following list:

.. rubric:: Release States

* **CREATED**: The application version has been created in the database but is
  not yet ready for use.

* **PREPARED**: The application version is fully set up and ready to be
  released.

* **RELEASED**: The application version is the currently released version. All
  new processes are started in this version. Program Start, Web Service Process,
  and REST endpoints are only active for application versions in this state.
  Only one application version per application can be **RELEASED** at a time.
  When a new application version is released, the previously released version is
  changed to **DEPRECATED** or **ARCHIVED**.

* **DEPRECATED**: Open cases can still be completed in this application version,
  but no new cases are started in it. New cases are only started in the
  **RELEASED** application version.

* **ARCHIVED**: The application version is no longer active. No new processes
  can be started, and open cases can no longer be completed in this version.


.. rubric:: Release State Transitions
 
.. graphviz:: release-states.dot


.. _project:

Project
-------

A project represents an Axon Ivy project developed in the Axon Ivy Designer. It
contains the business processes and related resources that make up a functional
part of an application. This includes process models, user interfaces, data
models, code, and other configuration required to implement the business
processes. Projects are developed and maintained independently in the Axon Ivy
Designer and are deployed as part of an application version to an Axon Ivy
Engine.

::

    Security System "default"
    ├── Application "Finance"
    │   └── Application Version "1"
    |   |   └── Project "Invoice" (12 cases)
    |   └── Application Version "2"
    |       └── Project "Invoice" (104 cases)
    ├── Application "HR"
    │   └── Application Version "1"
    |       └── Project "Vacation" (4 cases)
    |       └── Project "Expenses" (8 cases)
    Security System "test"
    └── Application "Finance"
        └── Application Version "1"
            └── Project "Invoices" (4 cases)


Feature driven
--------------

In Axon Ivy, a project consists of one or more related processes. Applications
consist of one or more projects. If you structure your Axon Ivy projects well
into several applications, you benefit from processes being technically isolated
and having independent release cycles. Understanding the application lifecycle
helps developers and administrators to implement projects faster.

Imagine a process developer who digitizes business processes with the Axon Ivy
Designer in an Axon Ivy project. At some point, he deploys his resulting
processes onto an Axon Ivy Engine and brings them to life. At that time, he has
to package his projects into an application. For deployment, it is suitable to
package a complete application from one or more projects that belong together
and then deploy the resulting application. A simple example:

|

*Lynn is a low coder and is digitizing business processes for the HR
department. She has just finished her first process so that employees can
report expenses. She has packaged this process into the report-expense
project and is packaging this project into an application called HR.*

|

.. graphviz:: hr-app.dot
  :align: center

|

*John is a software developer and develops business processes for the finance
department. He has already successfully implemented several processes with
Axon Ivy. To structure the processes well, he has packaged them into different
Axon Ivy projects and packages them into the finance application.*

|

.. graphviz:: finance-app.dot
  :align: center

|

*John and Lynn are independent in their work both from a business point of view
- requirements and change requests from their departments (HR and Finance), as
well as from a technical point of view. They can develop in a decoupled manner
and install their applications on the same Axon Ivy Engine whenever they want.*

|

Thus, applications containing processes are deployed on an Axon Ivy Engine. The
process users log in and can start the processes and are assigned to work on
tasks. It is essential to understand how users are managed on an Axon Ivy
Engine. The users are part of a security system. Each Axon Ivy Engine always
comes with the `default` security system. Adding more security systems only
makes sense in a :ref:`multi tenancy <multi-tenancy>` use case. Users, their
roles, and permissions are part of the security system. When you create an
application, you have to define which security system this application lives in.
By default, a new application is put into the `default` security system.

|

*Now Gunther comes into play. Gunther runs the Axon Ivy Engine for the DevOps
Lynn and John. The process users are synchronized from the company Active
Directory. Process users only have one unified process start list and task list
covering all applications.*

|

.. graphviz:: engine.dot
  :align: center

Applications are used by developers to package related processes and
enable independent release cycles of different processes. This promotes
feature-driven development. The process users do not realize that the individual
processes are part of different applications. They only have a unified process start
list and one task list. The structure of the projects can also change at any time.

Read :ref:`deployment` If you want to learn how you can craft your own
applications and deploy them on an Axon Ivy Engine.
