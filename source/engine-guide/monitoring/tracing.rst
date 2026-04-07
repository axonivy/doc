.. _tracing:

Request Tracing
===============

The tracing of requests allows you to find slow requests and analyze where those requests spend time 
(e.g., on which internal or external system a request spends time or is waiting).  
 
Engine Cockpit
--------------

You can activate and analyze the request tracing in the
:ref:`engine-cockpit-monitor-slow-requests` view of the :ref:`engine-cockpit`.

Logging
-------

If you experience poor performance, you can log the individual requests
to the Axon Ivy Engine log by setting the level of the request performance logger in :file:`[engineDir]/configuration/log4j2.xml`:

.. literalinclude:: ../../../target/resources/includes/configuration/templates/log4j2-performance-request.xml
  :language: xml
  :linenos:

This will create a log entry when the request has been received by the internal web server
and when the request has been processed with the time spent for processing.

A unique request identifier **requestId** is assigned to every request. This can be used
to find out what the Axon Ivy Engine did while processing the request.

**Example:**

.. literalinclude:: includes/request-tracing.log
  :language: none

The example above shows the log messages when the request with id **61** has entered
and exited the web server. During the request a database :code:`SELECT` statement has been executed.
The whole request has been processed in 16 ms.


Request Tracing Tools
---------------------

Axon Ivy Engine execution can be traced using external tools, such as Jaeger.
As reference look at our :link-url:`Jaeger Tracing <docker-tracing>` example
(`Jaeger <https://www.jaegertracing.io>`_ and  `OpenTelemetry <https://opentelemetry.io/>`_).


Trace Export
..............

Axon Ivy Engine natively supports exporting spans via the
`OpenTelemetry Protocol (OTLP) <https://opentelemetry.io/docs/specs/otlp/>`_ .
To activate the exporter, set the standard OTEL system property ``otel.traces.exporter=otlp``
and point it at your collector with ``otel.exporter.otlp.endpoint``
(e.g. ``http://localhost:4318``).

Set these as JVM system properties in :ref:`jvm-options`
(:file:`[engineDir]/configuration/jvm.options`):

  .. code-block::
  
     # Enable OTLP span export
     -Dotel.traces.exporter=otlp
     # Jaeger collector endpoint (OTLP HTTP receiver, default port 4318)
     -Dotel.exporter.otlp.endpoint=http://localhost:4318
     # Optional: tag all spans with a service / project name
     -Dotel.resource.attributes=service.name=my-ivy-engine
     # Optional: inter-system tracing propagation using W3C Trace Context
     -Dotel.propagators=tracecontext

- All properties can alternatively be supplied as environment variables using
  the `standard OTEL naming convention <https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/>`_ 
  (uppercase, dots replaced by underscores, e.g. ``OTEL_TRACES_EXPORTER=otlp``).
- Only the HTTP/protobuf transport is bundled; gRPC is not supported.
- For outgoing HTTP calls, only W3C Trace Context propagation is supported out of the box.


Inter-System tracing
........................

You can use an external tracing tool that propagates a trace ID in an HTTP header.
In that case, Axon Ivy will re-use the given trace ID as its **requestId**.
This allows you to aggregate log entries from different systems using the
**requestId**. Axon Ivy Engine supports the following HTTP headers:

=================  =============      
HTTP Header        Tool/Standard
=================  =============
traceparent        `W3C Trace Context <https://www.w3.org/TR/trace-context/>`_
uber-trace-id      `Jaeger <https://www.jaegertracing.io>`_
b3                 `Zipkin <https://zipkin.io/>`_
X-B3-TraceId       `Zipkin <https://zipkin.io/>`_
X-Amzn-Trace-Id    `Amazon X-Ray <https://docs.aws.amazon.com/xray>`_
ot-tracer-traceid  `Open Tracing <https://github.com/opentracing>`_
=================  =============

Note that only W3C Trace Context is redistributed by the Axon Ivy Engine when making outgoing HTTP calls.
