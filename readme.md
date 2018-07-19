# now-build-env-starter-dynamic

An example of a dynamic deployment built using private npm
modules.

Example URL: https://now-build-env-starter-dynamic-rismihvmtj.zeit.sh/

## How to use

Create a [readonly npm token](https://docs.npmjs.com/getting-started/working_with_tokens):

```console
npm token create --read-only
```

Create a secret with its value (in this example we call it `npm-token`):

```console
# replace "MY_TOKEN_VALUE" with the value returned
# by the `npm token` command
now secret add npm-token MY_TOKEN_VALUE
```

Add a private repo (if you have any):

```console
yarn add @my-team/private-repo
```

Then you are ready to deploy!

```console
now
```

**Note:** this deployment is set to have its source code be public. If
you intend for it to be private, set `public: false` in `now.json`.

## How it Works

In `now.json` we defined a build env var:

- `NPM_TOKEN`

And a runtime env:

- `TEXT`

`NPM_TOKEN` is used to authenticate with the npm registry to be
able to download private repositories.

`TEXT` is used to respond to all incoming HTTP requests.

Finally, `.dockerignore` is used in order to only upload files into the build
stage that are necessary for this project to work.
