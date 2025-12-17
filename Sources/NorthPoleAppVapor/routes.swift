import Fluent
import Vapor

func routes(_ app: Application) throws {

    // Welcome message
    app.get { req in
        "HO! HO! HO! Welcome to Santa's Naughty and Nice List API!"
    }.description("Welcome message")

    // List of childrren
    app.get("children") { req in
        "Children List"
    }.description("List of children in Santa's List")

    // Info on individual child
    app.get("children", ":id") { req -> String in 
        guard let id: Int = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "Child \(id)"
    }.description("Info on an individual child in Santa's List")

    // Add child to list
    app.post("chldren") { req in
        return "Child added to list"
    }.description("Add a child to Santa's List")

    // Update indivdual child
    app.put("children", ":id") { req in
        guard let id: Int = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "Child \(id) updated"
    }.description("Update info on an individual child in Santa's List")

    // Remove child from list
    app.delete("children", ":id") { req in
        guard let id: Int = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "Child \(id) removed from list"
    }.description("Remove a child from Santa's List")

    try app.register(collection: TodoController())
}