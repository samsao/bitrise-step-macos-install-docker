# macos-install-docker

Installs Docker on MacOS stack(s)

## How to use this Step

```
- git::https://github.com/samsao/bitrise-step-macos-install-docker.git@v0.0.1:
   title: Install Docker
```

This will install Docker so that you are able to build images with it. See
https://discuss.bitrise.io/t/add-docker-to-macos-installation/2344/2
to vote to include Docker by default on Mac OS X.

Inspiration for this step was taken from there.

#### Important Notice

**Important** There is an important gotcha however. Whenever you actually `docker`
to be available inside of your script, you need to add an environment variable.

In Bash, simply do at the top of your script:

```
eval $(docker-machine env default)
```

## How to contribute to this Step

1. Fork this repository
2. `git clone` it
3. Create a branch you'll work on
5. Do the changes you want to
6. Run/test the step before sending your contribution
  * You can also test the step in your `bitrise` project, either on your Mac or on [bitrise.io](https://www.bitrise.io)
  * You just have to replace the step ID in your project's `bitrise.yml` with either a relative path, or with a git URL format
  * (relative) path format: instead of `- original-step-id:` use `- path::./relative/path/of/script/on/your/Mac:`
  * direct git URL format: instead of `- original-step-id:` use `- git::https://github.com/user/bitrise-step-macos-install-docker.git@branch:`
  * You can find more example of alternative step referencing at: https://github.com/bitrise-io/bitrise/blob/master/_examples/tutorials/steps-and-workflows/bitrise.yml
7. Once you're done just commit your changes & create a Pull Request
