.. _designer-install:

Installation
============

Quick Start
-----------

To install the Axon Ivy Designer:

#. Check that your system meets the :ref:`system requirements
   <designer-system-requirements>`.
#. `Download <https://code.visualstudio.com/download>`_ the latest Visual Studio
   Code.
#. Run Visual Studio Code.
#. Install the `Axon Ivy Designer extension
   <https://marketplace.visualstudio.com/items?itemName=axonivy.vscode-designer-14>`_
   from the Visual Studio Code Marketplace. Search for "Axon Ivy PRO Designer
   14" in the Extensions view and click :guilabel:`Install`.

Comprehensive Requirements
--------------------------

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
   * - :ref:`System <designer-system-requirements>`
     - See :ref:`system requirements <designer-system-requirements>`.
   * - :ref:`User permissions <designer-install-user-permissions>`
     - Read/write on workspace directory, permission to open local ports.
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
