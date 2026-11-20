:orphan:

.. _validation-code-ivy.process.error-code-missing:

ivy.process.error-code-missing
------------------------------

**Message:** No custom error code is specified on the Error End element. '${errorCode}' will be used.

.. start: manual doc

**Description**

The Error End has no custom error code, so it will throw the default code shown in the message. An Error Start or Error Boundary Event that expects a different, business-specific code may not catch this error.

**How to fix**

Set a meaningful code that matches the process's error-handling design, for example ``booking:declined``. See :ref:`error-handling` and :ref:`process-element-error-end` for how error codes are thrown and caught.

