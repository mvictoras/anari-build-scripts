#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/vtk" ]; then
	mkdir ${APPS_ROOT}/vtk
fi

if [ ! -d "${APPS_ROOT}/vtk/install" ]; then
	mkdir ${APPS_ROOT}/vtk/install
fi

if [ ! -d "${APPS_ROOT}/vtk/src" ]; then
	git clone https://github.com/Kitware/VTK.git ${APPS_ROOT}/vtk/src
fi

if [ ! -d "${APPS_ROOT}/vtk/build" ]; then
	mkdir ${APPS_ROOT}/vtk/build
fi

CMAKE_PREFIX_PATH="${APPS_ROOT}/anari/install/lib64/cmake/anari-0.12.0" cmake \
 -DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/vtk/install \
 -DCMAKE_BUILD_TYPE=Release \
 -DVTK_MODULE_ENABLE_VTK_RenderingAnari=YES \
 -DVTK_ENABLE_OSPRAY=OFF \
 -DVTK_WRAP_PYTHON=ON \
 -DVTK_USE_EGL=ON \
 -DVTK_USE_MPI=ON \
 -S ${APPS_ROOT}/vtk/src \
 -B ${APPS_ROOT}/vtk/build

cmake --build ${APPS_ROOT}/vtk/build --target install --parallel 8
