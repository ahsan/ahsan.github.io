---
layout: post
title: Interplanetary Internet
---

How will the Internet look like when humanity has reached interplanetary status? With companies like SpaceX aspiring to land the first humans on [Mars by 2024](https://www.bbc.com/news/science-environment-41441877), we don't have a lot of time to figure it out. Thankfully there has already been some development in this *space*.

In one of my [previous](https://ahsan.io/2018-12-29-world-runs-tech/) blog-posts I briefly mentioned why the Internet has become such a vital part of modern society and what is the infrastructure that is supporting it. Surely, as civilization conquers other planets, it would want to take the Internet *with it*.

<div align="center">
<img src="../img/martian.jpg" width="100%">
<span><i>Mark Watney without access to Instagram.</i></span>
</div>

Interplanetary communication is hard. Delays and interruptions are inherent in communication on this scale. Round-trip signal to our neighboring planet, Mars, takes a minimum of 7 and a maximum of 40 minutes. And this is when there is a unbroken connection. This is the major problem in making the Internet, interplanetary.

TCP/IP is the protocol that is powering the Internet today. Since it is confined to the short spans of the Earth, it assumes instantaneous, uninterrupted and strong connectivity throughout. In case of delays or interruptions, this protocol fails miserably.

But delays and interruptions are inevitable in galactic communication. That is why we need a new protocol. One which can tolerate network partitions and long delays. Enter Delay-tolerant networking (DTN) which is also sometimes called disruption-tolerant networking. DTN is an umbrella term which encompasses all projects related to networking that are robust in the face of delays and disconnectivity. InterPlaNet (IPN) is an example of one such project. It is a networking protocol that has been developed specifically to correct the shortcomings of the Internet Protocol (IP). It is supported by DARPA and NASA.

Now that we have explored the protocol of communication for Interplanetary Internet, it is time to take a look at the other side. The side of application business logic. On one hand, applications like social media can somewhat tolerate delays, but on the other, things like banking require strong and immediate consistency. Therefore, it is going to be a very challenging task to deploy applications on a *galactic* scale. Consistency across multiple planets is going to be a major problem.

One solution would be to treat each planet as an edge network. This edge network will have a drip cache from the primary source. In essence this will be a local Internet (an oxymoron, I know) for that specific planet. Consistency across planets is a new problem. But maybe we can solve it with an old solution. Maybe some form of the [Raft](https://raft.github.io/raft.pdf) consensus algorithm could be applied here as well. Nonetheless, application architecture will have to evolve. Simple techniques just will not cut the mustard.

All in all, it will be an interesting ride when we take the Internet with us on our exploration of this Universe. And I can't wait to contribute to its evolution. We might even have GCP/AWS regions on Mars one day, who knows :D But however things will turn out, we will surely see a lot of cool technology backing the Interplanetary Internet.


## Sources
- [InterPlaNet SIG](http://ipnsig.org/).
- Image credits to 20th Century Fox.