set CC=cl

cmake -S . -B build ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_INSTALL_LIBDIR="%LIBRARY_PREFIX%\lib" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  -DUSE_AES=OFF ^
  -DMZ_FORCE_FETCH_LIBS=OFF

cmake --build build --config Release

cmake --install build --config Release
