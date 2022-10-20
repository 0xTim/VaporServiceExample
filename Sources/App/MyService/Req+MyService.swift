import Vapor

extension Request.Services {
    var myService: MyService {
        self.request.application.services.myService.service.for(request)
    }
}
