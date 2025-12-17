import Fluent

struct CreateChild: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("children")
            .id()
            .field("firstName", .string, .required)
            .field("lastName", .string, .required)
            .field("dayOfBirth", .date, .required)
            .field("hometown", .string, .required)
            .field("isNaughty", .bool, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("children").delete()
    }
}