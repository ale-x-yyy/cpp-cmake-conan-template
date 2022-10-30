# cpp-cmake-conan-template

Defines a C++ template project structure that uses CMake & Conan.

## Build

As suggested by the `conan` docs, a python `virtualenv` has to be prepared:
```
$ virtualenv -p python3 conan-env
$ .\conan-env\Scripts\activate
$ pip install -r requirements.txt
```

After that is done, the project can be built with one of the listed `presets` in `CMakePresets.json`
