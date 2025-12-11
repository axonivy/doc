.. _migrate-131-132:

Migrating from 13.1 to 13.2
===========================

Upgrading to version 13.2 is supported only from an Axon Ivy Engine 10.0 or higher.
If your Axon Ivy Engine is older than version 10.0, you must first 
migrate to a version between 10.0 and 12.0.

Final Eclipse-Based Axon Ivy PRO Designer 
*********************************************

This is the final release of the PRO Designer based on the `Eclipse IDE <https://eclipseide.org/>`_.
Starting with LTS 14, the PRO Designer will transition to a `VS Code extension <https://marketplace.visualstudio.com/items?itemName=axonivy.vscode-designer-13>`_.
A Beta version is already available - try it out and share your feedback!

`Learn more about this transition <https://community.axonivy.com/d/1149-maintenance-mode-of-the-eclipse-based-pro-designer>`_

Axon Ivy Java API Maven Dependency
**********************************

|tag-project-changed| |tag-project-auto-convert|

The version of the :code:`ivy-project-parent`  in the :code:`pom.xml` file has been updated from 13.1 to 13.2.

For projects using :code:`ivy-project-parent`, the following dependencies have been replaced:

- :code:`unit-tester` → :code:`ìvy-test-api`
- :code:`web-tester` → :code:`ìvy-web-test-api`

What You Need to Do:
--------------------

1. Run the project migration tool to automatically update your pom.xml file.
2. Execute your maven build and ensure everythings compiles and all tests pass successfully.

For more details about the Axon Ivy Java API and troubleshoot issues, refer to `Troubleshoot Java Compilation Errors <https://community.axonivy.com/d/1150>`_.

Persistence API (Hibernate)
***************************

|tag-project-changed| |tag-project-auto-convert|

The Persistence API has been migrated from Java Persistence API (JPA) 2.2 to `Jakarta Persistence API <https://jakarta.ee/specifications/persistence/3.2/>`_ 3.2. 
The implementation has been updated from `Hibernate <https://hibernate.org/orm/documentation/7.0/>`_ 5.6 to `Hibernate <https://hibernate.org/orm/documentation/7.0/>`_ 7.0.

Package names have changed:

- :code:`javax.persistence` → :code:`jakarta.persistence`
- :code:`javax.transaction` → :code:`jakarta.transaction`

What You Need to Do:
--------------------

1. Run the project migration tool to automatically update your code. 
2. Use :guilabel:`File Search` in the Designer to ensure all references are updated.

This marks the first step in the migration from Java EE to Jakarta EE. Further migrations will follow in future releases.

Mail API 
********

|tag-project-changed| |tag-project-auto-convert|

The Mail API has been migrated from Java Mail API 1.6 to `Jakarta Mail API <https://jakarta.ee/specifications/mail/2.0/>`_ 2.0.

Package names have changed:

- :code:`javax.mail` → :code:`jakarta.mail`
- :code:`javax.activation` → :code:`jakarta.activation`

What You Need to Do:
--------------------

1. Run the project migration tool to automatically update your code. 
2. Use :guilabel:`File Search` in the Designer to ensure all references are updated.

Recommendation:
---------------

Instead of using the Jakarta Mail API, consider:

- The :ref:`process-element-email-activity`
- The new :public-api:`Mail Public API </ch/ivyteam/ivy/mail/package-summary.html>`.

This marks the first step in the migration from Java EE to Jakarta EE. Further migrations will follow in future releases.

HttpHeaderSecurityFilter and RemoteIpFilter in web.xml
******************************************************

|tag-ops-deprecated|

You can now define the :ref:`reverse-proxy` HTTP Headers and security
response :ref:`security-http-headers` in the :ref:`ivy-yaml` file. While it is
still possible to configure these in :ref:`web-xml`, it is no longer recommended. 
If you continue to use :ref:`web-xml`, headers may appear twice.

What You Need to Do:
--------------------

Remove the following configurations from :ref:`web-xml` and migrate them to :ref:`ivy-yaml`:

- :code:`org.apache.catalina.filters.HttpHeaderSecurityFilter` → :code:`WebServer.HttpHeaders`
- :code:`org.apache.catalina.filters.RemoteIpFilter` → :code:`ReverseProxy.HttpHeaders`

Schema header in ivy.yaml and app.yaml
**************************************

|tag-ops-changed|

If your :ref:`ivy-yaml` and :ref:`app-yaml` do not include a schema header, the
Axon Ivy Engine will now assume that they are in the latest
version. Auto-migration of these files will not happen anymore. 

Recommendation:
---------------

Always version your configuration files by including a schema header.


------------

.. include:: _tagLegend.rst
