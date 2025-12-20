import Fluent

struct CreateChild: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("children")
            .field("id", .int, .identifier(auto: true))
            .field("firstName", .string, .required)
            .field("lastName", .string, .required)
            .field("dayOfBirth", .datetime, .required)
            .field("hometown", .string, .required)
            .field("isNaughty", .bool, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("children").delete()
    }
}