//
//  KlimaApp.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI
import UserNotifications

@main
struct KlimaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TargetStore())
                .environmentObject(FriendStore())
                .onAppear {
                    registerForPushNotifications()
                }
        }
    }
    
    func registerForPushNotifications() {
      UNUserNotificationCenter.current() // 1
        .requestAuthorization(options: [.alert, .sound, .badge]) { // 2
          granted, error in
          print("Permission granted: \(granted)") // 3
      }
    }
}
