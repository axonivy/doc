.. _persistence-generate-database-schema:

Generate database schema
------------------------

Click on |generate-schema-icon| in the persistence unit.

Generation preview
^^^^^^^^^^^^^^^^^^

On the generation dialog you can specify the type of the schema generation. It directly shows a preview what will be executed on the
database.

.. figure:: /_images/persistence-editor/schema-generation-dialog.png
   :alt: Database schema generation

   Database schema generation

**Type**
   Specify the type of the schema generation. You can choose between
   update and create.

   -  update: Does update the current available schema on the database.

      .. warning::

         The update does not refactor any changed table names, field
         names or field types. If a table or field does not exist in the
         database a new one is created even if the same table or field
         with another name exists.

   -  create: Does drop the current schema on the database and create a
      new one.

      .. warning::

         This option does delete all data which is stored in the
         database.


Primary Key Columns
^^^^^^^^^^^^^^^^^^^

Hibernate, the Jakarta Persistence API implementation library works by default with sequences for primary key columns.
This means it will create for each table a sequence called :code:`<table-name>_SEQ` which is used
to generate the primary keys. If you want to use the auto increment approach
of your database management system you can use the :code:`org.hibernate.annotations.NativeGenerator` annotation.

.. |generate-schema-icon| image:: /_images/ui-icons/settings-cog.svg
   :alt: Generate Schema
   :width: 16px
   :height: 16px