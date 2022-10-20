import Vapor
import App

struct MyFakeService: MyService {
    
    let cannedResponse: String
    let eventLoop: EventLoop
    let logger: Logger
    
    func `for`(_ request: Vapor.Request) -> App.MyService {
        return MyFakeService(cannedResponse: self.cannedResponse, eventLoop: request.eventLoop, logger: request.logger)
    }
    
    func doSomething() -> String {
        return cannedResponse
    }
    
    
}
