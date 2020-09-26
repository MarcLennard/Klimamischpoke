//
//  KlimaApp.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

@main
struct KlimaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TargetStore())
                .environmentObject(FriendStore())
        }
    }
}
