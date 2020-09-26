//
//  FriendStore.swift
//  Klima
//
//  Created by Kevin Klaebe on 26.09.20.
//

import Foundation

class FriendStore: ObservableObject {
    @Published var friends: [Friend]
    
    init() {
        friends = FriendStore.getFriends()
    }
    
    private static func getFriends() -> [Friend] {
        return [
            Friend(name: "Frank Thiel",
                   points: 150,
                   co2Saving: 35,
                   co2progress: 0.2,
                   pointProgress: 0.2,
                   targets: [
                    Target(
                        category: "Energie",
                        title: "Wechsel zu Ökostrom"
                    ),
                    Target(
                        category: "Energie",
                        title: "Schalte nachts Elektrogeräte aus"
                    ),
                    Target(
                        category: "Mobilität",
                        title: "Nutze das Fahrrad für Kurzstrecken"
                    )
                   ]),
            Friend(name: "Karl-Friedrich Boerne",
                   points: 220,
                   co2Saving: 61,
                   co2progress: 0.6,
                   pointProgress: 0.7,
                   targets: [
                    Target(
                        category: "Wäsche",
                        title: "Wasch Wäsche bei 30 statt 40 ¡C"
                    ),
                    Target(
                        category: "Energie",
                        title: "Schalte nachts Elektrogeräte aus"
                    )
                   ])
        ]
    }
}
