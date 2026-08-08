# Quality

Shell scripts are checked with shellcheck and shfmt.  
Both run through Docker, so you don't need either installed locally.

## Lint

```
just lint-sh
```

Runs shellcheck against every `.sh` file in the repo. Pass files to check a subset instead:

```
just lint-sh scripts/push.sh
```

shellcheck prints nothing and exits `0` on a clean pass. 
Silence means it found nothing to report.

## Format

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
