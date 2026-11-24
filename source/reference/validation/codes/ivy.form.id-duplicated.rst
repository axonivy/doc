:orphan:

.. _validation-code-ivy.form.id-duplicated:

ivy.form.id-duplicated
----------------------

**Message:** Form ID '${id}' is used more than once; it is also used by component '${otherCid}'

.. start: manual doc

**Description**

The same form ID is assigned to more than one component. Form IDs are used as rendered component IDs, so duplicates can make component lookup and client-side targeting ambiguous.

**How to fix**

Give each component a unique form ID. If other components or scripts refer to an ID, update those references when renaming it. See the :ref:`Form Editor <form-editor>` guide.

