import Fluent
import Vapor

func routes(_ app: Application) throws {

    // Welcome message
    app.get { req in
        return "HO! HO! HO! Welcome to Santa's Naughty and Nice List API!"
    }.description("Welcome message")

    // Children controllers
   try app.register(collection: ChildrenController())
}