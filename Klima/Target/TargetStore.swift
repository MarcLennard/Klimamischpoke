//
//  TargetStore.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import Foundation
import CSV

class TargetStore: ObservableObject {
    @Published var targets: [Target] = []
    @Published var selectedTargets: Set<Target> = []
    
    init() {
        targets = (try? readTargets()) ?? []
        selectedTargets = (try? readSelectedTargets()) ?? Set<Target>()
    }
    
    func setTargets(_ targets: Set<Target>) throws {
        let encoder = JSONEncoder()
        
        selectedTargets = targets
        
        let newData = try encoder.encode(targets.map { $0 })
        UserDefaults.standard.setValue(newData, forKey: "my-targets")
    }
    
    func addTarget(_ target: Target) throws {
        let decoder = JSONDecoder()
        let encoder = JSONEncoder()
        
        var myTargetsData = try UserDefaults.standard.data(forKey: "my-targets")
            .flatMap { try decoder.decode([Target].self, from: $0) } ?? []
        myTargetsData.append(target)
        
        targets = myTargetsData
        
        let newData = try encoder.encode(myTargetsData)
        UserDefaults.standard.setValue(newData, forKey: "my-targets")
    }
    
    private func readSelectedTargets() throws -> Set<Target> {
        let decoder = JSONDecoder()
        
        let myTargetsData = try UserDefaults.standard.data(forKey: "my-targets")
            .flatMap { try decoder.decode([Target].self, from: $0) } ?? []
        
        return Set<Target>(myTargetsData)
    }
    
    private func readTargets() throws -> [Target] {
        let stream = Bundle.main.url(forResource: "individuelle_ziele", withExtension: "csv")
            .flatMap { InputStream(url: $0) }
        guard stream != nil else {
            return []
        }
        
        var targets = [Target]()
        let reader = try CSVReader(stream: stream!, hasHeaderRow: true)
        let decoder = CSVRowDecoder()
        while reader.next() != nil {
            let target = try decoder.decode(Target.self, from: reader)
            targets.append(target)
        }
        return targets
    }
}
