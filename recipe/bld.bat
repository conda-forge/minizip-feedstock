@echo on

mkdir build
cd build

set CC=cl

cmake -G Ninja ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
  -DMZ_BUILD_TESTS=ON ^
  -DMZ_BUILD_UNIT_TESTS=ON ^
  -DBUILD_SHARED_LIBS=ON ^
  -DMZ_FORCE_FETCH_LIBS=OFF ^
  ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

ctest --output-on-failure
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1

cd ..
