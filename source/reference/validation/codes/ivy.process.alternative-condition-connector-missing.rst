:orphan:

.. _validation-code-ivy.process.alternative-condition-connector-missing:

ivy.process.alternative-condition-connector-missing
---------------------------------------------------

**Message:** Condition #${conditionNumber} references a connector that no longer exists: ${fieldIds}

.. start: manual doc

**Description**

The Alternative Gateway still has a condition for a connector that is no longer present among its outgoing sequence flows. The condition therefore has no connected path to execute.

**How to fix**

Reconnect or recreate the outgoing sequence flow, or remove the condition if that path is no longer needed.
