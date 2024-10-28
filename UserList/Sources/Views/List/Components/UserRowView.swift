import SwiftUI

struct UserRowView: View {
    let user: User
    var isGrid: Bool = false
    
    var body: some View {
        if isGrid {
            VStack {
                AsyncImage(url: URL(string: user.picture.medium)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                
                Text("\(user.name.first) \(user.name.last)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
        } else {
            HStack {
                AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading) {
                    Text("\(user.name.first) \(user.name.last)")
                        .font(.headline)
                    Text("\(user.dob.date)")
                        .font(.subheadline)
                }
            }
        }
    }
}
