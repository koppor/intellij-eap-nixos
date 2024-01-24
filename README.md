# IntelliJ-EAP on NixOS

## Usage

1. Download `.tar.gz` at [IntelliJ EAP](https://www.jetbrains.com/idea/nextversion/)
2. Extract
3. Adapt `default.nix` with your path. That means: Replace `/home/koppor/idea-IU-233.13135.103/` by the path you extracted the `.tar.gz` from JetBrains.
4. `nix-build`
5. `result/bin/java`
6. IntelliJ should launch

## Development hints

Ensure that `XDG_CACHE_HOME` environment variale is set.
Follow <https://nixos.wiki/wiki/Environment_variables>.

Run `sh -x idea.sh` to get the java command line parameters.
Use these command line parameters at following command:

    nix run "github:thiagokokada/nix-alien#nix-alien-ld" -- ./java <command lin parameters>

(Command from [nix-alien's README.md](https://github.com/thiagokokada/nix-alien#usage-without-installing))

The JVM will show errors with a non-found library.
Add that library to `$XDG_CACHE_HOME/nix-alien/<path-uuid>/fhs-env/default.nix`.
Repeat until the `nix-alien-ld`-wrapped `java` binary runs.

Replace `default.nix` of this repository by your `$XDG_CACHE_HOME/nix-alien/<path-uuid>/fhs-env/default.nix`.
Go to step 4 at [Usage](#usage).
