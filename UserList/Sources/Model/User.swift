import Foundation

struct User: Identifiable, Equatable {
    var id = UUID()
    let name: Name
    let dob: Dob
    let picture: Picture

    init(user: UserListResponse.User) {
        self.name = .init(title: user.name.title, first: user.name.first, last: user.name.last)
        self.dob = .init(date: user.dob.date, age: user.dob.age)
        self.picture = .init(large: user.picture.large, medium: user.picture.medium, thumbnail: user.picture.thumbnail)
    }

    // MARK: - Dob
    struct Dob: Codable, Equatable {
        let date: String
        let age: Int
    }

    // MARK: - Name
    struct Name: Codable, Equatable {
        let title, first, last: String
    }

    // MARK: - Picture
    struct Picture: Codable, Equatable {
        let large, medium, thumbnail: String
    }
}

