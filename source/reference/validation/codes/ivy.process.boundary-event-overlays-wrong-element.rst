:orphan:

.. _validation-code-ivy.process.boundary-event-overlays-wrong-element:

ivy.process.boundary-event-overlays-wrong-element
-------------------------------------------------

**Message:** Boundary event is bound to element '${activityNameOrPid}' but overlays '${overlayPid}'

.. start: manual doc

**Description**

A Boundary Event is configured for one Activity but visually overlaps a different element. This can make the process diagram misleading about which Activity the event handles.

**How to fix**

Move the Boundary Event onto the configured Activity, or update its binding to the Activity it visually overlaps.

