---
title: Docker
meta: Docker is an open-source project that automates the deployment of applications inside software containers.
---

[Docker](https://www.docker.com) is an open-source project that automates the deployment of applications inside software containers. It's used by developers and sysadmins to build, ship, and run distributed applications, whether on laptops, data center VMs, or the cloud.

The Docker provider lets you build Docker images as a step in your pipeline. You can also push the generated images to the [Docker Hub](https://hub.docker.com) or any other private registry of your choice.

If you'd like to use the Docker provider to push images to the [Docker Hub](https://hub.docker.com), you'll need to supply the image name (with an optional image tag), your [Docker ID](https://docs.docker.com/docker-hub/#create-a-docker-id) user name, and password. The username and password pair is passed to the `docker login` command, please refer to the [official documentation](https://docs.docker.com/engine/reference/commandline/login/) for more information. Additionally, pushing to a private registry requires the registry URL to be supplied.

By default, the Docker provider looks for a [Dockerfile](https://docs.docker.com/engine/reference/builder/) at the root of your source code repository. If that's not the case, you can supply a relative path to the directory containing the Dockerfile inside the repository.

The provider supports Docker [build-time arguments](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables-build-arg). If you have multiple arguments, you can supply them with comma as the separator. Here's an example:

```
ENVIRONMENT=production,SHA=$DOCKBIT_DEPLOYMENT_SHA
```

Take note of `$DOCKBIT_DEPLOYMENT_SHA`. Dockbit [variables](../../using-dockbit/variables) are available and can be used for setting dynamic values for the build-time arguments. Moreover, you can use Dockbit variables inside the Docker Provider configuration itself. For instance, your image name can be `your_organization/image_name:${DOCKBIT_DEPLOYMENT_SHA}` where the Docker image tag will be dynamically set to value of the SHA. Make sure to use curly braces around the variable for proper [variable expansion](http://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion).

Below you can find the configuration that can be used in the Dockbit Stage:

* ```Image``` - Required - Docker Image name (can include organizations and tags). Accepts multiple entries delimited by a `,`
* ```Registry username``` - Required - Docker Hub or Registry user name
* ```Registry password``` - Required - Docker Hub or Registry password
* ```Dockerfile path``` - Optional - Relative path to Dockerfile
* ```Registry url``` - Optional - Private registry URL
* ```Build arguments``` - Optional - Docker [build-time arguments](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables-build-arg)

Example: Building a Docker image with 2 build-time arguments:`SHA` and `ENVIRONMENT`, then pushing to the Docker hub (notice how no Registry URL is set).

![Docker-hub](../images/integrations/docker-1.png)

Example: Building a Docker image with 2 tags: `ruby` and `ruby:${DOCKBIT_DEPLOYMENT_SHA}`, then pushing to a private Docker registry located at `registry.example.com`.

![Docker-registry](../images/integrations/docker-2.png)

## Did you know?

Dockbit launches a completely separate virtual machine for Docker builds, ensuring exclusive access to the Docker daemon for enhanced security. The specifications of the virtual machine depends on the Dockbit [plan](../../using-dockbit/plans) applied to the account.
