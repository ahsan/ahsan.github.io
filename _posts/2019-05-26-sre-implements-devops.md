---
layout: post
title: Class SRE Implements DevOps
---

Site Reliability Engineering (SRE) and DevOps are two ideas that have different origins but the same underlying objectives.

DevOps advocates for certain practices that increase success and productivity in a team building and running software. These include:

1. Reduce organization silos
2. Accept failure as normal
3. Implement gradual change
4. Leverage automation and tooling
5. Measure everything

DevOps is like an abstract class or an interface. On the other hand SRE implements this interface. SRE may also have other `methods` that do not exist in DevOps.

```TypeScript
abstract class DevOps {
  // Reduce organization silos
  abstract reduceOrganizationSilos(): BetterColaboration: 

  // Accept failure as normal
  abstract acceptFailureAsNormal(): ReliabilityGoal;

  // Implement gradual change
  abstract implementGradualChange(): ErrorBudget;

  // Leverage tooling and automation
  abstract leverageAutomation(): LongTermValue;

  // Measure everything
  abstract measureEverything(): BetterObservability;
}

class SRE implements DevOps {
  ...
}
```

## Reduce Organization Silos
Close collaboration between the development and operation teams aligns their goals together. This collaboration results in a sweet spot between velocity of change and reliability. SRE further implements this philosophy by sharing the same set of tooling across the whole organization. Both SWE and SREs use the same tools and platform in production. Both have the ownership of a system running in production. 

## Accept Failure as Normal
One of the major ideas in SRE is the definition of [SLOs, SLIs and SLAs](https://ahsan.github.io/2019-02-19-observability/). SLO is determined based on the collaboration between the different parts of the organization (Development, Operations, Sales). It quantifies the reliability of a system and sets a concrete goal. By setting this goal, it is automatically made clear that a `margin of failure` exists. This margin dictates the velocity of change that the system can handle. Release of more features in lesser amount of time means that there is a greater chance of failure. Whereas releasing less often entails more stability. As long as the SLOs are met, engineering can push more features. On the other hand, depletion of the error budget signals that the engineering effort needs to shift from building new features towards improving the overall system reliability.

Stretching the SLA towards 100% is very cost prohibitive. SLA of a distributed system is governed by the least reliable component of the whole system. Therefore optimizing for 100% availability is not only difficult but often times irresponsible.

## Implement Gradual Change
SRE strongly encourages small iterative deployments. Finding a bug in a small change and rolling it back to a stable state is much easier than doing it in a change that is millions of lines big. This makes fixing of bugs easier and faster as well.

## Tooling & Automation
SRE encourages investing time and resources on things that bring value to a distributed system in the long run. This is preferred over the immediate term value. Tooling and automation of manual tasks is part of the job for an SRE. 

Toil is something that is manual, repetitive, highly automatable and devoid of long-term value. Classic example is `SSHing` into a system to restart a service. SRE strives to minimize toil.

## Measure Everything
Measurement of different metrics in a distributed system is a critical gauge for measuring its success. Without measurement, the success of other practices can't be quantified. On the other hand, measurement also makes sure that a failure in the system is visible. It pushes the idea that operations is a software problem.


All in all, SRE is a very concrete and prescriptive way of implementing the DevOps ideas.

# Sources
1. Seth Vargo's [talk](https://www.youtube.com/watch?v=0UyrVqBoCAU) at Cloud Next IO '19.
2. Google's [Site Reliability Engineering](https://landing.google.com/sre/sre-book/toc/index.html) textbook.
2. [SRE vs DevOps](https://www.youtube.com/watch?v=uTEL8Ff1Zvk) series on YouTube.
