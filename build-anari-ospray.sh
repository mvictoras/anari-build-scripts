#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/anari-ospray" ]; then
	mkdir ${APPS_ROOT}/anari-ospray
fi

if [ ! -d "${APPS_ROOT}/anari-ospray/install" ]; then
	mkdir ${APPS_ROOT}/anari-ospray/install
fi

if [ ! -d "${APPS_ROOT}/anari-ospray/src" ]; then
	git clone https://github.com/ospray/anari-ospray.git ${APPS_ROOT}/anari-ospray/src
fi

if [ ! -d "${APPS_ROOT}/anari-ospray/build" ]; then
	mkdir ${APPS_ROOT}/anari-ospray/build
fi

export PATH=${APPS_ROOT}/ospray/install/bin:$PATH

CMAKE_PREFIX_PATH="${APPS_ROOT}/anari/install/lib/cmake/anari-0.12.0" cmake \
	-DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/anari-ospray/install \
	-S ${APPS_ROOT}/anari-ospray/src \
	-B ${APPS_ROOT}/anari-ospray/build 

cmake --build ${APPS_ROOT}/anari-ospray/build --target install --parallel 8
