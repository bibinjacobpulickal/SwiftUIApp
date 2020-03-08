//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Bibin Jacob Pulickal on 09/11/19.
//  Copyright © 2019 bibinjacobpulickal. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var showGuessFlagView = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Bill split",
                               destination: WeSplitView())
                NavigationLink("Flag Nation",
                               destination: GuessFlagView(showSelf: $showGuessFlagView),
                               isActive: $showGuessFlagView)
            }
            .navigationBarTitle("SwiftUI")
            .onAppear(perform: {
                self.showGuessFlagView = false
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
