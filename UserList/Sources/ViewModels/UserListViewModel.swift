import SwiftUI

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var isGridView = false
    
    private let repository: UserListRepository
    
    init(repository: UserListRepository = UserListRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() async {
        isLoading = true
        do {
            let users = try await repository.fetchUsers(quantity: 20)
            
            self.users.append(contentsOf: users)
            self.isLoading = false
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
        }
    }
    
    func loadMoreDataWithFetch(currentItem user: User) async {
        guard shouldLoadMoreData(currentItem: user) else { return }
        await fetchUsers()
    }
    
    func shouldLoadMoreData(currentItem item: User) -> Bool {
        guard let lastItem = users.last else { return false }
        return !isLoading && item.id == lastItem.id
    }
    
    func reloadUsers() async {
        users.removeAll()
        await fetchUsers()
    }
}
