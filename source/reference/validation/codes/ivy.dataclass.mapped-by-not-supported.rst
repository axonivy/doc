:orphan:

.. _validation-code-ivy.dataclass.mapped-by-not-supported:

ivy.dataclass.mapped-by-not-supported
-------------------------------------

**Message:** ${message}

.. start: manual doc

**Description**

``Mapped by`` is only valid on the inverse side of a supported bidirectional association. It is not supported when no cardinality is selected or for a Many-to-One association.

**How to fix**

Remove the ``Mapped by`` value, or configure a supported inverse association and point it to the owning Attribute in the referenced Entity Class.
