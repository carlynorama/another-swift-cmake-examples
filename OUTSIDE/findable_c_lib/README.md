This library follows the process outlined in 

- https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#exporting-targets


which installs the library in a folder of your choice. 

This build script and the build script of the caller must both know where that folder is. 

The caller script doesn't point here, but at the exported folder. 




