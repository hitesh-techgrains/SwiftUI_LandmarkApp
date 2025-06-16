//
//  ImageSliderView.swift
//  Landmarks
//
//  Created by admin on 16/06/25.
//

import SwiftUI

struct ImageSliderView: View {
    let slides = [
        Slider(imageName: "turtlerock", title: "Turtle Rock", subtitle: "Joshua Tree National Park"),
        Slider(imageName: "stmarylake", title: "Yosemite Falls", subtitle: "Yosemite National Park"),
        Slider(imageName: "umbagog", title: "Grand Canyon", subtitle: "Grand Canyon National Park")
    ]

       @State private var currentIndex = 0
       
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TabView(selection: $currentIndex) {
                ForEach(0..<slides.count, id: \.self) { index in
                    ZStack(alignment: .bottomLeading) {
                        Image(slides[index].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                                
                        // Text overlay
                        VStack(alignment: .leading,) {
                            Text(slides[index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(slides[index].subtitle)
                                .font(.body)
                                .foregroundColor(.white)}
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // hide pagination
            
            // custom pagination indicators on the side
            HStack(spacing: 8) {
                           ForEach(0..<slides.count, id: \.self) { index in
                               Circle()
                                   .fill(index == currentIndex ? Color.white : Color.gray)
                                   .frame(width: 10, height: 10)
                                   .animation(.easeInOut, value: currentIndex)
                    }
                }
            .padding([.trailing, .bottom], 16)
        }
    }
}

#Preview {
    ImageSliderView()
}
