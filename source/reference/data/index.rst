Data
====

.. _data-class-editor:

Data Class Editor
-----------------

Use this editor to add, delete, and edit your Data Class and its attributes.

.. figure:: /_images/dataclass-editor/dataclass-editor.png
   :alt: Data Class Editor

   Data Class Editor

.. note::
  If you open an Entity Class, additional properties are configurable in this
  editor. They are documented in the :ref:`persistence-entity-class-editor`.

.. note::
  If you are familiar with the Data Class editor from previous versions, you can
  still use it by selecting *Open With > Data Class Editor (Classic)* in the
  context menu of the Data Class.

Features
^^^^^^^^

When you have no attribute selected, you can view and edit the properties of the
Data Class.

Name / Description
  Name
    Shows the fully qualified name of the Data Class. To change the name,
    perform the "Rename" refactoring by selecting "Rename" in the context menu
    of the Data Class in your project tree.
  
  Description
    Use this field to document your Data Class.
  
Annotations
  Use annotations on your Data Class for advanced configuration. The annotations
  will be written as is into the generated Java file. Therefore, you need to use
  the fully qualified name of the annotation and provide all desired arguments.

Class type
  Change the type of your Data Class:
  
    - :ref:`Data <data-classes>`
    - :ref:`Business Data <business-data>`
    - :ref:`Entity <persistence-entity-classes>`

Attributes
""""""""""

The attributes specify the Data Class contents. Select an attribute in the table
to view and edit its properties.

Name / Type / Comment
  Name
    The name of your attribute. The name must not contain any special characters
    or spaces.

  Type
    The type of your attribute. Press |data-type-browser-icon| to open the
    :ref:`data-type-browser`.

  Comment
    Use this field to document your attribute.

.. |data-type-browser-icon| image:: /_images/ui-icons/list-search.svg
   :alt: Data Type Browser Button
   :width: 16px
   :height: 16px

Properties
  Persistent
    Decide if the data should be persistent between task switches. If the data
    is not set to be persistent, then you lose all information if the execution
    of the process passes a task switch process element.

Annotations
  Use annotations on your attributes for advanced configuration. The annotations
  will be written as is into the generated Java file. Therefore, you need to use
  the fully qualified name of the annotation and provide all desired arguments.

Attribute Refactoring
^^^^^^^^^^^^^^^^^^^^^

The Data Class editor supports Data Class attribute refactoring.

Combine Attributes Refactoring
""""""""""""""""""""""""""""""

Over time, the number of attributes in a Data Class may become excessive. This
decreases the maintainability and reusability of your process logic. Therefore,
the editor allows you to combine multiple attributes from an existing Data Class
into a new Data Class. The combined attributes will be replaced with a delegate
attribute for the new Data Class.

If you have a Data Class that describes a person, you could combine the
attributes that belong to the address part into an extra address Data Class.

.. list-table::
  :width: 100%

  * - .. figure:: /_images/data-class/data-class-editor-extract-refactoring-original-structure.png
         :alt: Data Class before refactoring
         :scale: 75
      
         Data Class before refactoring

    - .. figure:: /_images/data-class/data-class-editor-extract-refactoring-modified-classes.png
         :alt: Data Class after refactoring
         :scale: 75
      
         Data Class after refactoring

**Start Refactoring**

Select the attributes to combine in the table, then press
|combine-attributes-icon| to open the refactoring wizard.

.. |combine-attributes-icon| image:: /_images/ui-icons/wrap-to-subprocess.svg
   :alt: Combine Attributes Button
   :width: 16px
   :height: 16px

**Define the new Data Class**

The first refactoring wizard page lets you define the location and name of the
Data Class.

.. figure:: /_images/data-class/data-class-editor-extract-refactoring-wizard-page-1.png
   :alt: Wizard Page 1 - Define the new Data Class

   Wizard Page 1 - Define the new Data Class

**Review modifications**

The second page previews all changes that will be applied to your artifacts. You
can inspect some of the changes within the textual compare view on the lower
part of the page.

.. figure:: /_images/data-class/data-class-editor-extract-refactoring-wizard-page-2.png
   :alt: Wizard Page 2 - Review modifications

   Wizard Page 2 - Review modifications

The refactoring will modify all programmatic references to attributes.
Statements written in Java, IvyScript, JSP or El-Expressions may be changed by
this refactoring.


.. _persistence-entity-class-editor:

Entity Class Editor
-------------------

Use this editor to add, delete, and edit your Entity Class and its Attributes.

.. note::
  All the features mentioned in the :ref:`data-class-editor` apply to this
  editor as well. This is simply an extension of those features specific to
  Entity Classes.

Features
^^^^^^^^

Database Table
  Name
    The name of the database table of your Entity Class. If not specified, the
    name of your Entity Class is used. This value is used when the database
    table of your Entity Class gets generated.

Data Repository
  Generate
    Select to create :ref:`data-repository-api` for the Entity Class.

Attributes
""""""""""

Database Field
  Name
    The name of the database table column of this Attribute. This value is used
    when the database table of your Entity Class gets generated. Allowed
    characters are the letters A-Z, the digits 0-9, and the underscore ``_``.
  
  Length
    The length of the field in the database table. The following Attribute types
    can have their length defined and have the specified default values:

    - ``String`` : 255
    - ``BigDecimal`` : 19,2
    - ``BigInteger`` : 19,2
    
    Changing the length has only an effect if the database schema is recreated.
  
  Properties
    - **ID**: Defines the primary key field of an entity. Every Entity Class
      must have exactly one primary key.
    - **Generated**: Defines if the primary key should be generated
      automatically.
    - **Not nullable**: Defines whether the field value can be ``NULL`` in the
      database.
    - **Unique**: Defines whether the field value must be unique across the
      database table column.
    - **Not updateable**: Defines whether the column is omitted in ``SQL
      UPDATE`` statements generated by the persistence provider.
    - **Not insertable**: Defines whether the column is omitted in ``SQL
      INSERT`` statements generated by the persistence provider.
    - **Version**: Defines the version field of an entity. This is used as the
      optimistic lock value and ensures integrity when performing the merge
      operation. The following Attribute types can be used as version:

      - ``Short``
      - ``Integer``
      - ``Long``
      - ``java.sql.Timestamp``

Association
  Defines the association to another Entity Class. For a bidirectional
  relationship, an inverse association with a mapped-by specification must be
  configured on the referenced Entity Class.

  Cardinality
    - **One-to-One**: Defines a One-to-One (1:1) association to another Entity
      Class. Only allowed if the Attribute type is an Entity Class. The inverse
      association is another One-to-One association.
      
    - **Many-to-One**: Defines a Many-to-One (n:1) association to another Entity
      Class. Only allowed if the Attribute type is an Entity Class. The inverse
      association is a One-to-Many association.
      
    - **One-to-Many**: Defines a One-to-Many (1:n) association to another Entity
      Class. Only allowed if the Attribute type is a ``List`` or ``Set`` of an
      Entity Class. This association type always requires a mapped-by
      specification since it is the inverse of a Many-to-One association.

      .. warning::
        A One-to-Many association comes with a significant performance impact.
        Only use it if it is absolutely necessary.
  
  Cascade
    Defines the cascadable operations that are propagated to the associated
    Entity. If checked, operations performed on this Entity will be applied
    automatically to the associated Entity.

    - **Persist**: See :ref:`Persist an Entity Object
      <persistence-api-persist>`.
    
    - **Merge**: See :ref:`Merge an Entity Object <persistence-api-merge>`.
    
    - **Remove**: See :ref:`Remove an Entity Object <persistence-api-remove>`.
    
    - **Refresh**: See :ref:`Refresh an Entity Object
      <persistence-api-refresh>`.
  
  Mapped by
    Defines the Attribute that owns the relationship in the associated Entity.
    This value must be defined on the inverse (non-owning) side of the
    association.
  
  Remove orphans
    If enabled and an Entity that is the target of a relationship is removed
    from the relationship (either by removal from the collection or by setting
    the relationship to null), the orphaned Entity will be removed. If the
    orphaned Entity is a detached, new, or removed Entity, the semantics do not
    apply.
    
    If enabled and the remove operation is applied to the source Entity, the
    remove operation will be propagated as defined in the cascade section.
    
    The remove operation is applied at the time of the flush operation. The
    orphans removal functionality is intended for Entities that are privately
    "owned" by their parent Entity.
    
    **Example**:
    
    A 'Basket' Entity holds a list of 'Product' Entities. What happens if
    ``basket.getProducts().remove(..)`` is called?
    
    -  Remove orphans is enabled: The product is removed from the list of
       referenced products even if the Entity is reloaded or refreshed.
    
    -  Remove orphans is disabled: The product stays in the list of referenced
       products if the Entity is reloaded or refreshed.

.. note::
  Internally, the Jakarta Persistence API is used to implement Entity Classes and
  their relations. For further details, please refer to the official `Jakarta
  Persistence API documentation
  <https://jakarta.ee/learn/docs/jakartaee-tutorial/current/persist/persistence-intro/persistence-intro.html>`_.
