mkdir build
cd build

set "PYTHON_FWD=%PYTHON:\=/%"

cmake -G Ninja ^
      -DXGEMS_PYTHON_INSTALL_PREFIX="%PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INCLUDE_PATH:PATH="%LIBRARY_INC%" ^
      -DPython3_EXECUTABLE="%PYTHON_FWD%" ^
      -DPython3_INCLUDE_DIR="%PYTHON_INCLUDE%" ^
      -DPython3_LIBRARY="%PYTHON_LIB%" ^
      -DXGEMS_BUILD_DEMOS=OFF ^
      -DCMAKE_CXX_FLAGS="/utf-8" ^
      ..

if errorlevel 1 exit 1
ninja -j 1
ninja install
if errorlevel 1 exit 1
