import SwiftUI

// MARK: - Model
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let location: Location
    
    struct Location: Codable {
        var name: String
    }
}

struct Characters: Codable {
    let results: [Character]
}
