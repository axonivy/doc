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
