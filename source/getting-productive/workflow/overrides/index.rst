.. _overrides:

Overrides
==========

Applications are often implemented as a general solution for a problem
and consist of multiple (dependent) projects. For many installations or
customer projects it is desirable that certain parts of such a generic
solution may be redefined in the context of a specific installation or
customer.

To permit this, Axon Ivy knows various concepts of context-sensitive
re-definitions:

-  Regular redefinition (e.g., for Content Objects and/or
   Configurations): Simply define an already existing artifact with the
   same name again in a different project.

-  Redefinition with overrides (e.g., for HTML Dialogs, HTML Dialog components
   and/or Sub Processes): Define a replacement component for an already
   existing component.

By defining overrides on project level, the lookup of a certain
component can be redirected to a replacement component. When a component
is referenced in a process model of that project then the lookup for
this component will yield a different component (i.e., the replacement)
at runtime instead of the originally referenced component.

Example: The Acme Web shop
--------------------------

As an example, imagine a web shop application. It contains the following
(generic) business process:

.. figure:: /_images/overrides/webshop-process.png
   :alt: Web Shop Process

The main process itself (Order) and each of the depicted sub processes
(DoOrder, ProcessOrder, Shipment) are defined in their own projects. All of
those projects together form a (generic) web shop application, depicted
below. The web shop project contains the business process and its
start; the Frontend project contains the DoOrder sub process; the
Backend project contains the ProcessOrder sub process; the Shipment
project contains the Shipping sub process.

.. graphviz:: case-scope-1.dot
   :align: center

We now define an additional project, *Acme web shop*. The new project is
dependent on web shop and the intention is to bundle all Acme-specific
overrides and adoptions in this project. The already existing projects
plus this new project form together a more specific and customized *Acme
web shop* application, with the following project dependency tree:

.. graphviz:: case-scope-2.dot
   :align: center

Knowing this, we can now specifically override and redefine components
from the original generic *web shop* application by redefining them
inside the *Acme web shop* project.

To define the *Acme web shop* project as an overriding
project. you can define a :ref:`strict_overriding` in
the generic *Web shop* application. 
To start with however, make sure your overriding project
is dependent on the base project and that each override is defined
in your overriding project.


.. _strict_overriding:

Strict Overriding
-----------------

If you want to customize your standard product for a specific
customer then the easiest way to realize overrides is by defining an
overriding project which contains all the customized components.
This means that overridden components are always resolved from
the overriding project, if they exist.

In our webshop example the overriding project would be the *Acme web shop*.
Starting a process from either the *Web shop* or the specialized
*Acme web shop* will always result in the overridden components
being loaded. Not overridden components will still be loaded from
the base *Web shop* project.

By defining the overriding project you can leave complex business processes
in the base project and only define specialized components in the overriding
project.

The lookup of components happens hierarchically. If the engine
cannot locate an overridden component in the overriding project
it will go down the dependency tree until it encounters the
wanted component. So maybe you want to provide a third webshop
which builds upon the *Acme web shop*. In this case the overriding
project would be the most specialized web shop in the dependency tree.


.. _strict_overriding_config:

Configuration
~~~~~~~~~~~~~~

   To strictly set the overriding project you have to configure it in
   the :ref:`app-yaml`.

   .. literalinclude:: sample-projectOverride.yaml
      :language: yaml

   .. note::

      While working on your project with strict overriding you have to define
      the overriding project in the **Designer** as well. This can easily be
      achieved with by setting the config in the :ref:`Engine Cockpit Application detail view <engine-cockpit-application-detail>`. 
      Alternatively you can find the :ref:`app-yaml` for the Designer under
      *designerDir/configuration/app-designer.yaml*.

   .. warning::

      Overrides cannot be "stacked" - you can only override a component that is
      not itself an override. Axon Ivy Designer will warn you about this.

