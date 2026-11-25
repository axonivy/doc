:orphan:

.. _validation-code-ivy.xhtml.converter-id.missing-scope:

ivy.xhtml.converter-id.missing-scope
------------------------------------

**Message:** Converter '${value}' has no CDI scope

.. start: manual doc

**Description**

The converter has no CDI scope, so the container cannot manage its lifecycle as a CDI bean. This is required for a managed converter.

**How to fix**

Add a suitable scope annotation, such as ``@RequestScoped`` or ``@ApplicationScoped``. See :ref:`validation-code-ivy.java-index.scope-missing` and :ref:`html-dialog-managed-beans`.
