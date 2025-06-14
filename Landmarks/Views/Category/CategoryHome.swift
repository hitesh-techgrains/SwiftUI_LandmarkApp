import SwiftUI



struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
       ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
         CategoryRow(categoryName: key, items: modelData.categories[key]!)
  }
    }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
