Incredibly simplistic example

Resources
- https://christiantietze.de/posts/2025/04/calling-swift-library-functions-from-c/
- https://gist.github.com/HiImJulien/c79f07a8a619431b88ea33cca51de787
- https://forums.swift.org/t/is-there-a-way-to-emit-c-c-header/71621/3


WARNING!! Must build twice to generate the header. 

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