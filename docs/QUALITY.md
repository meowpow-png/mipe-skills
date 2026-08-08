# Quality

Shell scripts are linted and format-checked, and Markdown is checked for consistent style.

Run everything at once:

```
just qualitycheck
```

## Shell scripts

Shell scripts are checked with shellcheck and shfmt

### Linting

Check what shellcheck would flag:

```
just lint-sh
```

Runs shellcheck against every `.sh` file in the repo. Pass files to check a subset instead:

```
just lint-sh scripts/push.sh
```

shellcheck prints nothing and exits `0` on a clean pass.
Silence means it found nothing to report.

### Formatting

Check what shfmt would change:

```
just fmt-sh
```

Runs shfmt in diff mode against every `.sh` file.
It will show what would change without touching anything.

Add `-w` to write the fixes:

```
just fmt-sh -w
```

Both accept file arguments the same way as `lint-sh`, and can be combined:

```
just fmt-sh -w scripts/push.sh
```

## Markdown

Markdown files are checked with dprint.

> [!NOTE]
> Included files and plugins are configured in `dprint.json`.

### Linting

Check what dprint would flag:

```
just lint-md
```

This checks every Markdown file and reports what would change.

### Formatting

To apply the fixes flagged by dprint:

```
just fmt-md
```
