import Foundation

struct User: Codable {
    
    var id: String
    var name: String
    var email: String

    public init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
}
