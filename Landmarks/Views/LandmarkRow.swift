//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by admin on 12/06/25.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            Text(landmark.name)
                .padding(.leading, 10)
        
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .padding(.trailing, 5)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks

    LandmarkRow(landmark: landmarks[1])
}
