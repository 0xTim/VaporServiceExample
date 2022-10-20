import Vapor

public extension Application.Services {
    var myService: Application.Service<MyService> {
        .init(application: self.application)
    }
}
