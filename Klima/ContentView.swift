//
//  ContentView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TargetsView()
                .tabItem {
                    Label("Ziele", systemImage: "square.grid.2x2.fill")
                }
            
            SharingView()
                .tabItem {
                    Label("Freunde", systemImage: "person.3.fill")
                }
            
            SharingView()
                .tabItem {
                    Label("Münster", systemImage: "house.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TargetStore())
            .environmentObject(FriendStore())
            .environment(\.colorScheme, .dark)
            .previewDevice(.init(stringLiteral: "iPhone X"))
    }
}
