.. _data-classes:

Data Classes
============

This chapter deals with Axon Ivy Data Classes. A Data Class generally holds the
data that flows through your business or User Dialog process. You can build
complex data structures in your Data Classes. Use composition to split up your
data if the amount of your data is getting large.

Types of Data Classes
---------------------

There are four kinds of Data Classes in Axon Ivy.

Global Data Classes
   The global Data Classes are located in the Data Class node in your project
   tree. They are accessible in your project and projects depending on it.

User Dialog Data Class
   Each User Dialog has its Data Class. This class holds the data that flows
   through your User Dialog process. In your User Dialog Data Class, you can
   define attributes with a type of a global Data Class. The User Dialog Data
   Class is visible only in the associated User Dialog Process.

Web Service (WS) Data Classes
   Axon Ivy generates a Web Service Data Class automatically when you create a Web
   Service configuration. The Web Service Data Class, like a global Data Class,
   is accessible in your project and projects depending on it. Use this Data
   Class to communicate with your Web Services.

Entity Classes
   :ref:`persistence-entity-classes` are like Global Data Classes but with
   additional information on where and how to store the data of a class and its
   attributes to a relational database.
