---
layout: post
title: Distributed Databases
---

Databases are one of the more challenging aspects of scaling a service. A monolithic database could meet the requirements in the start, but as the application scales, a single database tends to become the bottleneck. Apart from scaling, there might also be other situations where a single database architecture is not desirable. Multi-regional deployments, is one of them, where having a single database might introduce latency for requests originating from regions that are farther apart from the db.

Distributed databases allow you to scale your application's data layer. But since *there ain't such thing as a free lunch*, dividing your database into multiple instances (or sites) demands different trade-offs. The CAP theorem describes these trade-offs in a clear and concise manner.


---

## CAP-Theorem

A distributed database can only provide at most, only two of the following three guarantees about the system:

- **Consistency**<br>Every read receives the most recent write, or an error.
- **Availability**<br>Every request receives, at-least, a non-error response.
- **Partition Tolerance**<br>The system continues to function despite disruption in the network/servers up-time.

---

## Eventual Consistency

As opposed to immediate consistency, the eventual consistency model means that in a distributed database, if there are no new updates made on some item, eventually all the read operations for that item will get the latest value.

---

There are multiple strategies for distributing a database and each one has its own pros and cons. I will try to briefly describe some of these strategies.

## Muti-Master replication

The simplest idea in distributing a database is to have multiple sites running simultaneously. A load balancer in the front, distributes the load to individual sites. The serving site is then responsible to replicate the log to all the other sites in order to maintain consistency.

This arrangement might seem simple and resilient at first, but all distributed systems must obey the CAP theorem. The problem with this strategy is that in case one site has a down-time, or there is a partition in the network, the whole system loses consistency. This situation is known as the split-brain, where multiple sites are unaware of their peer's state and the whole system ends up in a non-consistent state.

## Master-Slave replication (read replicas)

Another strategy for distributing a database is the master-slave replication, in which there is one master db and multiple read replicas. In this topology, there is only one db (master) that is responsible for taking in write requests and there are multiple slaves that are only responsible for serving read requests. The master also has to take care of replicating its logs to all the slaves.

Among the drawbacks of this system are: master being a single point of failure, and slaves serving stale data in case of network partition.

## Distributed Consensus Algorithms

There are more sophisticated distributed databases that have advanced strategies for ensuring different guarantees from the CAP-theorem. These databases use distributed consensus algorithms which provide either consistent & partition tolerant or highly available & partition tolerant systems. Practically, partition tolerance is a necessary condition when building a distributed system. Therefore, a partition intolerant system is not desirable (it's just a singleton non distributed DB) in context of distributed systems. Some examples of these algorithms are:
- Raft consensus algorithm. Used by databases like etcd, CockroachDB.
- Saga pattern.
- Paxos algorithms.

The exploration of these algorithms is a task for future blog posts.


## Reading List
- [Distributed Databases, M. Tamer Özsu](https://cs.uwaterloo.ca/~tozsu/publications/distdb/distdb.pdf)
- [CAP Theorem](https://en.wikipedia.org/wiki/CAP_theorem)
- [In Search of an Understandable Consensus Algorithm (Raft)](https://raft.github.io/raft.pdf)

![xkcd](https://imgs.xkcd.com/comics/eventual_consistency.png)
Image source: [xkcd](https://xkcd.com/2315/).
