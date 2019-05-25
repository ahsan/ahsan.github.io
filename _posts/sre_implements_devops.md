---
layout: post
title: class SRE Implements DevOps
---

Site Reliability Engineering (SRE) and DevOps are two ideas that have different origins but the same underlying objectives.

DevOps advocates for certain practices that increase success and productivity. These include:

```TypeScript
abstract class DevOps {
  // Reduce organization silos
  abstract reduceOrganizationSilos(): 

  // Accept failure as normal
  abstract acceptFailureAsNormal(): ReliabilityGoal;

  // Implement gradual change
  abstract implementGradualChange(): ErrorBudget;

  // Leverage tooling and automation
  abstract leverageAutomation(): LongTermValue;

  // Measure everything
}
```

1. Reduce organization silos
2. Accept failure as normal
3. Implement gradual change
4. Leverage automation and tooling
5. Measure everything

DevOps is like an abstract class or an interface. On the other hand SRE implements this interface. SRE also has other `methods` that do not exist in DevOps.

## Reduce Organization Silos
Same shared set of tooling across the whole organization. Both SE and SREs use for production. Both contribute to the same tools.

## Accept Failure as Normal
One of the major ideas in SRE is the definition of [SLOs, SLIs and SLAs](https://ahsan.github.io/2019-02-19-observability/). SLO is determined based on the collaboration between the different parts of the organization (Development, Operations, Sales). It quantifies the reliability of a system and sets a concrete goal. By setting this goal, it is automatically made clear that a `margin` exists. This margin dictates the velocity of change that the system can handle. Release of more features in lesser amount of time means that there is a greater change of failure. Whereas releasing less often entails more stability. As long as the SLOs are met, engineering can push more features. On the other hand, depletion of the error budget signals that the engineering effort needs to shift from building new features towards improving reliability.

Stretching the SLA towards 100% is very cost prohibitive. SLA of a whole distributed system is governed by the least reliable component of the system. Therefore optimizing for 100% availability is not only difficult but often times irresponsible.

## Implement Gradual Change
SRE strongly encourages small iterative deployments. Finding a bug in a small change and rolling it back to a stable state is much easier than doing it in a millions lines of code. This makes fixing of the bug easier and faster as well.

## Tooling & Automation
Invest time and resources on things that bring value to your system in the long run. This is preferred over the immediate term value. Tooling and automation of manual tasks is part of the job for an SRE.

Toil is something that is manual, repetitive, highly automatable and devoid of long-term value. Classic example is `SSHing` into a system to restart a service.

## Measure Everything
Measure systems level metrics.


SRE is a very concrete and prescriptive way of implementing the DevOps ideas.


# Things that SRE does but DevOps might not

1. Sharing of metadata related to blameless-postmortem across the organization.

# Sources
1. Google Next '19 videos on youtube. 