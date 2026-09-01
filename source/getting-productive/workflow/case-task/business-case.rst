.. _business-case:

Business Case
-------------

Modern processes are loosely coupled and highly :ref:`adaptive
<adaptive-case-management>`. Business processes can break out of the standard
process flow and trigger asynchronous processes or send a :ref:`signal
<signal-reference>` that starts various other processes. As every running
process creates a new **Case**, it can get difficult for the workflow users to
track the history and context of a **Task**.

To clarify the workflow view, multiple **Cases** can be attached to a single
**Business Case**.
:ref:`Triggered <process-element-start-request-trigger-tab>` or
:ref:`signaled <process-element-signal-start-tab-signal>`
process-starts define in their inscription whether the started **Case**
should be attached to the **Business Case** of the calling **Case**. Moreover,
any **Case** can be attached to a **Business Case** using the API. If a case map is
started, a **Business Case** is automatically created. See :ref:`casemap-execution`.

