#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/oidn" ]; then
	mkdir ${APPS_ROOT}/oidn
fi

if [ ! -d "${APPS_ROOT}/oidn/install" ]; then
	mkdir ${APPS_ROOT}/oidn/install
fi

if [ ! -d "${APPS_ROOT}/oidn/src" ]; then
    git clone --recursive https://github.com/OpenImageDenoise/oidn.git ${APPS_ROOT}/oidn/src
fi

if [ ! -d "${APPS_ROOT}/oidn/build" ]; then
	mkdir ${APPS_ROOT}/oidn/build
fi

cmake \
 -DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/oidn/install \
 -DCMAKE_BUILD_TYPE:STRING=Release \
 -S ${APPS_ROOT}/oidn/src \
 -B ${APPS_ROOT}/oidn/build

cmake --build ${APPS_ROOT}/oidn/build --parallel 8
