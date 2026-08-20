.. _migration-upgrade-engine-post:

Post Migration Steps
====================

After the Axon Ivy Engine has been updated, the existing Axon Ivy projects on
the Axon Ivy Engine must also be converted. To do this, go to the
:ref:`application overview <engine-cockpit-application>` in the Engine
Cockpit. Axon Ivy projects that do not correspond to the current project version
are not started and must first be converted using the :guilabel:`Convert`
button.

Once all the required Axon Ivy projects have been converted, the processes can
be tested. If errors are identified, check the :ref:`migration notes
<migration-notes>` to see if any manual adjustments need to be made to the
projects. If so, proceed as follows:

.. _migration-project:

Project-Migration
++++++++++++++++++

If you face incompatibilities in the UI or see errors in the logs while using
the new Axon Ivy Engine, here's how you make your projects compatible with the new
Axon Ivy Engine version. 

#. Download the latest Axon Ivy Designer which is available for the release you are
   migrating to.
#. Import the version that is deployed on your Axon Ivy Engine from your source
   repository into your Axon Ivy Designer workspace.
#. Migrate the project according to the description in section
   :ref:`project-convert` of the Axon Ivy Designer Guide. Usually, this is achieved
   by invoking the project conversion action on each project. Some manual
   adaptations may be necessary.
#. Test the migrated project in the Axon Ivy Designer.
#. All migrated projects must be re-deployed to the new, upgraded Axon Ivy Engine
   version. 

   #. Not only the ``RELEASE`` process model version (PMVs) must be updated and
      re-deployed, but all ``DEPRECATED`` projects too.
   #. Other versions in the states ``PREPARED`` or ``ARCHIVED`` may be easier to
      delete, rather than updating and redeploying.
