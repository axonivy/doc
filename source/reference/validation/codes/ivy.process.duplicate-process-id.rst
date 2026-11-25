:orphan:

.. _validation-code-ivy.process.duplicate-process-id:

ivy.process.duplicate-process-id
--------------------------------

**Message:** This process and '${otherPath}' have the same process identifier '${processId}'

.. start: manual doc

**Description**

Two processes in the same project have the same process identifier. Process identifiers are used to distinguish process definitions, so duplicates make the project configuration ambiguous.

**How to fix**

Ensure that each process has a unique identifier. If a process was copied, use the Designer's supported process operations to give it a distinct identity.
