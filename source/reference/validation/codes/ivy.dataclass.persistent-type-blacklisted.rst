:orphan:

.. _validation-code-ivy.dataclass.persistent-type-blacklisted:

ivy.dataclass.persistent-type-blacklisted
-----------------------------------------

**Message:** The type '${type}' of the Attribute '${field}' is unsuitable for persistence

.. start: manual doc

**Description**

The type matches one of these blacklisted package prefixes:

* ``javafx``
* ``ch.ivyteam``
* ``org.apache.commons``

Types in these packages are considered unsuitable for persistence because their internal representation is not intended as a stable persistence contract. Changes in Axon Ivy or the library may cause previously stored data to fail to deserialize or be restored incorrectly.

The persistence whitelist takes precedence, so some types under these prefixes may still be accepted. For example, types in ``ch.ivyteam.ivy.scripting.objects``, types annotated with :public-api:`@IvyPersistable </ch/ivyteam/ivy/scripting/objects/persistable/IvyPersistable.html>`, and subclasses of :public-api:`CompositeObject </ch/ivyteam/ivy/scripting/objects/CompositeObject.html>` are accepted when all types used by the Attribute are whitelisted. See :ref:`validation-code-ivy.dataclass.persistent-type-not-whitelisted` for details.

**How to fix**

* Prefer a suitable type from the persistence whitelist.
* If possible, replace the Java type with an Axon Ivy Data Class created in the :ref:`Data Class Editor <data-class-editor>`.
* If you need to keep it as a Java type and you can maintain its compatibility, annotate it with :public-api:`@IvyPersistable </ch/ivyteam/ivy/scripting/objects/persistable/IvyPersistable.html>`.
* If you cannot modify the type, for example because it comes from a third-party library, you can suppress this warning on the Data Class Attribute:

  ``@SuppressWarnings("ivy.dataclass.persistent-type-blacklisted")``

  .. warning:: Suppressing the warning does not make the type suitable for persistence; use this only when persisting it is intentional and you accept responsibility for compatibility.
