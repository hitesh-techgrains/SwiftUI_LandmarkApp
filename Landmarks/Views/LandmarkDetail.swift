//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by admin on 12/06/25.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
        var landmark: Landmark
        var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!

        }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                 .frame(height: 300)
            CircleImage(image: landmark.image)
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                      Text(landmark.name)
                         .font(.title)
                      FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                 HStack {
                     Text(landmark.park)
                     Spacer()
                     Text(landmark.state)
                 }
                 .font(.subheadline)
                 .foregroundStyle(.secondary)

                 Divider()

                Text("About \(landmark.name)")
                     .font(.title2)
                 Text(landmark.description)
            }
            .padding(.all, 20.0)
         }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    
    LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
}
