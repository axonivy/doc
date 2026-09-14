.. _migration-upgrade-engine-post:

Post Migration Steps
====================

After the Axon Ivy Engine has been updated, the existing Axon Ivy projects on
the Axon Ivy Engine must also be converted. Follow these steps and check the
:ref:`migration notes <migration-notes>` to see if any manual adjustments need
to be made to the projects.

.. _migration-project:

Project Conversion
++++++++++++++++++

#. :ref:`Install the Axon Ivy Designer <designer-installation>` which is
   available for the release you are migrating to.
#. Import the version that is deployed on your Axon Ivy Engine from your source
   repository into your Axon Ivy Designer workspace.
#. Convert the project according to the description in section
   :ref:`project-convert` of the Axon Ivy Designer documentation.
#. Test the migrated project in the Axon Ivy Designer.
#. All migrated projects must be re-deployed to the new, upgraded Axon Ivy
   Engine version. 
