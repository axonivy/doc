.. _persistence-entity-classes:

Entity Classes
--------------

Entity Classes are like global :ref:`data-classes` but with additional
information about where and how to store the data of a class and its attributes
in a relational database. An Entity Class is mapped directly to a database table
and the attributes of an Entity Class are mapped directly to the fields of a
database table. Therefore the :ref:`database schema can be generated
<persistence-generate-database-schema>` directly out of an Entity Class. It is
possible to create, read, update, and delete (CRUD) entity objects directly
from/to the database using either the :ref:`persistence-api` or more conveniently with 
the entity's :ref:`data-repository-api`.

Entity Classes are created with the :ref:`persistence-entity-class-new-wizard`
and can be edited afterward in the :ref:`persistence-entity-class-editor`. Both
are similar to the wizard and editor for regular Data Classes but allow for the
specification of additional settings necessary for automated persistence.
