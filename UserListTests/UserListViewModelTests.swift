import XCTest
@testable import UserList

@MainActor
final class UserListViewModelTests: XCTestCase {    
    private var viewModel: UserListViewModel!
    private var repository: UserListRepository!
    
    override func setUp() {
        super.setUp()
        repository = UserListRepository(executeDataRequest: mockExecuteDataRequest)
        viewModel = UserListViewModel(repository: repository)
    }
    
    override func tearDown() {
        viewModel = nil
        repository = nil
        super.tearDown()
    }
    
    
    func testFetchUsersSuccess() async {
        // Given
        XCTAssertEqual(viewModel.users.count, 0)
        
        // When
        await viewModel.fetchUsers()
        
        // Then
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users[0].name.first, "John")
        XCTAssertEqual(viewModel.users[1].name.first, "Jane")
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testLoadMoreDataWithFetch() async {
        // Given
        await viewModel.fetchUsers()
        XCTAssertEqual(viewModel.users.count, 2)
        
        // When
        await viewModel.loadMoreDataWithFetch(currentItem: viewModel.users.last!)
        
        // Then
        XCTAssertEqual(viewModel.users.count, 4)
    }
    
    func testShouldLoadMoreData() async {
        // Given
        await viewModel.fetchUsers()
        
        // When & Then
        XCTAssertTrue(viewModel.shouldLoadMoreData(currentItem: viewModel.users.last!), "Should load more data when reaching the last user")
        XCTAssertFalse(viewModel.shouldLoadMoreData(currentItem: viewModel.users.first!), "Should not load more data if not at the last user")
    }
    
    func testReloadUsers() async {
        // Given
        await viewModel.fetchUsers()
        XCTAssertEqual(viewModel.users.count, 2)
        
        // When
        await viewModel.reloadUsers()
        
        // Then
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users[0].name.first, "John")
        XCTAssertEqual(viewModel.users[1].name.first, "Jane")
        XCTAssertFalse(viewModel.isLoading)
    }
}
