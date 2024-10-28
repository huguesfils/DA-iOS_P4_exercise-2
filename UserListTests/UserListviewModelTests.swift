//import XCTest
//@testable import UserList
//
//final class UserListViewModelTests: XCTestCase {
//    
//    func testFetchUsersSuccess() async {
//        // Given
//        let expectedUsers = [User.mockUser1, User.mockUser2]
//        let repository = UserListRepository(executeDataRequest: { (request: URLRequest) async throws -> (Data, URLResponse) in
//            let data = try! JSONEncoder().encode(UserListResponse(results: expectedUsers.map(UserListResponse.User.init)))
//            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
//            return (data, response)
//        })
//        
//        let viewModel = UserListViewModel(repository: repository)
//        
//        // When
//        await viewModel.fetchUsers()
//        
//        // Then
//        XCTAssertEqual(viewModel.users, expectedUsers, "User count should match the expected count.")
//        XCTAssertEqual(viewModel.isLoading, false, "isLoading should be false after fetching.")
//    }
//    
//    func testFetchUsersFailure() async {
//        // Given
//        let repository = UserListRepository(executeDataRequest: { (request: URLRequest) async throws -> (Data, URLResponse) in
//            throw NSError(domain: "TestError", code: -1, userInfo: nil)
//        })
//        
//        let viewModel = UserListViewModel(repository: repository)
//        
//        // When
//        await viewModel.fetchUsers()
//        
//        // Then
//        XCTAssertTrue(viewModel.users.isEmpty, "Users list should be empty on fetch failure.")
//        XCTAssertEqual(viewModel.isLoading, false, "isLoading should be false after fetch failure.")
//    }
//    
//    func testReloadUsersClearsAndFetchesNewUsers() async {
//        // Given
//        let initialUsers = [User.mockUser1]
//        let newUsers = [User.mockUser2]
//        
//        let repository = UserListRepository(executeDataRequest: { (request: URLRequest) async throws -> (Data, URLResponse) in
//            let data = try! JSONEncoder().encode(UserListResponse(results: newUsers.map(UserListResponse.User.init)))
//            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
//            return (data, response)
//        })
//        
//        let viewModel = UserListViewModel(repository: repository)
//        viewModel.users = initialUsers
//        
//        // When
//        await viewModel.reloadUsers()
//        
//        // Then
//        XCTAssertEqual(viewModel.users, newUsers, "Users should be replaced with new data on reload.")
//    }
//}
//
//
//extension User {
//    // Utilisateurs fictifs pour les tests
//    static let mockUser1 = User(
//        name: User.Name(title: "Mr", first: "John", last: "Doe"),
//        dob: User.Dob(date: "1990-01-01", age: 31),
//        picture: User.Picture(large: "https://example.com/large.jpg", medium: "https://example.com/medium.jpg", thumbnail: "https://example.com/thumbnail.jpg")
//    )
//    
//    static let mockUser2 = User(
//        name: User.Name(title: "Ms", first: "Jane", last: "Smith"),
//        dob: User.Dob(date: "1995-02-15", age: 26),
//        picture: User.Picture(large: "https://example.com/large.jpg", medium: "https://example.com/medium.jpg", thumbnail: "https://example.com/thumbnail.jpg")
//    )
//}
//
//
//
