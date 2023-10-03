#!/bin/bash
set -ex

mkdir build
cd build

if [[ "${PKG_NAME}" == "minizip" ]]; then
    export CF_BUILD_SHARED="ON"
else
    export CF_BUILD_SHARED="OFF"
fi

cmake ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DBUILD_SHARED_LIBS=$CF_BUILD_SHARED \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_AES=OFF \
  ..

cmake --build .
cmake --install .

# clean up between builds
cd ..
rm -rf build
