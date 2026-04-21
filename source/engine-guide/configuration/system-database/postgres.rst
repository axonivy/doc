.. _systemdb-postgres:

PostgreSQL
----------

.. literalinclude:: ../../../../target/resources/includes/configuration/templates/ivy-systemdb-postgres.yaml
  :language: yaml
  :linenos:

If the database is created by the Axon Ivy Engine the encoding is set to ``UTF8``.

.. tip::
  If you experience bad query performance in Portal, then try to increase the
  setting ``work_mem`` in the :file:`postgresql.conf` configuration 
  file of the database.

To fully utilize all features in cloud environments such as AWS or Azure, 
verify that the required permissions for the `pgstattuple` extension 
are properly configured.
Keep in mind: You also need the EXECUTE permissions for the function.
Examples:

.. code:: sql

  GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO myuser
  ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON FUNCTIONS TO myuser
