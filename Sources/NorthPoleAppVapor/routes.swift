import Fluent
import Vapor

func routes(_ app: Application) throws {

    // Welcome message
    app.get { req in
        return "HO! HO! HO! Welcome to Santa's Naughty and Nice List API!"
    }.description("Welcome message")

    // List of childrren
    app.get("children") { req async throws -> [Child] in
        try await Child.query(on: req.db).all()
    }.description("List of children in Santa's List")

    // Info on individual child
    app.get("children", ":id") { req async throws -> Child in 
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return child
    }.description("Info on an individual child in Santa's List")

    // Add child to list
    app.post("children") { req async throws -> Child in
        let child: Child = try req.content.decode(Child.self)
        try await child.save(on: req.db)

        return child
    }.description("Add a child to Santa's List")

    // Update indivdual child
    app.put("children", ":id") { req async throws -> Child in
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }

        let updatedChild: Child = try req.content.decode(Child.self)

        child.firstName = updatedChild.firstName
        child.lastName = updatedChild.lastName
        child.dateOfBirth = updatedChild.dateOfBirth
        child.hometown = updatedChild.hometown
        child.isNaughty = updatedChild.isNaughty

        try await child.update(on: req.db)
        return child
    }.description("Update info on an individual child in Santa's List")

    // Remove child from list
    app.delete("children", ":id") { req async throws -> Child in
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await child.delete(on: req.db)
        return child
    }.description("Remove a child from Santa's List")
}