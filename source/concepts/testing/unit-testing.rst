.. _unit-testing:

Unit Tests
----------

You can easily write Unit Tests in the Axon Ivy Designer to test your Java source
code using JUnit 5. If your code uses the
:public-api:`Ivy</ch/ivyteam/ivy/environment/Ivy.html>` environment you can
either mock it or use the
:public-api:`@IvyTest</ch/ivyteam/ivy/environment/IvyTest.html>` annotation that
correctly sets up the environment.


How to Write Unit Tests
~~~~~~~~~~~~~~~~~~~~~~~

.. |TESTKIND| replace:: ``IvyTest``
.. include:: includes/test-project-setup.txt

#. Run test

   - Make sure the Axon Ivy Engine is started with your projects

   - To run this test right-click inside this class -> Run As -> JUnit Test

   - A new **JUnit** View should be opened and the test should be green.


This is all you need to start writing conventional Unit Tests.


Set Up the Axon Ivy Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~

To gain access to the :public-api:`Ivy</ch/ivyteam/ivy/environment/Ivy.html>`
context the ``SampleIvyTest`` class is annotated with the
:public-api:`@IvyTest</ch/ivyteam/ivy/environment/IvyTest.html>` annotation.

.. note::

  If you run your test with ``@IvyTest`` (without process) the bpm engine does
  not get started. This speeds up test execution.

Write a Unit Test
~~~~~~~~~~~~~~~~~

Here we test a class called ``OrderUtil``. This class needs access to different
``Ivy`` resources like :ref:`Variables <variables>`. Without properly setting up
the ``Ivy`` environment we would have to mock all those resources.

.. literalinclude:: includes/unittesting/unittesting-test-extend.java
  :language: java

.. tip::

  Have a look at the 
  :link-url:`demo project <build-examples-unit-tests>` 
  to see what else is possible.


Change Application Runtime
~~~~~~~~~~~~~~~~~~~~~~~~~~

For some test cases, you may need to change the :ref:`Environment
<configuration-environments>` use a different value for a :ref:`Variable
<variables>` or change an app configuration. In this case use ``AppFixture`` to
change the value. The value gets automatically reset to the original value after
the test execution. All you have to do is to tell the test that you want an
instance of the :code:`AppFixure` class. Let's have a look at it:

.. literalinclude:: includes/unittesting/unittesting-test-fixure-var.java
  :language: java
  :emphasize-lines: 2, 4

Or you can change an app configuration, e.g change the URL of a
:ref:`RestClient <rest-clients-configuration>`:

.. literalinclude:: includes/unittesting/unittesting-test-fixure-config.java
  :language: java
  :emphasize-lines: 2, 5

If you want to change the active environment, you can do that in a similar way:

.. literalinclude:: includes/unittesting/unittesting-test-fixure-env.java
  :language: java
  :emphasize-lines: 4

Furthermore it is possible to use the ``AppFixture`` to login with an existing
user. You can either login with a user name or with an ``IUser`` object. In the
example below we injected the ``IUser`` object as a method parameter.

.. literalinclude:: includes/unittesting/unittesting-test-fixure-login.java
  :language: java
  :emphasize-lines: 2, 4, 12
