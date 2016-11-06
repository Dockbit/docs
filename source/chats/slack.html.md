---
title: Slack
meta: Slack is the primary interface to operate Dockbit Pipelines from within your team chat, enabling anyone on your team to deploy with a single chat command.
toc: true
---

Slack is one of the [supported chat systems](/chats) in Dockbit. It's used as the primary interface to operate Dockbit Pipelines from within your team chat, enabling anyone on your team to deploy with a single chat command.

## Connecting Slack

After you've signed up and created your Dockbit Team, you will be presented with the list of chat providers. Choosing Slack logo and clicking **Connect** will send your browser to the Slack site, where you will need to choose your team and authorize the [Dockbit Slack Application](https://slack.com/apps/A0FLBC3JQ-dockbit).

![Connecting Slack](../images/chats/slack-connect.png)

If you've skipped connecting Slack during the onboarding process, you can always re-connect again by going to your **Team Settings**, choosing **Slack** section and clicking on the **Add to Slack** button.

You can now type `/dockbit help` command in your team chat and it will tell you everything you can do with Dockbit.

When you interact with the Slack bot for the first time, you will be asked to authenticate yourself with [GitHub](../../vcs/github). This is a required step to let us correctly map your Slack account to the Dockbit account. After that, you are all set to operate Dockbit from within your team Slack.


## Configuring Pipeline Slack Channel

Once you've connected Slack, you can choose one of your Slack Channels in the Pipeline Settings. Dockbit will then send all the notifications related to this pipeline to the configured Slack channel.

![Configuring Pipeline Slack Channel](../images/chats/slack-pipeline-channel.png)


## What is Dockbot?

**Dockbot** is your friendly [Slack bot](https://api.slack.com/bot-users) that handles a number of things for you in Slack:

* It lists your team Slack channels in the Pipeline Settings
* It sends deployments notifications to the channel configured above
* It sends direct messages to the users if for some reason deployment can't be performed

Can it read my team messages, you may ask? No, _dockbot_ does not listen to your Slack messages. We use the `/dockbit` [Slash](https://api.slack.com/slash-commands) command as the primary chat interface, so Dockbit only sees what you instruct it to do. Hence, you do not need to invite _dockbot_ to your channels for the Dockbit commands to work.
