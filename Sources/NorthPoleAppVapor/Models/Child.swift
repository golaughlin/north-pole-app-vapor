import Fluent
import struct Foundation.UUID
import struct Foundation.Date

final class Child: Model, @unchecked Sendable {
    static let schema = "children"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "firstName")
    var firstName: String

    @Field(key: "lastName")
    var lastName: String

    @Field(key: "dayOfBirth")
    var dayofBirth: Date

    @Field(key: "hometown")
    var hometown: String

    @Field(key: "isNaughty")
    var isNaughty: Bool

    init() { }

    init(id: UUID? = nil, firstName: String, lastName: String, dayOfBirth: Date, hometown: String, isNaughty: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.dayofBirth = dayOfBirth
        self.hometown = hometown
        self.isNaughty = isNaughty
    }
}