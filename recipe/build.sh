

cmake ${CMAKE_ARGS} -S . -B build \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_AES=OFF

cmake --build build
cmake --install build


cmake ${CMAKE_ARGS} -S . -B sbuild \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_AES=OFF

cmake --build sbuild
cmake --install sbuild
