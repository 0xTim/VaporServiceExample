@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testService() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        let testString = "This is a test - \(Int.random())"
        let myFakeServicce = MyFakeService(cannedResponse: testString, eventLoop: app.eventLoopGroup.next(), logger: app.logger)
        
        app.services.myService.use { _ in
            myFakeServicce
        }
        
        try app.test(.GET, "myService", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, testString)
        })
    }
}
