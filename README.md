``` sh
# How submodule was setup. No need to do this.
$ git submodule add https://github.com/apache/arrow-nanoarrow nanoarrow
$ git checkout apache-arrow-nanoarrow-0.6.0
# git add ...; git commit ...; git push ...

# To update submodule (after clone):
$ git submodule update --init --recursive

# To build nanoarrow:
$ cd nanoarrow/
$ mkdir build && cd build
$ cmake ..
$ cmake --build .

# Generate bundled source:
$ python3 nanoarrow/ci/scripts/bundle.py \
  --source-output-dir=c \
  --include-output-dir=c \
  --symbol-namespace=thea \
  --with-ipc \
  --with-flatcc
```
