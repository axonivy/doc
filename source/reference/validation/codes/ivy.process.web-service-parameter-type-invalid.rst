:orphan:

.. _validation-code-ivy.process.web-service-parameter-type-invalid:

ivy.process.web-service-parameter-type-invalid
----------------------------------------------

**Message:** ${readableIdentifier} has type ${invalidType}, which cannot be used as a web service parameter. ${hint}

.. start: manual doc

**Description**

This validation applies to Web Service Process Start input parameters and to fields in their Data Classes. The validator checks nested Data Class fields as well, so the unsupported type may be in an attribute rather than the top-level parameter.

**How to fix**

Follow the replacement suggested in the validation message. See :ref:`Web Service Process Start <process-element-web-service-process-start>` for the supported input parameter types and examples.
