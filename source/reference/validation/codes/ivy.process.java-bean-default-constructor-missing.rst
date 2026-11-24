:orphan:

.. _validation-code-ivy.process.java-bean-default-constructor-missing:

ivy.process.java-bean-default-constructor-missing
-------------------------------------------------

**Message:** '${className}' must declare a public default constructor

.. start: manual doc

**Description**

The configured process Java Bean must have a public constructor with no parameters so the process element can create it without constructor arguments. A class that only has constructors with parameters does not meet this requirement.

**How to fix**

If the class declares other constructors, add a public no-argument constructor, for example:

.. code-block:: java

   public MyProgram() {
   }

See the Java Bean tab in the documentation for the relevant process element: :ref:`Program Interface Activity <process-element-pi>`, :ref:`Program Start <process-element-program-start>`, or :ref:`Wait Program Intermediate Event <process-element-wait-program-intermediate-event>`.

