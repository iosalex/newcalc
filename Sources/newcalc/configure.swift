
import Leaf
import Vapor

func configure(_ app: Application) async throws {
    app.views.use(.leaf)
    try routes(app)
}
