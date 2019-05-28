---
layout: post
title: Class SRE Implements DevOps
---

Under the hood, a container is just a normal Linux process. It has additional configurations applied to it that are responsible for its isolation and management. When a container is launched using `docker run`, the docker daemon is only creating a new linux process. This process is visible to the host and can be listed using `ps`.

The extra configuration that is applied to these processes is behind all the benefits that containers provide.