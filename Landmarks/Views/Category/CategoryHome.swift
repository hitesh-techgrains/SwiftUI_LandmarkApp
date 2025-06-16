import SwiftUI



struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationView {
            List {
                    Text("Featured")
                    .font(.title)
                    .fontWeight(Font.Weight.semibold)
                    .listRowSeparator(Visibility.hidden)
                
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .navigationTitle("Featured")
                }
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
