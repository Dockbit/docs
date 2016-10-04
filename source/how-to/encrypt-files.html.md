---
title: How to Encrypt Files
meta: This guide will show you how to encrypt sensitive files and use them securely in Dockbit.
---

Sometimes you might want to use configuration files with sensitive data in your deployment pipelines. Whether it's an _.rc-style_ with secrets, private key or other confidential information, you _must_ not store these files in your version control system. But how could then you use these files securely inside the pipelines? This guide will show you how to encrypt sensitive files and use them securely in Dockbit.

Before following the examples in this guide, make sure you have [OpenSSL](https://www.openssl.org/) tools installed.

1. First, generate a random key to encrypt our files with:

    ```
    openssl rand -base64 32
    ```

1. Then create the Dockbit Variable in the pipeline you want to use encrypted file from, for example, ```DOCKBIT_ENCRYPTION_KEY``` and set the value from the previously generated key. Do not forget to check **Sensitive** flag. Let's export it for convenience:

    ```
    export DOCKBIT_ENCRYPTION_KEY=<value of the variable copied above>
    ```

1. To encrypt a file named `secrets.json`, you can run the following command:

    ```
    openssl aes-256-cbc -e -in secrets.json \
                           -out secrets.json.enc \
                           -k $DOCKBIT_ENCRYPTION_KEY
    ```

1. After you've committed the `secrets.json.enc` file to your Git repository, you should be able to use it in the Dockbit pipeline. To do that, create a [Bash integration](/integrations/bash) stage and enter the command below:

    ```
    openssl aes-256-cbc -d -in secrets.json.enc \
                           -out secrets.json \
                           -k $DOCKBIT_ENCRYPTION_KEY
    ```

Since every stage of the Dockbit pipeline is executed in a clean slate by default, make sure to check the **Don't clean?** option of the stage that's followed after the command above. This will allow you to pick up the unencrypted file from the current working directory.
