

cmake ${CMAKE_ARGS} -S . -B build \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR="$PREFIX/lib" \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DMZ_BUILD_TESTS=ON \
  -DMZ_BUILD_UNIT_TESTS=ON \
  -DMZ_LIBCOMP=OFF \
  -DMZ_OPENSSL=ON \
  -DMZ_ZLIB=ON \
  -DMZ_FORCE_FETCH_LIBS=OFF

cmake --build build

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest --output-on-failure -C Release
fi

cmake --install build
