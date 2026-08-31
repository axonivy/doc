Structure
=========

The content management system is hierarchical and consists of **content objects**.
Each content object has a type. We distinguish the three types folders, texts
and files.

- **Folders** are used to represent the hierarchical structure.
- **Texts** are needed to store multilingual texts in the :file:`cms_*.yaml`.
- **Files** represent images and documents stored directly in the CMS folder.

A content object can be uniquely addressed via a path (e.g.
:code:`/test/label`), which in turn represents the hierarchical structure.
Content objects (except folders) have **content object values**, where each
value is bound to a locale.

A locale defines the language and optionally the region. This allows you to
define values for different languages and even for different regions. You can
define a value for English :code:`en` or be more specific for US-English with
:code:`en_US` or British-English with :code:`en_GB`.
