.. _designer-install-comprehensive-requirements:

Comprehensive Requirements
==========================

This page provides comprehensive instructions for installing, configuring, and
troubleshooting the Axon Ivy Designer. It is intended for both end users and IT
administrators who need to ensure the Designer runs correctly, especially in
corporate environments.

.. _designer-install-user-permissions:

User Permissions
----------------

The Axon Ivy Designer does not require administrator privileges. A regular user
account is sufficient, provided the following conditions are met:

- Read and write access to the workspace directory.
- Permission to open local network ports.

.. _designer-install-integrated-engine:

Integrated Engine (localhost)
-----------------------------

The Axon Ivy Designer downloads and uses an Axon Ivy Engine for simulation and
testing. This Engine starts automatically and is accessible at
``http://localhost:8080`` by default. If port ``8080`` is already in use, the
Designer automatically tries the next free port until it finds one (up to port
``8180``).

For the integrated Engine to work correctly:

- Local firewall software and other security software (antivirus, EDR solutions)
  must not block connections to ``localhost``.
- Proxy servers must not intercept traffic to ``localhost`` or ``127.0.0.1``.
  Ensure ``localhost`` and ``127.0.0.1`` are part of your proxy exclusion list
  (see :ref:`designer-install-proxy-configuration`).

.. _designer-install-network-access:

Network Access
--------------

The Designer requires access to several online services. The following endpoints
must be reachable over HTTPS.

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Host
     - Purpose
   * - ``developer.axonivy.com``
     - Axon Ivy Developer portal to download the Engine and access the
       documentation.
   * - ``market.axonivy.com``
     - Axon Ivy Market to browse and install connectors, ready-made process
       models, business solutions, and practical tools.
   * - ``maven.axonivy.com``
     - Axon Ivy Maven repository to download Axon Ivy project dependencies via
       Maven.
   * - ``repo.maven.apache.org``
     - Maven Central repository to download Axon Ivy and third-party project
       dependencies via Maven.

.. _designer-install-proxy-configuration:

Proxy Configuration
-------------------

If your organization routes internet traffic through a proxy server, there are
some components that need to be configured accordingly. Also, ensure that
``localhost`` and ``127.0.0.1`` are part of the system proxy exclusion list for
the :ref:`integrated Engine <designer-install-integrated-engine>` to work
correctly.

.. _designer-install-proxy-configuration-maven:

Maven
~~~~~

Maven is used by the Designer to download project dependencies and has its own
independent proxy configuration. The proxy settings for Maven are defined in the
``settings.xml`` file, typically located at ``%USERPROFILE%\.m2\settings.xml``
(Windows) or ``~/.m2/settings.xml`` (Linux). If the file does not exist, create
it. Configure the proxy according to your company proxy configuration. See
`Apache Maven - Configuring a proxy
<https://maven.apache.org/guides/mini/guide-proxies.html>`_ for instructions.

Verify that the Designer knows about it:

#. Go to :menuselection:`Manage --> Settings --> Extensions --> Language Support
   for Java(TM) by Red Hat --> Maven` or search for
   ``java.configuration.maven.userSettings``.
#. Make sure the *Java > Configuration > Maven: User Settings* field points to
   your ``settings.xml`` file. If empty, it should use the default location
   mentioned above.

.. _designer-install-proxy-configuration-jvm:

JVM
~~~

Proxy settings also need to be configured at the JVM level. This is done by
adding system properties to the ``jvm.options`` file located in the Engine
directory.

Locate the Engine downloaded to Visual Studio Code's global storage directory,
typically at
``%APPDATA%\Code\User\globalStorage\axonivy.vscode-designer-14\engines``
(Windows) or
``~/.config/Code/User/globalStorage/axonivy.vscode-designer-14/engines``
(Linux).

Add the following lines to ``<engine-directory>\configuration\jvm.options``:

.. code-block:: text

   -Dhttp.proxyHost=proxy.example.com
   -Dhttp.proxyPort=8080
   -Dhttps.proxyHost=proxy.example.com
   -Dhttps.proxyPort=8080
   -Dhttp.nonProxyHosts=localhost|127.0.0.1

If the proxy requires authentication:

.. code-block:: text

   -Dhttp.proxyUser=proxyuser
   -Dhttp.proxyPassword=somepassword
   -Dhttps.proxyUser=proxyuser
   -Dhttps.proxyPassword=somepassword

.. _designer-install-custom-certificate:

Custom SSL/TLS Certificate
--------------------------

If your organization uses a corporate proxy that performs SSL/TLS inspection,
the corporate CA certificate must be imported into the JVM's trust store.

To import a corporate CA certificate:

#. Obtain the CA certificate file (e.g., ``corporate-ca.crt``).
#. Locate the directory of the JRE used by Maven and to start the Engine.
   Usually, where the environment variable ``JAVA_HOME`` points to.
#. Import the certificate using the ``keytool`` command:

   .. code-block:: text

      keytool -import -trustcacerts -alias corporate-ca \
        -file corporate-ca.crt \
        -keystore <jre-directory>/lib/security/cacerts \
        -storepass changeit

.. _designer-install-virus-scanner:

Virus Scanner
-------------

Maven downloads hundreds of files into ``.m2\repository\``. Virus scanners
scanning each file can dramatically slow down Maven builds.

The workspace contains many files that are frequently read and written during
development. Scanning adds latency that manifests as slow project builds or
other side effects.

To circumvent this, add the following exclusions to your antivirus software:

- Designer workspace directory.
- Maven local repository.

.. _designer-install-dev-drive:

Dev Drive (Windows)
-------------------

Putting the workspace and Maven local repository directories on a Dev Drive can
significantly improve performance of developer workloads.

For more information on Dev Drives, see `Microsoft Windows - Dev Drive
<https://learn.microsoft.com/en-us/windows/dev-drive/>`_.
