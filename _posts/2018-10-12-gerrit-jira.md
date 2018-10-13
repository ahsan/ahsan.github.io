---
layout: post
title: Making Gerrit play nice with JIRA
---

Having a seamless integration of the project management tool with your VCS just improves the overall productivity of your team. Apart from the obvious uses and benefits, it also increases visibility and promotes ownership.

I recently setup JIRA and wanted to integrate Gerrit with it. I've listed down the steps for setting up both of these tools and their integration in this post for anyone looking to do the same. On the Gerrit side of things, I used a plugin called *its-jira* to extract the issue ID from commit messages and then post the commit status on the issue page in JIRA.

# JIRA Setup
- [Download JIRA](https://www.atlassian.com/software/jira/download)
- The installation will guide setup procedure.
- Create a new user for Gerrit to use and note down its credentials
- Install [MeetMe](https://marketplace.atlassian.com/apps/1210874/gerrit-code-review-for-jira?hosting=server&tab=overview) plugin if you want a preview of all the commits on Gerrit related to a specific issue on the issue's page
- Setup Gerrit credentials for the MeetMe's Gerrit plugin by going to
```
Settings > Add-ons > Gerrit Settings
```

# Gerrit Setup
- The simplest way to get Gerrit up and running is to use an image from Dockerhub.
```bash
docker pull openfrontier/gerrit:2.14.x
```

- Spawn a container
```bash
docker run \
	--name gerrit \
        -e NOTEDB_CHANGES_AUTOMIGRATE=true \
	-e WEBURL=http://<host_ip>:8080 \
        -v ~/gerrit_volume:/var/gerrit/review_site \
        -p 8080:8080 \
        -p 29418:29418 \
        openfrontier/gerrit:2.14.x
```

- Install plugins
```bash
sudo docker exec -it gerrit bash
cd $GERRIT_SITE/plugins/
# its-base
wget https://gerrit-ci.gerritforge.com/view/Plugins-stable-2.14/job/plugin-its-base-bazel-stable-2.14/lastSuccessfulBuild/artifact/bazel-genfiles/plugins/its-base/its-base.jar
# its-jira
wget https://gerrit-ci.gerritforge.com/view/Plugins-stable-2.14/job/plugin-its-jira-bazel-stable-2.14/lastSuccessfulBuild/artifact/bazel-genfiles/plugins/its-jira/its-jira.jar
```

- Apply `its-jira` configuration to all projects in the Gerrit UI.
```bash
[plugin "its-jira"]
    enabled = true
```

- Apply `its-jira` configuration in the `gerrit.config`
```bash
vi $GERRIT_SITE/etc/gerrit.config
```

- Add these lines
```bash
[plugin "its-jira"]
    association = MANDATORY
[commentlink "its-jira"]
    match = ([A-Z]*-[1-9][0-9]*)
    html = "<a href=\"http://<JIRA_IP>:<JIRA_PORT>/browse/$1\”>$1</a>"
```

- Add the credentials of JIRA user in `gerrit.config`
```bash
[its-jira]
    url=http://<JIRA_IP>:<JIRA_PORT>
    username = gerrit
    password = gerrit
```

- Add rules in `actions.config`
```bash
mkdir -p $GERRIT_SITE/etc/its/
vi $GERRIT_SITE/etc/its/actions.config
```

- And add these lines:
```bash
[rule "rule1"]
    event-type = change-merged
    action = add-standard-comment
[rule "rule2"]
    event-type = comment-added
    approvalCodeReview = -2,-1
    action = add-comment Oh my Goodness! Someone gave a negative code review in Gerrit on an associated change.
```

- Restart Gerrit to apply all the changes
```bash
sudo docker restart gerrit
```

# NOTES
- Gerrit 2.15 does not support DraftPublished Event. This causes the *its-jira* plugin to crash. Downgrading Gerrit to 2.14 solves the problem.