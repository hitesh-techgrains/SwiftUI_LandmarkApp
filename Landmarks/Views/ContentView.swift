//
//  ContentView.swift
//  Landmarks
//
//  Created by admin on 10/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }


    var body: some View {
        
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star.fill")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        
        }

        //LandmarkList()

    }

}



#Preview {

    ContentView().environment(ModelData())

}
