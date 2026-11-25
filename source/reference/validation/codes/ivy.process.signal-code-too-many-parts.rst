:orphan:

.. _validation-code-ivy.process.signal-code-too-many-parts:

ivy.process.signal-code-too-many-parts
--------------------------------------

**Message:** ${signalCode} has more than five parts, which may affect performance

.. start: manual doc

**Description**

The signal code has more than five colon-separated parts. The code remains valid, but very deep codes can make signal matching less efficient. Signal codes are commonly used to describe an event hierarchy, while optional signal data can carry additional details.

**How to fix**

Keep the code hierarchy concise and move extra identifiers or payload details into signal data where appropriate. For example, use ``order:canceled`` as the code and send the order ID as data. See :ref:`signal-receive-patterns` for code matching and :ref:`adaptive-case-management` for sending signals.
