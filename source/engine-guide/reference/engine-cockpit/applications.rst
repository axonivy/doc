.. _engine-cockpit-application:

Applications
------------

The **Applications** page lists all applications in the currently selected Security System.

Use the Security System tabs to switch between Security Systems.
Each tab shows the applications belonging to that Security System.

The table shows the following information for each application:

* **Name** - The application name.
* **Released** - The currently released version.
* **Deprecated** - Any deprecated versions.

To add a new application, click :guilabel:`Add`.

Click an application to open the :ref:`engine-cockpit-application-detail` page,
or click a version to open the :ref:`engine-cockpit-application-version-detail` view.

.. figure:: /_images/engine-cockpit/engine-cockpit-applications.png


.. _engine-cockpit-application-detail:

Application Detail
^^^^^^^^^^^^^^^^^^

The **Application Detail** page lists all **versions** of the selected application.

For each version, the following actions are available:

* :guilabel:`Activate` activates the version.
* :guilabel:`Deactivate` deactivates the version.
* :guilabel:`Release` releases the version and deprecates or archives the previous released one.
* :guilabel:`Deprecate` deprecates the version, existing cases can still be completed.
* :guilabel:`Archive` archives the version.
* :guilabel:`Convert` converts the projects of the version to the newest version.
* :guilabel:`Delete` deletes the version and all its projects.

To create a new version, use the dedicated action on this page.

To deploy a project, click :guilabel:`Deployment` and select your :file:`.iar` or :file:`.zip` file.
Additional deployment options can be configured here; see :ref:`deployment-options` for details.

.. note::
    For CI/CD pipeline deployments, refer to the :ref:`deployment-deploying` chapter.

.. figure:: /_images/engine-cockpit/engine-cockpit-application-detail.png


.. _engine-cockpit-application-version-detail:

Application Version Detail
^^^^^^^^^^^^^^^^^^^^^^^^^^

The **Application Version Detail** page shows all information about a specific
application version, including basic information, states, and a list of all
projects belonging to this version.

To deploy a project, click :guilabel:`Deployment` and select your :file:`.iar` or :file:`.zip` file.
Additional deployment options can be configured here; see :ref:`deployment-options` for details.

.. note::
    For CI/CD pipeline deployments, refer to the :ref:`deployment-deploying` chapter.

.. figure:: /_images/engine-cockpit/engine-cockpit-application-version-detail.png


.. _engine-cockpit-project-detail:

Project Detail
^^^^^^^^^^^^^^

The **Project Detail** page shows all information about an individual project,
including basic information, state, and the projects it depends on or is required by.

.. figure:: /_images/engine-cockpit/engine-cockpit-project-detail.png

