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
    
    
    var filteredLandmarks: [Landmark] {

        modelData.landmarks.filter { landmark in
              (!showFavoritesOnly || landmark.isFavorite)
          }

      }
    
    var body: some View {

          NavigationSplitView {
              List{
                  Toggle(isOn: $showFavoritesOnly){
                      Text("Favorites Only")
                  }
                  ForEach(filteredLandmarks,id: \.id) { landmark in
                      NavigationLink{
                          LandmarkDetail(landmark: landmark)
                      }
                      label:{
                          LandmarkRow(landmark: landmark)
                      }
                  }
                  .animation(.default, value: filteredLandmarks)
                  .navigationTitle("Landmarks")
               
              }
              .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                          Menu {
                              NavigationLink{
                                  CategoryHome()
                              }
                              label:{
                                  Text("Category")
                              }
                              
                          } label: {
                              Image(systemName: "ellipsis")
                                  .rotationEffect(.degrees(90)) // vertical ellipsis
                          }
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
