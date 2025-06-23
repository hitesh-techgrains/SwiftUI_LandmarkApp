import SwiftUI

struct LandmarkList: View {
   
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .az

    
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
              (!showFavoritesOnly || landmark.isFavorite)
          }
      }
    
    var filteredItems: [Landmark] {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

            // Step 1: Filter
            var results = trimmedSearchText.isEmpty
                ? filteredLandmarks
                : filteredLandmarks.filter {
                    $0.name.localizedCaseInsensitiveContains(trimmedSearchText)
                }

            // Step 2: Sort
            switch sortOrder {
            case .az:
                results.sort { $0.name < $1.name }
            case .za:
                results.sort { $0.name > $1.name }
            }

            return results
       }
    
    
    var body: some View {
          NavigationSplitView {
              VStack {
                  Text("Landmarks")
                      .font(.title)
                      .fontWeight(.semibold)
                      .padding(.top, 10)
                  
                  Section(header: EmptyView()){
                      CustomSearchBar(searchText: $searchText,sortOrder: $sortOrder)
                  }

                  
                  Section(header: EmptyView()) {
                      Toggle(isOn: $showFavoritesOnly){
                          Text("Favorites Only")
                      }
                      .tint(.blue)
                      .listRowInsets(EdgeInsets()) // removes padding
                      .listRowBackground(Color.clear)
                      .padding(.horizontal)
                      .listRowSeparator(.hidden)
                  }
            
                  if filteredItems.isEmpty {
                      VStack {
                         Spacer()
                         Text("No Data Found")
                         .font(.headline)
                         .foregroundColor(.gray)
                         Spacer()
                         }
                         .frame(maxWidth: .infinity, maxHeight: .infinity)
                  }
                  else {
                      List{
                      ForEach(filteredItems,id: \.id) { landmark in
                          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                              LandmarkRow(landmark: landmark)
                          }
                          
                      }
                      .animation(.default, value: filteredLandmarks)
                      
                  }
                      .listStyle(.plain)
                  }
              }

          } detail: {
              Text("Select a Landmark")
          }

      }
}

#Preview {
    LandmarkList()
}
