.. _documents:

Documents
*********

Documents are files that belong to a workflow. Use them for content that is
created or uploaded while a process is running, for example an invoice,
evidence, or a generated report. The document API stores the document content
and its metadata, such as its name, path, size, and creation information.

The API is available in two scopes:

- ``ivy.case.documents()`` manages documents attached to the current case.
- ``ivy.wf.documents()`` manages documents attached to the current workflow context.


Adding and writing documents
============================

Create a document with a path, then write its content. Paths use ``/`` as the
separator and can contain folders. The path must be unique in the selected
case or workflow context. Use the case scope for files that belong to a case,
and the workflow scope for files that belong to the current workflow context.

.. code-block:: java

    // Add an uploaded file to the current case
    IDocument invoice = ivy.case.documents()
        .add("invoices/2026-001.pdf")
        .write()
        .withContentFrom(in.file);

    // Add text to the current workflow context
    IDocument note = ivy.wf.documents()
        .add("notes/processing.txt")
        .write()
        .useEncoding("UTF-8")
        .withContentFrom("Invoice received and queued for review.");

``withContentFrom`` accepts different types like simple text or other documents.


Reading documents
=================

Look up a document by its path or list all documents in a context.

.. code-block:: java

    IDocument invoice = ivy.case.documents().get("invoices/2026-001.pdf");
    String text = ivy.wf.documents().get(new Path("notes/processing.txt"))
        .read()
        .useEncoding("UTF-8")
        .asString();

    List<IDocument> caseDocuments = ivy.case.documents().getAll();
    List<IDocument> invoices = ivy.case.documents()
        .getAllBelow(new Path("invoices"));


Moving and deleting documents
=============================

Move a document to a new path or delete it when it is no longer needed.

.. code-block:: java

	 ivy.case.documents().move(invoice, new Path("invoices/processed/2026-001.pdf"));
	 ivy.case.documents().delete(invoice);

For long-running processes, keep only the documents that are required by the
business process and use stable, meaningful paths.


Storage Provider
================

The underlying storage provider is selected by the Engine configuration. The
API remains the same when documents are stored locally or in S3, so an
application does not need provider-specific document code. See the
:ref:`document-storage` configuration for an overview and the
:ref:`documents-local` and :ref:`documents-s3` sections for provider-specific
settings. The provider can be configured per security system. For clustered
Engines, use S3 or make the local storage root available to every node.


API Reference
=============

* :public-api:`IDocumentService </ch/ivyteam/ivy/workflow/document/IDocumentService.html>`
  contains the complete service API.
* :public-api:`IDocument </ch/ivyteam/ivy/workflow/document/IDocument.html>`
  contains document metadata and content access methods.

