---
layout: post
title: Observability
---

Oranges are orange, water is wet, and observability is a best SRE practice. Applications today comprise of multiple independent sub-systems in the form of distributed microservices, that are in the case of containerization, more ephemeral. Having visibility of these individual components, their performance and behaviors is key in designing and maintaining efficient and resilient applications.

Observability means the ability to quickly and easily gain meaningful insights into a software system running in production. There are a lot of components that come under the umbrella of observability. Different projects can have different forms of observability. But a few of the basic ones are listed and briefly explored in this post.

## Monitoring

Monitoring is the  most basic component that makes up observability. Every application has its own set of metrics that ought to be monitored. But each application should at least monitor the following, 'The Golden Metrics' as Google calls them.

- **Traffic**

Traffic is the amount of requests that your application is handling. Essentially it is measured and represented in *Requests per second (RPS)* or *Queries per second (QPS)* over time.

- **Error Rate**

Error rate is the percentage of error responses (4xx/5xx) being served to the incoming traffic. It is helpful to measure this metric in terms of percentage of the total requests. This metric might give you an indication of a failure in some part of the application.

- **Latency**

 Users today expect applications to be super fast and responsive. Most of the latency comes from the application code, hence it is better to have a check on this metric of your system. Measuring the average latency is fine but it does not always give an accurate representation of overall user experience. Having a graph of percentile latencies on the other hand gives a much better picture. The trends of 50th percentile (median), 90th percentile and 99th percentile give much better insights into the overall UX.

 - **Saturation**

This is a custom and complex metric that is solely defined by the application itself. The point of saturation is the limit of some resource at which the application plummets straight to the ground. It can be a single or a combination of Percentage CPU utilization, Memory usage, Network bandwidth, etc. This metric can also be used as a signal to the service autoscaler. It can also be used to trigger alarms and warrant human intervention.



## Logging

Monitoring dashboards with graphs of all the metrics are a great start on the path to complete Observability. But at times, when the application needs to be debugged for some corner-case, monitored metrics by themselves are just not enough. Thankfully, *Application Logs* come in handy in this situation.

An application should log all of the incoming requests. There are a lot of plug and play loggers that are available for different web application frameworks. Morgan and Winston loggers are such examples for Node.js. These logs can be kept in the form of structured data that later makes it easy to find and perform operations on it. The retention period of these logs should be a reasonable amount of time, too. Logging can uncover trends in which the users of a service are interacting with it.


## SLIs, SLOs & SLAs

Here come a lot of TLAs (three-letter acronyms). They stand for Service Level *Indicators*, *Objective* and *Agreement* respectively.

An SLI is some metric that represents the performance of the system at any given time, it is also known as an SLA metric. E.g the amount of traffic that it is handling, throughput, error rate, availability etc. On the other hand, SLO is like an accumulation of SLI over a certain amount of time. In terms of calculus, it could be said that SLO is the integral of SLI over some period of time. SLOs are meant for the engineering and DevOps teams. They set the objectives for the internal teams for things like availability, etc. In contrast, SLAs are for more external facing roles. They are generally for use by the marketing and legal departments. SLAs are the performance metrics expected by the user of the service.


# Sources
1. [Site Reliability Engineering](https://landing.google.com/sre/books/) by Google.
2. [Distributed Systems Observability](https://www.oreilly.com/library/view/distributed-systems-observability/9781492033431/ch01.html#idm140608971259104) by Cindy Sridharan.