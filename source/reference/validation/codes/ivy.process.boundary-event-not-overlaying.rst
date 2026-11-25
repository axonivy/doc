:orphan:

.. _validation-code-ivy.process.boundary-event-not-overlaying:

ivy.process.boundary-event-not-overlaying
-----------------------------------------

**Message:** Boundary event is bound to element '${activityNameOrPid}' but does not overlay it

.. start: manual doc

**Description**

A Boundary Event is linked to an Activity, but its diagram shape does not overlap that Activity. The visual position and the configured target do not match.

**How to fix**

Move the Boundary Event so that it is attached to the linked Activity, or change its binding to the Activity it should handle.
