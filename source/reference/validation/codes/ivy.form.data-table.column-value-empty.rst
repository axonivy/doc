:orphan:

.. _validation-code-ivy.form.data-table.column-value-empty:

ivy.form.data-table.column-value-empty
--------------------------------------

**Message:** Column value must not be empty. Use 'currentRow' in the EL expression (e.g. #{currentRow} or #{currentRow.<property>}) to access the row object.

.. start: manual doc

**Description**

Each non-action Data Table column needs a value expression to display a value from the current row. The expression can use ``currentRow``, which represents the row being rendered.

**How to fix**

Set the column's Value to an expression for a property on the row object. For example, if each row has a ``customerName`` property, use ``#{currentRow.customerName}``; use ``#{currentRow}`` when the row itself is the value to display.

