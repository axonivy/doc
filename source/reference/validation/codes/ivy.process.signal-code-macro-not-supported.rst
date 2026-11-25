:orphan:

.. _validation-code-ivy.process.signal-code-macro-not-supported:

ivy.process.signal-code-macro-not-supported
-------------------------------------------

**Message:** Signal code must not have any macro expressions

.. start: manual doc

**Description**

This Signal Start Event requires a literal signal code; macro expressions are not supported in its code. A macro therefore cannot create a runtime-dependent listening code here.

**How to fix**

Use a static code or supported signal pattern. If a value must vary at runtime, use a common code and handle the varying value as signal data after the process starts. See :ref:`signal-receive-patterns` for matching patterns and :ref:`adaptive-case-management` for signal data.
