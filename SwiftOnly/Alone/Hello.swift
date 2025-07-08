@main
struct Hello {
    static func main() async throws {
        let arguments = CommandLine.arguments
        print("you just ran \(arguments[0]) with the following commands: \(arguments.dropFirst())")
        print("anything else you'd like to say?")
        let toEcho = readline()
        print("you said - \"\(toEcho)\"")
        print("that's all")
    }
}