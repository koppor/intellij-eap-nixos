# IntelliJ-EAP on NixOS

**Do not use**

Alternative:

1. Install `jetbrains-toolbox`
2. Launch toolbox
3. Go to "IntelliJ IDEA Ultimate".
4. Press the three dots
5. Click on "Available versions"
6. The topmost should be the EAP version
7. Click on "Install"
8. Wait
9. Now you can run IntelliJ Ultimate EAP.

## Usage

1. Download `.tar.gz` at [IntelliJ EAP](https://www.jetbrains.com/idea/nextversion/)
2. Extract
3. Adapt `default.nix` with your path. That means: Replace `/home/koppor/idea-IU-233.13135.103/` by the path you extracted the `.tar.gz` from JetBrains.
4. `nix-build`
5. `result/bin/idea`
6. IntelliJ should launch

## Development hints

### Without JavaFX

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

### With JavaFX

IntelliJ relies on `gtk4`, whereas JavaFX relies on `gtk3`.
I was not able to get it working.
