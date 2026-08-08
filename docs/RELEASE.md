# Release

This describes how a bundle gets published as a versioned, tagged artifact.\
For the underlying commands themselves, see [USAGE.md](USAGE.md).

## Model

Each bundle in `bundles/*.yml` is versioned and released independently.\
The version lives in the bundle manifest:

```
version: 0.2.0
```

A release is triggered by pushing a git tag of the form:

```
<bundle>/v<version>
```

Pushing tags matching `*/v*`is restricted to maintainers via GitHub
tag protection rule, since a tag push is what triggers a real publication.

## Before tagging

1. Bump version in `bundles/<bundle>.yml`.
2. Promote that bundle's `## [Unreleased]` entries into a new version heading
3. Get both changes merged to `main` and wait for CI to go green

CI checks that every bundle still builds.

## Cutting a release

Once `main` has the version bump and changelog entry:

```
git tag core/v0.2.0
git push origin core/v0.2.0
```

The tag push triggers the release workflow, which validates
the release and publishes it. See `release.yml` for more
information on exactly what it checks and does.

## First bundle release

GHCR creates a package as private the first time something is pushed to it.
The first time a new bundle is released, a maintainer needs to manually
set that package's visibility to public in its GitHub package settings.

## Changelog format

`CHANGELOG.md` is a single, repository file covering every bundle. 
Changes land under `## [Unreleased]` as they're made:

```markdown
## [Unreleased]

### Added

- ...
```

At release time, whichever entries belong to the bundle
being released are moved out of Unreleased into their 
own top-level, dated heading, most recent first:

```markdown
## [core v0.2.0] - 2026-08-08

### Added

- ...
```

Each release entry gets a comparison/version link at the
bottom of the file, in the usual Keep a Changelog style.
This is easy to forget, so keep it in mind.

## Recovery from a bad release

Re-publishing an existing `<bundle>/<version>` is blocked in CI.
Once a version has reached the registry, that tag is immutable
from CI's perspective. If a release turns out to be bad:

- Never delete or force-overwrite a tag that already reached the registry
- Bump the version forward and release a fix the normal way

If the workflow fails before the registry push completes, the git tag
has never resulted in a publication, so it's safe to delete and re-push once fixed.
