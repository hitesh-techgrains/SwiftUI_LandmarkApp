//
//  LandmarkList.swift
//  Landmarks
//
//  Created by admin on 12/06/25.
//

import SwiftUI

struct LandmarkList: View {
   
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    
    var filteredLandmarks: [Landmark] {

        modelData.landmarks.filter { landmark in
              (!showFavoritesOnly || landmark.isFavorite)
          }

      }
    
    var filteredItems: [Landmark] {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
           if trimmedSearchText.isEmpty {
               return filteredLandmarks
           } else {
               return filteredLandmarks.filter { $0.name.localizedCaseInsensitiveContains(trimmedSearchText) }
           }
       }
    
    
    var body: some View {

          NavigationSplitView {
              VStack {
                  Text("Landmarks")
                      .font(.title)
                      .fontWeight(.semibold)
                      .padding(.top, 10)
                  CustomSearchBar(searchText: $searchText)
                      .padding(.bottom, 10)
            
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
                  else {List{
                      Toggle(isOn: $showFavoritesOnly){
                          Text("Favorites Only")
                      }
                      ForEach(filteredItems,id: \.id) { landmark in
                          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                              LandmarkRow(landmark: landmark)
                          }
                      }
                      .animation(.default, value: filteredLandmarks)
                      
                  }
                  }
              }
              //.searchable(text: $searchText, prompt: "Search fruits")

          } detail: {
              Text("Select a Landmark")
          }

      }
}

#Preview {
    LandmarkList()
}
