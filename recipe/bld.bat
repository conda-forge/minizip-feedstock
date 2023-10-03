set CC=cl

cmake -S . -B build -G Ninja ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  -DUSE_AES=OFF

cd build
ninja install
cd ..

cmake -S . -B sbuild -G Ninja ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_SHARED_LIBS=OFF ^
  -DUSE_AES=OFF

cd sbuild
ninja install
cd ..
