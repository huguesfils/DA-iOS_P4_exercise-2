import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: UserListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isGridView {
                    UserListGridView(users: viewModel.users, onAppearUser: viewModel.loadMoreDataWithFetch)
                } else {
                    UserListListView(users: viewModel.users, onAppearUser: viewModel.loadMoreDataWithFetch)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarView(isGridView: $viewModel.isGridView, reloadAction: viewModel.reloadUsers)
            }
        }
        .onAppear {
            self.viewModel.fetchUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: .init())
    }
}
