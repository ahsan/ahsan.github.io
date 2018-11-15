---
layout: post
title: Why Kubernetes?
share-img: https://ahsan.io/img/why_kubernetes_blue.png
---

Kubernetes is an open source container orchestration platform. It deploys, configures and automatically scales containerized applications for dynamic workloads on distributed systems clusters. Kubernetes has its origins in Google. Google runs virtually everything in a container. Search, YouTube, Gmail, Maps, Drive, *everything* runs in a container. Lots of them, too. According to Google, they run over [2 billion containers in a week!](https://cloud.google.com/containers/) The internal tool that Google uses for orchestration and management of all these containers for their plethora of services is called *Borg*. Kubernetes has inherited a lot of its different concepts from Borg (and Omega). These include things like *Pods*, shared network namespace per pod, *Services*, and even *Labels*. Running and scaling so many services in Linux containers for more than a decade has surely taught Google a lot of invaluable lessons. Each evolution of their orchestration platform incorporated these learnings and was heavily influenced by its predecessors. The latest of this evolution is Kubernetes. And Google has graciously made it open source. Google partnered with the Linux Foundation to create CNCF for promoting containers and donated Kubernetes to the community in mid-2015. On GitHub, Kubernetes is one of the top projects in terms of commits, authors and issues. Many big tech companies including Uber, eBay, The NYT, BlaBlaCar, etc run on Kubernetes. According to [Redmonk](https://redmonk.com/fryan/2017/09/10/cloud-native-technologies-in-the-fortune-100/), more than 50% of the Fortune 100 companies use Kubernetes for container orchestration.

That briefly covers *What* Kubernetes is but the question still remains,

<div align="center">
<img src="../img/why_kubernetes_blue.png" width="300">
</div>

Applications can be packaged and decoupled from the environment in which they're run using containers. Moreover, modern [micro-services](https://ahsan.io/2018-11-01-serverless-servers/) architectue based applications have a high affinity for containers. Containers provide high development velocity, business agility and easy scalability. Pretty much all of the modern applications that are developed are packaged in containers for efficient deployments and scaling. So with all of these containers everywhere for all sorts of services, their management becomes a big headache. Enter *Kubernetes*. Instead of manually provisioning containers, managing networks and monitoring application state, Kubernetes does it for you. Among the plethora of advantages of using Kubernetes for automated deployments instead of manual deployments, the [major ones are](https://kubernetes.io/):

1. Portability. Kubernetes essentially turns your infrastructure into code. Which can be version controlled, ported, replicated and automated.
1. Self healing of your application deployments without the need of any manual intervention.
1. Rolling updates without any downtime.
1. Easy Blue/Green testing of business logic.
1. Vibrant community. As mentioned earlier, Kubernetes has a big open-source community behind it.

and many more...

Some of the features of Kubernetes that make it so advantageous are:

1. Automatic binpacking: Kubernetes will always place a container on a host inside the cluster that has the resources required to run it.
1. Horizontal scaling: Kubernetes scales your application deployment up *and down* dynamically.
1. Automatic service discovery and load-balancing: Kubernetes provides easy visibility of services within and external to the cluster and can do load-balancing for you.
1. Storage orchestration: Kubernetes supports virtually every major storage solution. Local storage, NFS, iSCSI, Ceph, Cinder, GCP, AWS; you name it, Kubernetes supports it.
1. Self-healing: Kubernetes automatically restarts and reschedules containers that have crashed or gone in bad health.
1. Config & Sercret management: Kubernetes provides an easy and intuitive way of managing your application secrets and configurations and making them available inside your containers.


As if these features weren't enough, Kubernetes provides support for tools like [Istio](https://istio.io/) service-mesh which enhances the DevOps experience even further. Stay tuned for a blog-post on Istio!