import Vapor

struct MyRealService: MyService {
    let logger: Logger
    let eventLoop: EventLoop
    
    func `for`(_ request: Vapor.Request) -> MyService {
        return MyRealService(logger: request.logger, eventLoop: request.eventLoop)
    }
    
    func doSomething() -> String {
        return "Tada"
    }
    
}
