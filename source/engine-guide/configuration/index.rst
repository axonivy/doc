.. _configuration:

Configuration
*************

The Axon Ivy Engine is configured by files. They are located in the
:file:`/configuration` directory of the engine. The :ref:`ivy-yaml`
file contains the most important entries that define the
environment and runtime behavior of the Axon Ivy Engine.

.. literalinclude:: includes/ivy-full.yaml
  :language: yaml
  :linenos:


.. rubric:: Craft you own configuration

To craft your own configuration you would typically copy values from our
**reference** files, located under :file:`[engineDir]/configuration/reference` or
see the :ref:`configuration-file-reference` and adjust them according to your needs. 
Alternative, you can also copy and modify whole **templates**,
which are provided under :file:`[enginDir]/configuration/templates`.

As an Editor for the files, we recommend VS-Code or the engine-cockpit :ref:`engine-cockpit-config-editor`.
Note that, most settings can also be adjusted with a UI in our :ref:`engine-cockpit`.

.. rubric:: Version

The Axon Ivy configuration files, :ref:`ivy-yaml` and :ref:`app-yaml`, use a
versioned schema. The schema version is specified in the header as the first
entry. Many editors can recognize this schema and validate the file accordingly.
If no schema is defined, the Axon Ivy Engine assumes the latest version.
Therefore it is recommended that you always define the schema header in the
configuration file.


.. rubric:: Configure your engine

.. toctree::
   :maxdepth: 1

   system-database/index
   administrators
   users/index
   email
   notification/index
   translation-service/index
   document/index
   advanced-configuration
   docker-container
   file-reference
