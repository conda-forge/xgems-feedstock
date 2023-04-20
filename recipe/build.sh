#!/bin/bash

set -u
ferr(){
    echo "$@"
    exit 1
}

mkdir -p build
cd build

# Configure step
cmake -DPYTHON_EXECUTABLE:FILEPATH="$PYTHON" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -DXGEMS_BUILD_DEMOS=OFF \
      ..
# Build step
make -j${CPU_COUNT}
make install
