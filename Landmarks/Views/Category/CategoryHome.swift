import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    fileprivate func extractedFunc() -> List<Never, TupleView<(some View, ForEach<[Dictionary<String, [Landmark]>.Keys.Element], Dictionary<String, [Landmark]>.Keys.Element, some View>)>> {
        return List {
            ImageSliderView()
                .frame(height: 200)
                .listRowInsets(EdgeInsets())
            
            ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets()) // Remove padding
            }
        }
    }
    
    var body: some View {
        NavigationView {
            extractedFunc()
            .listStyle(PlainListStyle()) // Removes additional padding or background
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
