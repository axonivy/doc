Data Modeling
*************

Axon Ivy provides multiple possibilities to manage and store project-specific 
data. This chapter provides an overview of all the
possibilities with their advantages and disadvantages. Which one should
be used depends on the use case.

**Content Management**

    Stores static multi language content like labels, texts, titles, images.
    More information can be found in the chapter :ref:`cms`.

**Filesystem**

    Data can be stored in files, see the :ref:`documents` chapter for more info. 
    Static web files (CSS, JavaScript, Images, etc.) you place best beside your 
    HTML Dialog's or in the :file:`webContent` folder. The :file:`webContent` folder 
    can also contain :ref:`html-dialog-layouts`.

**Variables**

    Stores simple name/value configuration pairs. On the Axon Ivy Engine there is a :ref:`UI
    <engine-cockpit-variables>` to change the values of a Variable. More information
    can be found in the chapter :ref:`variables`. If you like variables on the user level, 
    consider using ``User Properties`` (see :public-api:`IUser </ch/ivyteam/ivy/security/IUser.html>`).

**Business Data**

    With business data you can store data without a schema in an `OpenSearch <https://opensearch.org/>`__ instance. Have a 
    look at the :ref:`business-data` chapter for more information.

**Database**

    Stores and accesses data in database systems. A dedicated database
    server is necessary and the database schema must be managed outside of
    Axon Ivy (see :ref:`process-element-db-activity`).
    You can also use the Java Persistence API (JPA) to manage database access 
    and generate database schema (see :ref:`persistence`).


.. toctree::
   :maxdepth: 1

   data-classes/data-classes
   business-data/index
   persistence/index
