//
//  TargetView.swift
//  Klima
//
//  Created by Marc Lennard Vlaminck on 25.09.20.
//

import SwiftUI

struct TargetsView: View {
    @EnvironmentObject private var targetStore: TargetStore
    
    var body: some View {
        NavigationView {
            Group {
                if targetStore.selectedTargets.count == 0 {
                    Text("Du hast keine Ziele ausgesucht")
                }
                else {
                    ScrollView {
                        LazyVStack {
                                ForEach(targetStore.selectedTargets.map { $0 }) { target in
                                    TargetView(target: target)
                                }
                            }
                        .padding()
                    }
                }
            }
            .navigationBarItems(trailing: AddTargetButton(selectedTargets: $targetStore.selectedTargets, callback: { targets in
                try? targetStore.setTargets(targets)
            }))
            .navigationTitle("Meine Ziele")

        }
    }
}

struct TargetsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetsView()
            .environmentObject(TargetStore())
    }
}
