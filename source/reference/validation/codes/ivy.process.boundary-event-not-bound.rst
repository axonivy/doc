:orphan:

.. _validation-code-ivy.process.boundary-event-not-bound:

ivy.process.boundary-event-not-bound
------------------------------------

**Message:** Boundary event is not bound to any element

.. start: manual doc

**Description**

A Boundary Event must be linked to an Activity that it can interrupt or otherwise handle. Without a binding, the process does not know which Activity the event belongs to.

**How to fix**

Bind the Boundary Event to the intended Activity in the process editor.

