import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        "HO! HO! HO! Welcome to Santa's Naughty and Nice List API!"
    }

    app.get("children") { req in
        "Children List"
    }

    app.get("children", ":id") { req -> String in 
        let id = req.parameters.get("id")!
        return "Child \(id)"
    }

    try app.register(collection: TodoController())
}