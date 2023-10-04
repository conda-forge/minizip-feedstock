@echo on

mkdir build
cd build

set CC=cl

if "%PKG_NAME%" == "minizip" (
    set "CF_BUILD_SHARED=ON"
) else (
    set "CF_BUILD_SHARED=OFF"
)

cmake -G Ninja ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
  -DBUILD_SHARED_LIBS=%CF_BUILD_SHARED% ^
  -DUSE_AES=OFF ^
  ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1

:: clean up between builds
cd ..
rmdir /s /q build
