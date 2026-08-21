.. _data-repository-api:

Data Repository API
-------------------

The Axon Ivy Data Repository API is used to create, read, update, and delete
entity objects directly from the database. 
When an Entity Class is configured in the :ref:`persistence-entity-class-editor` to generate a data repository, 
a data repository interface and an accessor method called ``repository`` are automatically created for it.

The API can be accessed using IvyScript anywhere scripting is supported, or in Java.

Examples
========

Create a ``Person`` entity and store it in the database:

.. code-block:: java

  Person person = Person();
  person.lastName = "Weiss";
  person.surName = "Reto";
  Person.repository().insert(person);

Read all ``Person`` entities from the database:

.. code-block:: java

  List<Person> persons = Person.repository().findAll();

Update a ``Person`` entity in the database:

.. code-block:: java

  Person person = Person.repository().findById(315);
  person.lastName = "Wermelinger";
  Person.repository().update(person);

Delete a ``Person`` entity from the database:

.. code-block:: java

  Person person = Person.repository().findById(315);
  Person.repository().delete(person);

Enhance the Data Repository
===========================

A data repository provides the standard CRUD operations by default. To enhance the data repository
with your own custom find methods copy the generated data repository interface located in 
the ``src_dataClasses`` folder and move it into the ``src`` folder of your project. 
You can then add more methods to the interface as shown below:

.. code-block:: java

  @Repository
  public interface PersonRepo extends CrudRepository<Person, Integer> {

    @Find
    List<Person> findByLastName(String lastName);
  }

The implementation of the interface will automatically be created by Axon Ivy.
To learn more about how to write your own repository methods visit 
`Jakarta Data: Repository Interfaces <https://jakarta.ee/specifications/data/1.0/jakarta-data-1.0#_repository_interfaces>`__.
