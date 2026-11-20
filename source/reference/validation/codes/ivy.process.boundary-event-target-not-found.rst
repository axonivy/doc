:orphan:

.. _validation-code-ivy.process.boundary-event-target-not-found:

ivy.process.boundary-event-target-not-found
-------------------------------------------

**Message:** Boundary event is bound to element '${activityPid}' that does not exist

.. start: manual doc

**Description**

The Boundary Event refers to an Activity identifier that no longer exists in the process. This can happen when the target Activity is removed or replaced.

**How to fix**

Bind the Boundary Event to an existing Activity, or remove the event if it is no longer needed.

