``` sh
# To setup submodule:
$ git submodule add https://github.com/apache/arrow-nanoarrow nanoarrow
$ git checkout apache-arrow-nanoarrow-0.6.0
$ # git add ...; git commit ...; git push ...

# To update submodule:
$ git submodule update --init --recursive

# To build nanoarrow:
$ cd nanoarrow/
$ mkdir build && cd build
$ cmake ..
$ cmake --build .
```
