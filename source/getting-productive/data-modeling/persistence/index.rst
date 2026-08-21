.. _persistence:

Persistence
===========

This chapter introduces the :ref:`persistence-configuration-editor` and the
:ref:`persistence-api` of Axon Ivy. The persistence framework is based on the `Jakarta
Persistence API <https://jakarta.ee/specifications/persistence>`__ (also known as the Java Persistence API or JPA) 
and the `Jakarta Data API <https://jakarta.ee/specifications/data/>`__. 
It offers support for storing and retrieving business objects to and from a
database.

To use automated persistence in your business or User Dialog processes, you need
to define :ref:`persistence-entity-classes` first. An entity class is similar to
a data class (i.e., a business object) but holds additional information that is
used to map the class to a database table and its attributes to database table
columns.

You need to define at least one persistence unit configuration. A persistence
unit manages some or all of your entity classes and specifies the database
where those entities are stored. Once you have configured one or more
persistence units, you can use them in your process steps either with the convenient
:ref:`data-repository-api` or, for complex use cases, with the :ref:`persistence-api`.
These APIs allow you to perform create, read, update, and delete (CRUD) operations on 
entity objects directly in the database. The :ref:`data-repository-api` provides a 
straightforward and efficient way to manage your data for most scenarios, while the 
:ref:`persistence-api` offers greater flexibility and control for handling more 
intricate and specialized data manipulation tasks.


.. toctree::
  :maxdepth: 1

  entity-classes
  new-entity-class-wizard
  entity-class-editor
  persistence-configuration-editor
  generate-database-schema
  data-repository-api
  persistence-api
