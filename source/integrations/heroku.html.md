---
title: Heroku
meta: Heroku is a cloud platform for deploying and running modern apps integrated with today’s most popular developer tools and workflows.
---

[Heroku](https://www.heroku.com/platform) is a cloud platform based on a managed container system, with integrated data services and a powerful ecosystem, for deploying and running modern apps. The Heroku developer experience is an app-centric approach for software delivery, integrated with today’s most popular developer tools and workflows.

The Heroku provider lets you use Heroku [Command Line Interface (CLI)](https://devcenter.heroku.com/articles/heroku-command-line) to deploy your pipeline.

Configuring the Heroku provider requires an API Token and App name, please refer to the [official documentation](https://devcenter.heroku.com/articles/authentication#retrieving-the-api-token) for instructions on how to get your API key. If the provided App does not exist, it will be created.

Once you have the token and app the name, fill them in the Dockbit Stage configuration:

* ```API key``` - Heroku token
* ```App name``` - Heroku app name

Heroku Git remote and credentials are preconfigured automatically.

You can then execute any Heroku commands to run as part of your pipeline.

```
heroku run rake db:migrate
git push heroku $DOCKBIT_DEPLOYMENT_SHA:master
```

![Heroku](../images/integrations/heroku.png)

## Did you know?

Dockbit follows the [.netrc](https://devcenter.heroku.com/articles/authentication#api-token-storage) format for storing the API token for Heroku.
