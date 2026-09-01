
Cases and Tasks
---------------

The Axon Ivy workflow manages the execution of **process instances**. A **process
instance** is represented by one **Case** and one or more **Tasks**. The
**Case** exists from the first process step until the last process step and
holds information about its **process instance**. The **Case** is finished when
the process is terminated - either completed or aborted. A **Case** is composed
of one or more connected **Tasks**. Each **Task** defines a unit of work, which
has to be done as one working step. Therefore, a **Task** is to be executed by a
user or role - the **Task** is assigned to a user or a role. A **Task** is
started by a process-start or a task-switch element and ends at the next
task-switch element or process-end element.

|image0|

.. _workflow-languages:

Multilingual Name and Description of Cases and Tasks
====================================================

You can define the name and description of a :ref:`case
<process-element-tab-case>` or :ref:`task <process-element-tab-task>` using
multilingual texts from the CMS. Because of performance and system database
space reasons, name and description are only stored in the configured workflow
languages and not for every language available in the current CMS. Configure
available Workflow languages using :ref:`Security System
<engine-cockpit-security-system-detail>` in the :ref:`Engine Cockpit
<engine-cockpit>` or, for the Designer, in the :ref:`Language Settings
<language-settings>`.

An end user sees the name and description of a case or task in his preferred
language if that language is a supported workflow language. If not, the default
workflow language is used. This same language is used when searching for and
sorting the names and descriptions of cases and tasks.

As a process developer, you should configure the primary language of your
process application as its default workflow language. Add additional workflow
languages only if you use multilingual texts from the CMS in your case and task
inscriptions and if you have supplied them in multiple languages. If your
projects support different sets of languages, consider to configure only the
common set of languages that all your projects support as additional workflow
languages.

Cases and tasks support only those languages available at their creation. If you
add another workflow language to an existing application with active cases and
tasks, then

- the name and description in the default workflow language of all your existing
  cases and tasks are copied to the new language. 

- all existing cases and tasks do not support the new language.

- cases and tasks added later support all languages available at the time of
  their creation.  
  
.. note:: 

   Adding workflow languages increases the size of your system database and may
   take a long time because the name and description in the default workflow
   language of all existing cases and tasks are copied to all new workflow language
   entries for their names and descriptions.

.. note:: 

   You can use CMS entries and workflow data in task names, as shown below:
   :code:`<%=ivy.cms.co("/TaskDescriptions/verifyRequest")%>: <%=in1.amount%> <%=ivy.cms.co("/Dialogs/procurementRequest/piecesOf")%>  '<%=in1.description%>' <%=ivy.cms.co("/Dialogs/procurementRequest/forTotal")%> <%=in1.totalPrice%><%=ivy.cms.co("/TaskDescriptions/currencySymbol")%>`
   to create the name :code:`Verify Request: 10 pieces of 'Apple' for a total of 10$`.
   Find more examples in the :ref:`Workflow Demo <importing-demo-projects>` project.

.. warning::

  If you delete a workflow language, then all names and descriptions of all
  existing cases and tasks in that language will be deleted permanently from the
  system database. Adding the language again later on will not bring this data
  back!


.. |image0| image:: /_images/workflow/workflow-case-and-task.png
