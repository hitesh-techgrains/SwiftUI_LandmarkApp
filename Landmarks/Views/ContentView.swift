//
//  ContentView.swift
//  Landmarks
//
//  Created by admin on 10/06/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        LandmarkList()

    }

}



#Preview {

    ContentView().environment(ModelData())

}
