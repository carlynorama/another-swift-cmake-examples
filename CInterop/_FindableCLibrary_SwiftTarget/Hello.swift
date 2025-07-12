// import MyFancyMath.MyFancyMath
import MyFancyMath
@main
struct Hello {
    static func main() async throws {
        let arguments = CommandLine.arguments
        print("you just ran \(arguments[0]) with the following arguments: \(arguments.dropFirst())")
        print("what would you like to add to 5?")
        if let toAdd = osti(readLine()) {
            // print(myAdd(5, Int(toAdd)))
            print(toAdd)
        } else {
            print("okay, maybe next time you'll give me a number I can work with.")
        }

        print("Anything you'd like to subtract from 5?")
        if let toSub = osti(readLine()) {
            print(my_sub(5, toSub))
        } else {
            print("okay, maybe next time you'll give me a number I can work with.")
        }
        
        print("that's all")
    }

    static func osti(_ s:String?) -> CInt? {
        if let s {
            return CInt(s)
        } else {
            return nil
        }
    }
}