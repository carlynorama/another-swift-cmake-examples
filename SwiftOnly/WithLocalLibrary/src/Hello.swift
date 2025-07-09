import BeholdMyGloriousName

@main
struct Hello {
    static let responder = ResponseHandler()
    static func main() async throws {
        let arguments = CommandLine.arguments
        print("you just ran \(arguments[0]) with the following arguments: \(arguments.dropFirst())")
        print("anything else you'd like to say?")
        if let toEcho = readLine() {
            responder.verboseEcho(toEcho)
        } else {
            print("okay, maybe next time")
        }
        
        print("that's all")
    }
}