import SwiftUI

struct ToolbarView: View {
    @Binding var isGridView: Bool
    let reloadAction: () async -> Void
    
    var body: some View {
        HStack {
            Picker(selection: $isGridView, label: Text("Display")) {
                Image(systemName: "rectangle.grid.1x2.fill")
                    .tag(true)
                    .accessibilityLabel(Text("Grid view"))
                Image(systemName: "list.bullet")
                    .tag(false)
                    .accessibilityLabel(Text("List view"))
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button {
                Task {
                    await reloadAction()
                }
            } label: {
                Image(systemName: "arrow.clockwise")
                    .imageScale(.large)
            }
        }
    }
}
