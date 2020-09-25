//
//  Target.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import Foundation

struct Target: Codable {
    var category: String
    var title: String
    var problem: String?
    var howTo: String?
    var achievment: String?
    var points: Int?
    var co2Saving: Double?
    var yearlyCo2Saving: Double?
    var duration: TimeInterval?
    var information: String?
    
    enum CodingKeys: String, CodingKey {
        case category = "Kategorie"
        case title = "Titel"
        case problem = "Problem"
        case howTo = "Wie"
        case achievment = "Was"
        case points = "Punkte"
        case co2Saving = "CO2 einzeln"
        case yearlyCo2Saving = "CO2 jährlich"
        case duration = "Dauer (Wochen)"
        case information = "Infos"
    }
}

extension Target: Hashable {
    
}

extension Target: Identifiable {
    var id: Int {
        return self.hashValue
    }
}
