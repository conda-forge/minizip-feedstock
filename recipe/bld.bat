@echo on

mkdir build
cd build

set CC=cl

cmake -G Ninja ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
  -DBUILD_SHARED_LIBS=ON ^
  -DMZ_FORCE_FETCH_LIBS=OFF ^
  ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1

cd ..

rem rename the lib/dll to libminizip
copy %LIBRARY_BIN%\minizip.dll %LIBRARY_BIN%\libminizip.dll
del %LIBRARY_BIN%\minizip.dll
if %ERRORLEVEL% neq 0 exit 1
copy %LIBRARY_LIB%\minizip.lib %LIBRARY_LIB%\libminizip.lib
del %LIBRARY_LIB%\minizip.lib
if %ERRORLEVEL% neq 0 exit 1
