.. _engine-system-requirements:

Axon Ivy Engine
===============

The following system requirements highly depend on the number of Named Users,
Concurrent Users, and deployed applications.


Hardware Requirements
---------------------

By default, the Axon Ivy Engine runs a bundled OpenSearch server. It is possible
to integrate with an :ref:`external <opensearch-external>` OpenSearch
instance. This also affects the minimum hardware requirements.


.. rubric:: With bundled OpenSearch server (default)

* **Memory (RAM)**:
  Minimum is 8 GB, we recommend using 32 GB.

* **Disk Space**:
  Minimum is 20 GB, we recommend 100 GB on a Solid State Disk (SSD).

* **Processors**:
  Minimum is 4 cores with 2 GHz, we recommend 16 cores with 2.5 GHz.


.. rubric:: With an external OpenSearch server

* **Memory (RAM)**:
  Minimum is 4 GB. We recommend using at least 16 GB.

* **Disk Space**:
  Minimum is 2 GB. We recommend 50 GB on a Solid State Disk (SSD).

* **Processors**:
  Minimum is 4 cores with 2 GHz. We recommend 16 cores with 2.5 GHz.

File System
^^^^^^^^^^^

On Linux, the Axon Ivy Engine's directory requires a file system that fully
supports the POSIX file operations. For example, Linux setups using SMB/CIFS
shares with incomplete POSIX behavior are not supported. This is due to a `known
limitation <https://bugs.openjdk.org/browse/JDK-8261790>`_ in the JDK itself.

This includes, but is not limited to:

* Azure classic file share

Software Requirements
---------------------

The Axon Ivy Engine needs Java SE 25 to run and is tested with `Eclipse Temurin
<https://adoptium.net/>`_.

Note: Java SE 25 `Eclipse Temurin <https://adoptium.net/>`_ is already
included in our Windows installation and the Docker container.    
On Linux, we do not include Java SE 25. You may want to use Java SE 25 provided
by your operating system or install `Eclipse Temurin <https://adoptium.net/>`_.

.. _engine-system-requirements-os:

Operating Systems
-----------------

The Enterprise Edition has some :ref:`advantages <cluster>` 
but also some :ref:`restrictions <cluster-restrictions>` compared to the Standard Edition.

+-------------------+--------+-------+-------------------+
|Engine Type        |Windows |Linux  |Container (Linux)  |
+===================+========+=======+===================+
|Standard Edition   |Yes     |Yes    |Yes                |
+-------------------+--------+-------+-------------------+
|Enterprise Edition |No      |No     |Yes                |
+-------------------+--------+-------+-------------------+

Supported Operating Systems

+---------------+-----------------+-------------+
|OS             |Supported        |Tested       |
+===============+=================+=============+
|Windows Server |2019, 2022, 2025 |2025         |
+---------------+-----------------+-------------+
|Linux          |x64              |Ubuntu 24.04 |
+---------------+-----------------+-------------+

System Database
---------------

+---------------------+-----------------------------+-----------+
|Database System      |Supported                    | Tested    |
+=====================+=============================+===========+
|PostgreSQL           |15 - 18                      |15, 18     |
+---------------------+-----------------------------+-----------+
|MySQL (InnoDB)       |8.4, 9.7                     |8.4, 9.7   |
+---------------------+-----------------------------+-----------+
|MariaDB (InnoDB)     |11.4, 12.3                   |11.4, 12.3 |
+---------------------+-----------------------------+-----------+
|Microsoft SQL Server |2022, 2025                   |2022, 2025 |
+---------------------+-----------------------------+-----------+
|Oracle Database      |19, 26                       |19, 26     |
+---------------------+-----------------------------+-----------+


OpenSearch
-------------

Version 3.7. Only required if you run your :ref:`own <opensearch-external>`
OpenSearch instance!


Browsers
--------

See :ref:`browser-system-requirements`.
