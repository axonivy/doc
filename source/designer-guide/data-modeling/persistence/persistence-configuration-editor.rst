.. _persistence-configuration-editor:

Persistence Configuration Editor
--------------------------------

The Persistence Configuration Editor lets you configure the persistence
units you use in your project and projects depending on it.

Usually, you only need a single persistence unit that manages all of your
project's entity data classes. In this case, you can simply create a new
persistence unit, associate it with a data source (i.e., a database) and
you're done. All of the project's entity classes will then automatically
be managed by this unit.

However, if you wish to do so, you can divide your entity data classes
into subsets and manage each subset through an individual persistence
unit. In this case, you need to specify multiple persistence units and
then define an explicit list of managed entity classes for each unit.

.. warning::

   Although it is theoretically possible to have the same entity class
   managed by two or more persistence units, you should be aware of the
   consequences. Once you have generated/attached an object of a
   specific class to a specific persistence unit, you must ensure
   that it is managed uniquely by that unit.

   Example: Assume that you have two different objects of the same
   entity class, e.g., ``Person``, generated through different
   persistence units, e.g., ``employee`` through ``employee_unit`` and
   ``customer`` through ``customer_unit``. In this case, you must
   avoid mixing persistence units and objects. For the above
   example, handing over an ``employee`` to ``customer_unit`` (or
   a ``customer`` to ``employee_unit``) will consequently result in
   errors.

.. figure::  /_images/persistence-editor/persistence-editor.png
   :alt: Persistence Configuration Editor

   Persistence Configuration Editor

- Press |add-persistence-icon| to add a new persistence unit configuration.
- Press |delete-persistence-icon| to delete the selected persistence unit.
- Press |generate-schema-icon| to generate the database schema out of the entity classes that belong to
  the selected persistence unit. See :ref:`persistence-generate-database-schema`
  for details.

Accessibility
^^^^^^^^^^^^^

*Axon Ivy Project Tree > double click on the Persistence label.*

Features
^^^^^^^^

Data source
   Here, you have to choose a database configuration which will be the
   data source of this persistence unit, i.e., all the data is loaded
   and stored within this database. Go to the :ref:`database-configuration-editor`
   to configure available data sources.

   There is also a ``IvySystemDatabase`` data source that points to the
   current System Database. Usually, you will use your own database
   to split customer data from the Axon Ivy system data.

Description
   Describe your persistence unit here.

Managed Entity Classes
   Specify the entity classes to include in this persistence unit. The 
   explicitly listed classes are always included. Depending on the selected 
   'Included Classes', all entity classes from the current project and 
   optionally from required projects are discovered and managed automatically.

   - **From Project:** Includes listed classes plus all entity classes discovered in the current project.
   - **From Project & Dependent:** Includes listed classes plus all entity classes discovered in the current and required projects.
   - **Only Listed:** Only the explicitly listed classes are included. No automatic discovery.

Properties
   Specify properties for the persistence unit. This is optional. This
   freedom comes with responsibility - know what you are doing.

.. |add-persistence-icon| image:: /_images/ui-icons/plus.svg
   :alt: Add Persistence Unit
   :width: 16px
   :height: 16px

.. |delete-persistence-icon| image:: /_images/ui-icons/trash.svg
   :alt: Delete Persistence Unit
   :width: 16px
   :height: 16px

.. |generate-schema-icon| image:: /_images/ui-icons/settings-cog.svg
   :alt: Generate Schema
   :width: 16px
   :height: 16px