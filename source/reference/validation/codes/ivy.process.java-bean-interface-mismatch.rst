:orphan:

.. _validation-code-ivy.process.java-bean-interface-mismatch:

ivy.process.java-bean-interface-mismatch
----------------------------------------

**Message:** '${className}' must implement the interface '${interfaceName}' to be used here

.. start: manual doc

**Description**

The class exists, but it does not implement the interface required by the process element. The required interface depends on the element type, so a bean intended for one kind of element cannot automatically be used by another.

**How to fix**

Implement the interface named in the validation message or select a class that already implements it. For example, a :ref:`Program Interface Activity <process-element-pi>` expects ``ProgramExecutor``, while a :ref:`Program Start <process-element-program-start>` expects ``IProcessStartEventBean``. See the corresponding process element documentation for the required Java Bean interface.
