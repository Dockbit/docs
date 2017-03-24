---
title: Python
meta: Python is a programming language that lets you work quickly and integrate systems more effectively.
---

[Python](https://www.python.org/) is a programming language that lets you work quickly and integrate systems more effectively.

The [Python](https://www.python.org/) provider lets you execute any Python operation. Use it for such things as static site generation, code style analysis, asset compilation, or anything else you can imagine.

There's no configuration required for this provider, you only need to supply the Python based commands needed to deploy your application.

```
pip install -r requirements.txt
```

![Python](../images/integrations/python.png)

## Python versions

The default version of Python used is `3.4.4`.

We also have the following versions installed:

  * 2.7.11

You can switch to any of them and activate using [pyenv](https://github.com/yyuu/pyenv) with one of the following methods:

* Set the value of the Python version in the Dockbit Pipeline variable named `PYENV_VERSION`.
* Set the value of the Python version in the `.python-version` file at the root directory of your repository.

Dockbit follows pyenv's official [loading order](https://github.com/yyuu/pyenv#choosing-the-python-version).

As for [pip](https://pypi.python.org/pypi/pip), version `8.1.1` is installed.
[virtualenv](https://pypi.python.org/pypi/virtualenv) is also available at your disposal, version `15.1.0` is used.
