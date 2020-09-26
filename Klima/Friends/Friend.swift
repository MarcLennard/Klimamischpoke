//
//  Friend.swift
//  Klima
//
//  Created by Kevin Klaebe on 26.09.20.
//

import Foundation

struct Friend {
    var name: String
    var points: Int
    var co2Saving: Int
    var co2progress: Double
    var pointProgress: Double
    var targets: [Target]
}

extension Friend: Identifiable {
    var id: String {
        return name
    }
}
