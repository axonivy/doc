.. _designer-installation:

Installation
============

Quick Start
-----------

To install and use the Axon Ivy Designer:

#. Check that your system meets the :ref:`system requirements
   <designer-system-requirements>`.
#. `Download <https://code.visualstudio.com/download>`_ the latest VS Code IDE.
#. Run VS Code.
#. Install the `Axon Ivy Designer Extension
   <https://marketplace.visualstudio.com/items?itemName=axonivy.vscode-designer-14>`_
   from the VS Code Marketplace. Search for "Axon Ivy PRO Designer
   14" in the Extensions view and click :guilabel:`Install`. See
   `VS Code Extensions <https://code.visualstudio.com/docs/configure/extensions/extensions>`_
   for more information about installing and managing extensions.

Notes & Tips
-------------
- Keep VS Code up-to-date. VS Code itself has weekly releases and will often prompt you to update. Not doing so might break the Extensions functionality.
- VS Code will take care of updating the extensions automatically. You don't have to configure or update extension versions unless you want to work with a specific version as described in :ref:`designer-advanced-project-setup`.
- The Axon Ivy extension automatically installs the necessary Java and Maven extensions. They are also kept up-to-date by VS Code. Those extensions are needed for the Axon Ivy extension to work properly. This means that, apart from having a working Java and Maven installation on your system as described in the :ref:`designer-install-comprehensive-requirements`, you don't have to install any other VS Code extensions apart from the Axon Ivy extension itself.

.. _designer-system-requirements:

Designer System Requirements
----------------------------

These are the detailed requirements to ensure the Axon Ivy Designer works
correctly, especially in corporate environments.

Some of it should work by default, some of it needs to be handled by IT
administrators, and some of it might need to be configured by the end user.
Whether a particular requirement needs to be handled and by whom depends on your
organization's IT policies and environment. Refer to
:ref:`designer-install-comprehensive-requirements` for more information on each
item.

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Requirement
     - Details
   * - :ref:`Java <designer-install-java>`
     - Java Development Kit (JDK) 25 must be installed.
   * - :ref:`Maven <designer-install-maven>`
     - Maven 3.9 must be installed.
   * - :ref:`User permissions <designer-install-user-permissions>`
     - Read/write access to workspace directory, permission to open local ports.
   * - :ref:`Localhost <designer-install-integrated-engine>`
     - Must not be blocked, must bypass the proxy.
   * - :ref:`Network access <designer-install-network-access>`
     - Allow ``developer.axonivy.com``, ``market.axonivy.com``,
       ``maven.axonivy.com``, and ``repo.maven.apache.org`` over HTTPS.
   * - :ref:`Proxy <designer-install-proxy-configuration>`
     - Configure for :ref:`Maven <designer-install-proxy-configuration-maven>`
       and :ref:`JVM <designer-install-proxy-configuration-jvm>`.
   * - :ref:`Custom certificate <designer-install-custom-certificate>`
     - Import corporate CA certificate into JVM trust store if the proxy
       performs SSL/TLS inspection.
   * - :ref:`Virus scanner <designer-install-virus-scanner>`
     - Exclude workspace and Maven local repository directories.
   * - :ref:`Dev Drive (Windows) <designer-install-dev-drive>`
     - Consider using a Dev Drive for improved performance.

.. toctree::
   :hidden:

   comprehensive-requirements
