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
                      NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                          LandmarkRow(landmark: landmark)
                        }
                  }
                  .animation(.default, value: filteredLandmarks)
                  .navigationTitle("Landmarks")
               
              }

          } detail: {
              Text("Select a Landmark")
          }

      }
}

#Preview {
    LandmarkList()
}
