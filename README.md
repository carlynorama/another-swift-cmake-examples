
Easier than CMake
```
## -parse-as-library because using @main in this example. 
swiftc -parse-as-library *swift -o hello
./hello
```

CMake can't make make files for swift

have to use Ninja or Xcode (which will make xcode project)

 ninja -C build

 cmake -G 'Ninja' ../

 $ mkdir build && cd build
$ cmake -G 'Ninja' ../
$ ninja hello
$ ./hello
Hello, world!