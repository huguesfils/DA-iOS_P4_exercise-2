import SwiftUI

struct UserListGridView: View {
    let users: [User]
    let onAppearUser: (User) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserRowView(user: user, isGrid: true)
                    }
                    .onAppear {
                        onAppearUser(user)
                    }
                }
            }
        }
    }
}
