import Fluent
import Vapor

func routes(_ app: Application) throws {

    // Welcome message
    app.get { req in
        "HO! HO! HO! Welcome to Santa's Naughty and Nice List API!"
    }

    // List of childrren
    app.get("children") { req in
        "Children List"
    }

    // Info on individual child
    app.get("children", ":id") { req -> String in 
        let id = req.parameters.get("id")!
        return "Child \(id)"
    }

    // Add child to list
    app.post("chldren") { req in
        return "Child added to list"
    }

    // Update indivdual child
    app.put("children", ":id") { req in
        let id = req.parameters.get("id")!
        return "Child \(id) updated"
    }

    // Remove child from list
    app.delete("children", ":id") { req in
        let id = req.parameters.get("id")!
        return "Child \(id) removed from list"
    }

    try app.register(collection: TodoController())
}