import Fluent
import Vapor
import FluentMySQL

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
    ) throws {
    
    //注册路由
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    //注册中间件
    var middlewares = MiddlewareConfig()
    middlewares.use(DateMiddleware.self)                  //增加时间戳
    middlewares.use(ErrorMiddleware.self)                 //补货错误
    services.register(middlewares)
    
    //注册数据库
    try services.register(FluentMySQLProvider())
    
    //通过模型创建数据库表
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .mysql)
    services.register(migrations)
    
    //初始化databaseconfig
    var databases = DatabaseConfig()
    let dbconfig = MySQLDatabaseConfig.init(hostname: "bllgo.com", port: 3306, username: "root", password: "wx787169", database: "cmbBanMcc")
    databases.add(database: MySQLDatabase(config: dbconfig), as: .mysql)  //添加数据库
    services.register(databases)
    
}
