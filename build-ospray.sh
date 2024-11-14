#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/ospray" ]; then
	mkdir ${APPS_ROOT}/ospray
fi

if [ ! -d "${APPS_ROOT}/ospray/install" ]; then
	mkdir ${APPS_ROOT}/ospray/install
fi

if [ ! -d "${APPS_ROOT}/ospray/src" ]; then
	git clone https://github.com/RenderKit/ospray.git ${APPS_ROOT}/ospray/src
fi

if [ ! -d "${APPS_ROOT}/ospray/build" ]; then
	mkdir ${APPS_ROOT}/ospray/build
fi

cmake \
 -DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/ospray/install \
 -DCMAKE_BUILD_TYPE:STRING=Release \
 -DBUILD_GLFW:BOOL=OFF \
 -DBUILD_OIDN:BOOL=ON \
 -DBUILD_GPU_SUPPORT:BOOL=OFF \
 -DBUILD_OSPRAY_APPS:BOOL=ON \
 -DBUILD_OSPRAY_MODULE_CPU:BOOL=ON \
 -DBUILD_OSPRAY_MODULE_MPI:BOOL=OFF \
 -DBUILD_TBB_FROM_SOURCE:BOOL=OFF \
 -DDOWNLOAD_ISPC:BOOL=ON \
 -DDOWNLOAD_TBB:BOOL=OFF \
 -DINSTALL_IN_SEPARATE_DIRECTORIES:BOOL=OFF \
 -S ${APPS_ROOT}/ospray/src/scripts/superbuild \
 -B ${APPS_ROOT}/ospray/build

cmake --build ${APPS_ROOT}/ospray/build --parallel 8
