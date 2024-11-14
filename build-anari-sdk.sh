#!/bin/bash
#
# Copyright (c) 2024 Victor Mateevitsi <mvictoras@gmail.com>
# Licensed under the MIT License. See LICENSE file in the project root for full license information.

APPS_ROOT=${APPS_ROOT:=.}

if [ ! -d "${APPS_ROOT}/anari" ]; then
	mkdir ${APPS_ROOT}/anari
fi

if [ ! -d "${APPS_ROOT}/anari/install" ]; then
	mkdir ${APPS_ROOT}/anari/install
fi

if [ ! -d "${APPS_ROOT}/anari/src" ]; then
	git clone https://github.com/KhronosGroup/ANARI-SDK.git ${APPS_ROOT}/anari/src
fi

if [ ! -d "${APPS_ROOT}/anari/build" ]; then
	mkdir ${APPS_ROOT}/anari/build
fi

cmake \
  -DCMAKE_INSTALL_PREFIX=${APPS_ROOT}/anari/install \
  -DBUILD_VIEWER=OFF \
  -S=${APPS_ROOT}/anari/src \
  -B=${APPS_ROOT}/anari/build 

cmake --build ${APPS_ROOT}/anari/build --target install --parallel 8
