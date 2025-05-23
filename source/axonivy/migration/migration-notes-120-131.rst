.. _migrate-120-131:

Migrating from 12.0 to 13.1
===========================

Upgrade to 13.1 is only supported from an Axon Ivy Engine 10.0 and higher.
If you have an Axon Ivy Engine older than version 10.0 you need to first 
migrate to a version between 10.0 and 12.0.

License
*******

|tag-ops-changed|

You need to request a new license for Axon Ivy Engine 13.1.


Removal of Server Control Center for Windows
********************************************

|tag-ops-changed|

The Server Control Center for Windows has been removed. Prefer using Docker for
Windows to run the Axon Ivy Engine. If you still want to run the Axon Ivy Engine
on Windows without Docker, you can use :ref:`AxonIvyEngineService.exe
<engine-service>` to register the Axon Ivy Engine as a Windows Service.



Multiple responsibles for a task and multiple roles for process starts
**********************************************************************

|tag-project-changed| 

It's now possible to assign multiple responsibles to a task. There is no need to
create dynamic roles anymore. You can simply assign a task to different roles if
needed. You will notice that you can configure on the task tab multiple
responsibles e.g. :ref:`Task Tab <process-element-tab-task>`. The same is also
true for the expiry task configuration.

All API's have been deprecated, which handles only one responsible. They were
previously named :code:`activator`, therefore we have streamlined the naming to
:code:`responsible` from deep in the core to the user interface, everywhere. Use
the new API`s:

- :code:`ch.ivyteam.ivy.workflow.ITask.responsibles()`
- :code:`ch.ivyteam.ivy.workflow.ITask.expiry()`

The same applies to process starts. It's now possible to define multiple roles
on a process start. You will notice that you can configure on the request tab
of a start multiple roles e.g. :ref:`Start Event
<process-element-start-request-tab-request>`.



Support for Case Scope Override removed
****************************************

Case scope overriding has been deprecated in LTS 8.0 and has now been removed.
Use :ref:`strict_overriding` if you rely on case scope overriding.


Removal of Serenity PrimeFaces themes
*************************************

|tag-project-removed|

We removed the Serenity themes, including the :code:`serenity-ivy` theme. 
Please use the :ref:`freya-ivy <freya-themes>` theme instead.


Removal of session role
***********************

|tag-project-removed| 

It was possible to assign a role directly to a session. This feature was
intended primarily for unauthenticated sessions. In authenticated sessions
(i.e., when a user is logged in), roles can and should be assigned directly to
the user. The original idea behind this feature was to support edge cases where
developers implemented their own authentication mechanisms—bypassing the
platform’s built-in user management—and needed to assign a role to the session
manually. This was made possible via the :code:`ISession#assignRole` method.
Roles are now only supported for authenticated sessions backed by a user who
has roles assigned, which means you now need to assign roles to a user.


Changed Runtime logger name
****************************************

|tag-ops-changed|

We changed the Runtime logger name from :code:`runtime.[app name].[pm name].[category]` to
:code:`runtime.[security context name].[category].[app name].[pm name]`.


.. container:: admonition note toggle

  .. container:: admonition-title header

     **Detail**

  .. container:: detail 

    We added the security context name to the Runtime logger name and moved the category after the security context name.
    This is to make the logger name more unique and to be able to filter by security context name.
    The new logger name is: :code:`runtime.[security context name].[category].[app name].[pm name]`.

    In case you have a custom :code:`log4j2.xml` configuration, you need to adapt the occurrences of the runtime logger name in your configuration.

    From something like this:

    .. code-block:: xml

      <Logger name="runtimelog.myapp.hrm.rest_client" level="DEBUG">
        <AppenderRef ref="RuntimeLog"/>
      </Logger>

    To something like this:

    .. code-block:: xml

      <Logger name="runtimelog.securitycontext.rest_client.myapp.hrm" level="DEBUG">
        <AppenderRef ref="RuntimeLog"/>
      </Logger>


Axon Ivy Public API Maven dependency
************************************

|tag-project-auto-convert|

We now include the Axon Ivy Public API as Maven dependency in the project's :code:`pom.xml` file.
To do this, we update the POM by adding :code:`ivy-project-parent` as parent and inserting the :code:`ivy-api` dependency.
This setup allows you to develop the Java part of an Axon Ivy project outside the Eclipse-based PRO Designer - for example with Visual Studio Code.
The conversion only takes place if no parent is defined in the :code:`pom.xml` of the project.
Currently, this Maven dependency is not required if you continue developing with the Eclipse-based PRO Designer.

------------

.. include:: _tagLegend.rst
