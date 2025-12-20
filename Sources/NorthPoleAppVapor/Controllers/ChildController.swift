import Vapor

struct ChildrenController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let children: any RoutesBuilder = routes.grouped("children")
        children.get(use: index)
        children.post(use: add)

        children.group(":id") { child in 
            child.get(use: show)
            child.put(use: update)
            child.delete(use: remove)
        }
    }

    // Get list of children in Santa's List
    func index(req: Request) async throws -> [Child] {
        try await Child.query(on: req.db).all()
    }

    // Add a new child to Santa's List
    func add(req: Request) async throws -> Child {
        let child: Child = try req.content.decode(Child.self)
        try await child.save(on: req.db)
        return child
    }

    // Show a single child in Santa's List
    func show(req: Request) async throws -> Child {
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return child
    }

    // Update a single child in Santa's List
    func update(req: Request) async throws -> Child {
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        let updatedChild: Child = try req.content.decode(Child.self)
        child.firstName = updatedChild.firstName
        child.lastName = updatedChild.lastName
        child.dateOfBirth = updatedChild.dateOfBirth
        child.hometown = updatedChild.hometown
        child.isNaughty = updatedChild.isNaughty
        try await child.save(on: req.db)
        return child
    }

    // Remove a child from Santa's List
    func remove(req: Request) async throws -> HTTPStatus {
        guard let child: Child = try await Child.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await child.delete(on: req.db)
        return .ok
    }
}