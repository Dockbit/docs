---
title: Node
meta: Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
---

[Node.js](https://nodejs.org/) is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.

The Node.js provider lets you execute any NPM [run-script](https://docs.npmjs.com/cli/run-script) based Node.js operation. Use it for such things as static site generation, code style analysis, asset compilation, or anything else as part of your deployment pipeline.

There's no configuration required for this provider, you only need to supply the `npm run-script` commands needed to deploy your application.

```
npm run-script build
```

![NodeJS](../images/integrations/nodejs.png)

## Node versions

The default version of Node.js is `0.12.15`.

We also have the following versions installed:

* 0.10.46
* 5.12.0
* 6.5.0

You can switch to any of them and activate using [NVM - Node Version Manager](https://github.com/creationix/nvm) by executing `nvm use <version>` before other commands.

## Did you know?

If Dockbit discovers that you have a `package.json` in your repository, it'll utilize [hacher](https://github.com/Dockbit/hacher) to cache your node/bower packages for faster builds.

In addition to the supported Node versions, Dockbit also supports [AVN](https://github.com/wbyoung/avn), allowing automatic switching to the node version defined in the `.node-version` file.
