import Vapor

public protocol MyService {
    func `for`(_ request: Request) -> MyService
    func doSomething() -> String
}
