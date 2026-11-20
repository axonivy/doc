:orphan:

.. _validation-code-ivy.java-index.managed-property-missing:

ivy.java-index.managed-property-missing
---------------------------------------

**Message:** ${type} '${id}' is missing the required property 'managed = true'

.. start: manual doc

**Description**

The ``@FacesConverter`` or ``@FacesValidator`` annotation does not enable managed creation. Without ``managed = true``, the component is not created as a CDI-managed object, so CDI injection and other managed behavior are unavailable.

**How to fix**

Add ``managed = true`` to the component's annotation, for example ``@FacesConverter(value = "myConverter", managed = true)``.

