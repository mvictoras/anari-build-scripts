# ANARI, ANARI-OSPRay, VTK, and OSPRay Build Scripts

This repository contains scripts for setting up and building the following components:
- **ANARI SDK**
- **ANARI-OSPRay**
- **OSPRay**
- **VTK**

These scripts will clone the source code, build the software, and install it to the specified directory.

## Requirements
Make sure you have the following tools installed on your system:
- **CMake** (for building)
- **Git** (for cloning repositories)
- A compatible **compiler** (e.g., GCC, Clang)

## Directory Structure and Environment Setup
To use these scripts, set the `APPS_ROOT` environment variable to specify the root directory for source, build, and installation files. This directory will be used as follows:
- `src/` for cloned repositories
- `build/` for build files
- `install/` for installed binaries and libraries

### Setting `APPS_ROOT`
You can set `APPS_ROOT` in your terminal session:
```bash
export APPS_ROOT=/path/to/your/apps_root
```

## Build Scripts
- `build-anari-sdk.sh`: This script checks out, builds, and installs the ANARI SDK.
- `build-anari-ospray.sh`: This script checks out, builds, and installs the ANARI-OSPRay plugin for OSPRay.
- `build-vtk.sh`: This script checks out, builds, and installs VTK with OSPRay support.
- `build-ospray.sh`: This script checks out, builds, and installs OSPRay.
- `build-all.sh`: Builds all of the above scripts

## Usage
To build a specific component, navigate to the repository's root directory and run the corresponding script. For example:
```bash
./build-all.sh
```

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For questions or contributions, reach out at [mvictoras@gmail.com].