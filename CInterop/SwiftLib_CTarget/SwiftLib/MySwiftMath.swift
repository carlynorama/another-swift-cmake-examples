@_cdecl("my_add")
public func myAdd(_ a:Int, _ b:Int) -> Int {
    a+b
}

@_cdecl("my_multi")
public func myMult(_ a:Int, _ b:Int) -> Int {
    a*b
}

@_cdecl("say_hello")
public func sayHello() {
    print("Hello, World!")
}