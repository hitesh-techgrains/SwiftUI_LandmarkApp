import SwiftUI



struct CategoryRow: View {

    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items,id: \.name) { landmark in
                        NavigationLink {
                                     LandmarkDetail(landmark: landmark)
                                    } label: {
                                    CategoryItem(landmark: landmark)
                                }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}



#Preview {

    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
