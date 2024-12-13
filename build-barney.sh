#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/barney" ]; then
	mkdir ${APPS_ROOT}/barney
fi

if [ ! -d "${APPS_ROOT}/barney/install" ]; then
	mkdir ${APPS_ROOT}/barney/install
fi

if [ ! -d "${APPS_ROOT}/barney/src" ]; then
	git clone --recursive https://github.com/ingowald/barney.git ${APPS_ROOT}/barney/src
fi

if [ ! -d "${APPS_ROOT}/barney/build" ]; then
	mkdir ${APPS_ROOT}/barney/build
fi

export CC=cc
export CXX=CC

CMAKE_PREFIX_PATH="${APPS_ROOT}/anari/install/lib64/cmake/anari-0.12.0" cmake \
 -DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/barney/install \
 -DCMAKE_BUILD_TYPE:STRING=Release \
 -DBARNEY_MPI=OFF \
 -DBARNEY_BUILD_ANARI=ON \
 -DOptiX_ROOT_DIR=${APPS_ROOT}/NVIDIA-OptiX-SDK-7.2.0-linux64-x86_64 \
 -S ${APPS_ROOT}/barney/src \
 -B ${APPS_ROOT}/barney/build

cmake --build ${APPS_ROOT}/barney/build --parallel 8
