.. _testing:

CI and Testing
**************

Continuous integration (CI) helps you verify changes continuously instead of
waiting until the end of a development cycle. A CI server can automatically
build your Axon Ivy projects, validate processes and configurations, run tests,
and create deployable artifacts whenever changes are committed. This makes
problems visible early and keeps the project in a releasable state.

Testing is an essential part of this process. Writing test code can sometimes
be tedious and time consuming, but in the long run tests make your life a lot
easier:

- Tests make the **functionality of software more reliable**.

- Tests help maintain **quality** as the project evolves.

- **Repetitive tasks** can be reduced to a minimum. Let the computer do it!

- Tests ensure that your software **does what it is supposed to do**, even
  after a code change or platform update.


.. tip::

  The following testing guide is based on a
  :link-url:`demo project <build-examples-test-project>` and uses the name
  ``crm`` for the project to be tested, ``crmTests`` for the
  :ref:`process-<process-testing>` and :ref:`unit-testing<unit-testing>` tests,
  and ``crmIntegrationTests`` for the :ref:`web-testing<web-testing>` tests.
  
  Since this documentation only shows how to setup a test project and perform
  simple tests, you should take a closer look at the demo project.

.. toctree::
   :maxdepth: 1

   continuous-integration
   process-testing
   unit-testing
   web-testing
