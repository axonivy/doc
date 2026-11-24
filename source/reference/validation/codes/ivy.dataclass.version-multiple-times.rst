:orphan:

.. _validation-code-ivy.dataclass.version-multiple-times:

ivy.dataclass.version-multiple-times
------------------------------------

**Message:** Attributes '${field}' and '${otherField}' in Entity Class '${className}' are both marked as 'Version'

.. start: manual doc

**Description**

An Entity Class can have at most one version Attribute. The version value is used for optimistic locking to detect conflicting updates.

**How to fix**

Keep the ``Version`` property on one supported Attribute and remove it from the others. See the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

