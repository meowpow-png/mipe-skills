# Usage

## Package

Builds a bundle manifest into an installable tarball under `build/bundles/`.

For example:

```
just package core
```

Once it's built, check what actually went in:

```
just inspect core
```

Re-running `package` overwrites the tarball, 
but if `build/` piles up with old output, wipe it first:

```
just clean
```

## Push

Publishes a packaged bundle to the registry.

For example:

```
just push core
```

It reads the version straight out of the tarball's manifest and pushes 
the bundle as `<version>` and `latest`. The tag always matches what's actually in the artifact.

To cut a new release, bump the version:

```
version: 0.2.0
```

Then rebuild and push:

```
just package core
just push core
```

Need something beyond `<version>` and `latest`, like a commit hash? Pass extra tags:

```
just push core dev-abc1234
```

By default, this goes to `ghcr.io/meowpow-png/mipe-skills`. Point it elsewhere with `REGISTRY`:

```
REGISTRY=ghcr.io/you/mipe-skills just push core
```

You need Docker auth for that registry. Run this on host:

```
docker login ghcr.io
```

Your credentials get mounted into the container automatically, no extra setup.
