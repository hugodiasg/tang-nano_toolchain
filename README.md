# tang-nano_toolchain
Tang Nano Toolchain (Apycula, Yosys, Gowin nextpnr and OpenFPGALoader).

# Install
Run the `./install.sh` to install all the tools.

# Running some project
To run a project, create a directory inside `/examples` with the `.v` and `.cst` files and execute these steps inside this directory:
- copy and edit the `define.sh` to set some variables according to your board and project.
- to run synthesis:  `../../util/synth.sh`
- to place and route: `../../util/place_route.sh`
- to flash to tangnano: `../../util/flash.sh`
