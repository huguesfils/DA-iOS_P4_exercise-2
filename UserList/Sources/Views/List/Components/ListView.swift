import SwiftUI

struct UserListListView: View {
    let users: [User]
    let onAppearUser: (User) -> Void

    var body: some View {
        List(users) { user in
            NavigationLink(destination: UserDetailView(user: user)) {
                UserRowView(user: user, isGrid: false)
            }
            .onAppear {
                onAppearUser(user)
            }
        }
    }
}
