Incredibly simplistic example

Resources
- https://christiantietze.de/posts/2025/04/calling-swift-library-functions-from-c/
- https://gist.github.com/HiImJulien/c79f07a8a619431b88ea33cca51de787
- https://forums.swift.org/t/is-there-a-way-to-emit-c-c-header/71621/3


WARNING!! if you remove the `-j 1` from the ninja build command in the build script,  you must build twice to generate the header. Ninja will go full bore on concurrency and fail to generate the header before starting on main. 
- https://cmake.org/cmake/help/latest/command/add_dependencies.html


The hand compile version:

```bash
swiftc -emit-object -parse-as-library -o myfunc.o ./myfunc.swift
#or a dyamic library, libmyfunc.dylib (macOS) or libmyfunc.so (Linux):
swiftc myfunc.swift -emit-library
clang -c main.c -o main.o
clang myfunc.o main.o
# ... or dynamic lib:
#   clang libmyfunc.dylib main.o
./a.out
Hello, World!
```

<!-- TODO: wite the make file for comparison?  -->