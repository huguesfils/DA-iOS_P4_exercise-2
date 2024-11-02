import SwiftUI

struct UserListListView: View {
    let users: [User]
    let onAppearUser: (User) async -> Void

    var body: some View {
        List(users) { user in
            NavigationLink(destination: UserDetailView(user: user)) {
                UserRowView(user: user, isGrid: false)
            }
            .onAppear {
                Task {
                    await onAppearUser(user)
                }
            }
        }
    }
}
