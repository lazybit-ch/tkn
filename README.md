# tkn

[Tekton CLI](https://github.com/tektoncd/cli) `docker` image build.

## Build

Images are tagged using the version of the Tekton CLI release packaged in the image.

The version of the Tekton CLI is also set in the containers `TEKTON_CLI_VERSION` environment variable.

## Usage

Tekton CLI documention is unavailable outside the CLI `--help`.

Example: `docker run --rm -it docker.pkg.github.com/lazybit-ch/tkn/tkn:v0.8.0 version`
