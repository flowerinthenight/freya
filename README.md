``` sh
# To setup submodule:
$ mkdir submodules && cd submodules/
$ git submodule add https://github.com/apache/arrow-nanoarrow nanoarrow
$ git checkout apache-arrow-nanoarrow-0.6.0
# git add ...; git commit ...; git push ...

# To update submodule:
$ git submodule update --init --recursive

# To build nanoarrow:
$ cd submodules/nanoarrow/
$ mkdir build && cd build
$ cmake ..
$ cmake --build .

# Generate bundled source:
$ python3 submodules/nanoarrow/ci/scripts/bundle.py \
  --source-output-dir=c \
  --include-output-dir=c \
  --symbol-namespace=thea \
  --with-ipc \
  --with-flatcc
```
