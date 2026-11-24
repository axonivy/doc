:orphan:

.. _validation-code-ivy.dataclass.persistent-type-not-whitelisted:

ivy.dataclass.persistent-type-not-whitelisted
---------------------------------------------

**Message:** The stability of the type '${type}' of the Attribute '${field}' for persistence is not guaranteed

.. start: manual doc

**Description**

The type is not on Axon Ivy's persistence whitelist. The whitelist includes types from packages whose names start with these prefixes:

* ``java.lang``
* ``java.util``
* ``java.math``
* ``ch.ivyteam.ivy.scripting.objects``

The whitelist also includes :public-api:`CompositeObject </ch/ivyteam/ivy/scripting/objects/CompositeObject.html>` and Java types annotated with :public-api:`@IvyPersistable </ch/ivyteam/ivy/scripting/objects/persistable/IvyPersistable.html>`.

Types outside the whitelist are not necessarily unsafe, but Axon Ivy cannot guarantee that their persisted representation remains compatible across application upgrades. Changes such as renaming or moving a class, removing or renaming fields, or changing field types can make previously stored data fail to deserialize or restore incorrectly. Only persist a type if you can maintain compatibility for as long as data using it may remain stored.

**How to fix**

* Prefer a suitable type from one of the whitelisted packages.
* If possible, replace the Java type with an Axon Ivy Data Class created in the :ref:`Data Class Editor <data-class-editor>`.
* If you need to keep it as a Java type and you can maintain its compatibility, mark it as persistable with :public-api:`@IvyPersistable </ch/ivyteam/ivy/scripting/objects/persistable/IvyPersistable.html>`:

  .. code-block:: java

     import ch.ivyteam.ivy.scripting.objects.persistable.IvyPersistable;

     @IvyPersistable
     public class Person {
       ...
     }

* If you cannot modify the type, for example because it comes from a third-party library, you can suppress this warning on the Data Class Attribute:

  ``@SuppressWarnings("ivy.dataclass.persistent-type-not-whitelisted")``

  .. warning:: Suppressing the warning does not make the type safer; use this only when you have verified that persisting it is intentional and accept responsibility for its compatibility.
