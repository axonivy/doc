:orphan:

.. _validation-code-ivy.java-index.public-instance-field:

ivy.java-index.public-instance-field
------------------------------------

**Message:** Field '${field}' on ManagedBean '${bean}' is public and non-static, which is not allowed

.. start: manual doc

**Description**

Managed Beans must not expose public, non-static instance fields. Public fields bypass the bean's accessors and make its state directly mutable.

**How to fix**

Make the field private and expose it through the appropriate getter and setter if it needs to be accessed by the view.

