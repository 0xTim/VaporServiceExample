import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.services.myService.use { app in
        MyRealService(logger: app.logger, eventLoop: app.eventLoopGroup.next())
    }

    // register routes
    try routes(app)
}
