Incredibly simplistic example

https://christiantietze.de/posts/2025/04/calling-swift-library-functions-from-c/

Then emit

either a static library myfunc.o:

  $ swiftc -emit-object -parse-as-library -o myfunc.o ./myfunc.swift
or a dyamic library, libmyfunc.dylib (macOS) or libmyfunc.so (Linux):

  $ swiftc myfunc.swift -emit-library