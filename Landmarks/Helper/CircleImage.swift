//
//  CircleImage.swift
//  Landmarks
//
//  Created by admin on 10/06/25.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        VStack {
               image
                .resizable()
                .frame(width: 200, height: 200) // Set your desired size
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
