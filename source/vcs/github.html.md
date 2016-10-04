---
title: GitHub
meta: GitHub is a web-based Git repository hosting service and one of the supported version control systems in Dockbit. It's also used as the primary authentication mechanism in Dockbit.
toc: true
---

[GitHub](https://github.com) is one of the [supported version control systems](/vcs) in Dockbit. It's also used as the primary authentication mechanism in Dockbit.

## How does it work?

Every Dockbit Pipeline is backed by a GitHub repository. When you create a Pipeline, Dockbit automatically generates a 4096 bit SSH key pair and injects the public key to your GitHub repository's [Deploy keys](https://developer.github.com/v3/repos/keys/). This enables Dockbit to update your Git repository prior to the actual deployment.

Additionally, Dockbit creates a [GitHub Webhook](https://developer.github.com/webhooks/), which is used to notify Dockbit of any changes in your repository and optionally trigger automatic deployments.

## Required GitHub permissions

The changes to the GitHub repository settings are performed on behalf of the user creating the Dockbit Pipeline. Therefore, make sure you have an [Admin permission](https://help.github.com/articles/repository-permission-levels-for-an-organization/) to the repository you are trying to use.

## Access to GitHub organization

If you do not see your GitHub repository in Dockbit, check that you have granted [Dockbit Application](https://github.com/settings/connections/applications/a4f33d5f7f560084de73) access to your GitHub organization. This page is also used to revoke Dockbit Application's access from any of your organizations.
