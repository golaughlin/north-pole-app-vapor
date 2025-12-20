import Fluent
import Vapor
import struct Foundation.UUID
import struct Foundation.Date

final class Child: Model, @unchecked Sendable, Content {
    static let schema: String = "children"
    
    @ID(custom: .id, generatedBy: .database)
    var id: Int?

    @Field(key: "firstName")
    var firstName: String

    @Field(key: "lastName")
    var lastName: String

    @Field(key: "dateOfBirth")
    var dateOfBirth: Date

    @Field(key: "hometown")
    var hometown: String

    @Field(key: "isNaughty")
    var isNaughty: Bool

    init() { }

    init(id: Int? = nil, firstName: String, lastName: String, dateOfBirth: Date, hometown: String, isNaughty: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.hometown = hometown
        self.isNaughty = isNaughty
    }
}