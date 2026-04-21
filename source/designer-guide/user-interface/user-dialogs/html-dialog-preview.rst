.. _html-dialog-preview:

HTML Dialog Preview
-------------------

The Html Dialog Preview gives you the ability to see the rendered output of a
Html Dialog. If you preview a Html Dialog that you already opened with
the process simulation, then it will restore the process data for the preview.

The preview is opened in the :ref:`dev-workflow-ui` frame with some tooling
(:ref:`html-dialog-autorefresh` and :ref:`html-dialog-navigation`). It can
execute dialog logic, so that the dynamic behaviour of the dialog like validation
or autocompletion logic can be tested.

|html-dialog-preview|

.. warning::

  The preview has some restrictions:

  - Previews of a :ref:`form-editor-component`, :ref:`html-dialog-component` and
    :ref:`static-jsf-pages` are not supported.
  - It uses a minimalistic implementation of a Task context, with the consequences that
    not every API is available.
  - Note that dialog logic is executed in the preview. This may manipulate your test data in the backend.


Accessibility
~~~~~~~~~~~~~

If you have a :ref:`form-editor` or a :ref:`html-dialog-editor` open and
focused, a new button appears in the Toolbar :code:`Open Dialog Preview`. Or use
the :code:`Play` button in the :ref:`Form Editor Toolbar
<form-editor-tool-bar>`.


.. _html-dialog-autorefresh:

Auto-Refresh
~~~~~~~~~~~~

If you have a dialog open (via Preview or :ref:`simulation`) in the
:ref:`dev-workflow-ui` and you make changes to the User Dialog View file, it
will trigger an auto-refresh of the view. State which is only represented in the
UI and is not held in the data will then be lost. This auto-refresh can be
disabled by clicking on the :code:`Disable auto refresh` button in the
:ref:`dev-workflow-ui`.

.. note::

  Some changes cannot be refreshed. In these cases, an error will be shown, and the
  preview needs to be restarted. 


.. _html-dialog-navigation:

Element Navigation
~~~~~~~~~~~~~~~~~~

On an open dialog in the :ref:`dev-workflow-ui` there is a **Selection Tool**
which gives you the possibility to select an element in the dialog, and it will
open the corresponding Html Dialog View and reveals the code of the rendered
element or selects it in the :ref:`form-editor`.

If the view is an :ref:`html-dialog-editor` we try to find the selected element
via the :code:`id` attribute. Because of this, it only works if the given element
has an :code:`id` defined. The selection also only opens the direct
corresponding Html Dialog View and does not navigate into additional views
(:ref:`html-dialog-multiple-views`) or Components
(:ref:`form-editor-component` or :ref:`html-dialog-component`).

.. |html-dialog-preview| image:: /_images/neo/editor-form-preview.png
